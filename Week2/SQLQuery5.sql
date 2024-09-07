USE week2;

GO

-- Drop the existing stored procedure if it exists
IF OBJECT_ID('UpdateOrderDetails', 'P') IS NOT NULL
    DROP PROCEDURE UpdateOrderDetails;

GO

-- Create the new stored procedure
CREATE PROCEDURE UpdateOrderDetails
    @OrderID INT,
    @ProductID INT,
    @UnitPrice DECIMAL(19, 4) = NULL,
    @Quantity INT = NULL,
    @Discount DECIMAL(4, 2) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CurrentUnitPrice DECIMAL(19, 4);
    DECLARE @CurrentQuantity INT;
    DECLARE @CurrentDiscount DECIMAL(4, 2);
    DECLARE @OldQuantity INT;
    DECLARE @NewQuantity INT;

    BEGIN TRY
        -- Retrieve current values from SalesOrderDetail
        SELECT @CurrentUnitPrice = UnitPrice,
               @CurrentQuantity = OrderQty,
               @CurrentDiscount = UnitPriceDiscount
        FROM SalesOrderDetail
        WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;

        -- Use ISNULL() to retain existing values if parameters are NULL
        SET @CurrentUnitPrice = ISNULL(@UnitPrice, @CurrentUnitPrice);
        SET @CurrentDiscount = ISNULL(@Discount, @CurrentDiscount);

        -- Calculate the new quantity (for stock adjustment)
        SET @NewQuantity = ISNULL(@Quantity, @CurrentQuantity);
        SET @OldQuantity = @CurrentQuantity;

        -- Update the order details
        UPDATE SalesOrderDetail
        SET UnitPrice = @CurrentUnitPrice,
            OrderQty = @NewQuantity,
            UnitPriceDiscount = @CurrentDiscount
        WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;

        -- Adjust the quantity in stock
        UPDATE ProductInventory
        SET Quantity = Quantity - (@NewQuantity - @OldQuantity)
        WHERE ProductID = @ProductID;

        PRINT 'Order updated successfully.';

    END TRY
    BEGIN CATCH
        -- Handle any errors that occurred during the transaction
        PRINT 'An error occurred. Please try again.';
    END CATCH

END;
GO
