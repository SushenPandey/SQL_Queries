CREATE TRIGGER InsteadOfDelete_OrderDetails
ON <schema_name>.Orders
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Delete records from OrderDetails table
    DELETE FROM OrderDetails
    WHERE OrderID IN (SELECT deleted.OrderID FROM deleted);

    -- Delete the order from Orders table
    DELETE FROM <schema_name>.Orders
    WHERE OrderID IN (SELECT deleted.OrderID FROM deleted);
END;
