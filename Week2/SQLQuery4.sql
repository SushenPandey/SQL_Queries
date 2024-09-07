use week2

-- Test the stored procedure with sample data
EXEC InsertOrderDetails @OrderID = 1, @ProductID = 1, @Quantity = 5;
-- Expected output: Order placed successfully.