USE week2;

GO

-- Drop the existing stored procedure if it exists
IF OBJECT_ID('GetOrderDetails', 'P') IS NOT NULL
    DROP PROCEDURE GetOrderDetails;

GO

-- Create the new stored procedure
CREATE PROCEDURE GetOrderDetails
    @OrderID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if there are any records for the given OrderID
    IF NOT EXISTS (SELECT 1 FROM SalesOrderDetail WHERE SalesOrderID = @OrderID)
    BEGIN
        PRINT 'The OrderID ' + CAST(@OrderID AS NVARCHAR(10)) + ' does not exist';
        RETURN 1;
    END

    -- If records exist, return them
    SELECT SalesOrderDetailID, SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount
    FROM SalesOrderDetail
    WHERE SalesOrderID = @OrderID;
END;
GO
