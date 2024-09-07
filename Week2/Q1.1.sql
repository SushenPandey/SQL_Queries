USE week2;

GO

-- Drop the existing stored procedure if it exists
IF OBJECT_ID('DeleteOrderDetails', 'P') IS NOT NULL
    DROP PROCEDURE DeleteOrderDetails;

GO

-- Create the new stored procedure
CREATE PROCEDURE DeleteOrderDetails
    @OrderID INT,
    @ProductID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validate parameters
    IF NOT EXISTS (SELECT 1 FROM SalesOrderDetail WHERE SalesOrderID = @OrderID)
    BEGIN
        PRINT 'Invalid OrderID. The OrderID ' + CAST(@OrderID AS NVARCHAR(10)) + ' does not exist.';
        RETURN -1;
    END

    IF NOT EXISTS (SELECT 1 FROM SalesOrderDetail WHERE SalesOrderID = @OrderID AND ProductID = @ProductID)
    BEGIN
        PRINT 'Invalid ProductID. The ProductID ' + CAST(@ProductID AS NVARCHAR(10)) + ' does not exist in the specified OrderID.';
        RETURN -1;
    END

    -- Delete the record from Order Details table
    DELETE FROM SalesOrderDetail WHERE SalesOrderID = @OrderID AND ProductID = @ProductID;
    PRINT 'Order details deleted successfully.';
END;
GO
