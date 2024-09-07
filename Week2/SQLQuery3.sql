USE week2

GO

-- Drop the existing stored procedure if it exists
IF OBJECT_ID('InsertOrderDetails', 'P') IS NOT NULL
    DROP PROCEDURE InsertOrderDetails;

GO

-- Create the new stored procedure
CREATE PROCEDURE InsertOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice DECIMAL(19, 4) = NULL,
    @Quantity INT,
    @Discount DECIMAL(4, 2) = 0
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProductUnitPrice DECIMAL(19, 4);
    DECLARE @UnitsInStock INT;
    DECLARE @ReorderLevel INT;

    BEGIN TRY
        -- Fetch the UnitPrice from Product table if not provided
        IF @UnitPrice IS NULL
        BEGIN
            SELECT @ProductUnitPrice = ListPrice
            FROM Product
            WHERE ProductID = @ProductID;
        END
        ELSE
        BEGIN
            SET @ProductUnitPrice = @UnitPrice;
        END

        -- Fetch UnitsInStock and ReorderLevel
        SELECT @UnitsInStock = pi.Quantity,
               @ReorderLevel = p.SafetyStockLevel
        FROM ProductInventory pi
        JOIN Product p ON pi.ProductID = p.ProductID
        WHERE pi.ProductID = @ProductID;

        -- Check if enough stock is available
        IF @UnitsInStock < @Quantity
        BEGIN
            PRINT 'Not enough stock available. The order cannot be placed.';
            RETURN;
        END

        -- Insert the order details
        INSERT INTO SalesOrderDetail (SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount)
        VALUES (@OrderID, @ProductID, @Quantity, @ProductUnitPrice, @Discount);

        -- Check if the order was inserted successfully
        IF @@ROWCOUNT = 0
        BEGIN
            PRINT 'Failed to place the order. Please try again.';
            RETURN;
        END

        -- Adjust the quantity in stock
        UPDATE ProductInventory
        SET Quantity = Quantity - @Quantity
        WHERE ProductID = @ProductID;

        -- Check if the stock level drops below the reorder level
        IF (@UnitsInStock - @Quantity) < @ReorderLevel
        BEGIN
            PRINT 'Warning: The quantity in stock has dropped below the reorder level.';
        END

        PRINT 'Order placed successfully.';

    END TRY
    BEGIN CATCH
        -- Handle any errors that occurred during the transaction
        PRINT 'An error occurred. Please try again.';
    END CATCH

END;
GO


