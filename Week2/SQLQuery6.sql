-- Test the stored procedure with sample data
EXEC UpdateOrderDetails @OrderID = 1, @ProductID = 1, @Quantity = 10;
-- Expected output: Order updated successfully.

EXEC UpdateOrderDetails @OrderID = 2, @ProductID = 1, @UnitPrice = 120.00, @Discount = 0.05;
-- Expected output: Order updated successfully.

EXEC UpdateOrderDetails @OrderID = 1, @ProductID = 2, @UnitPrice = NULL, @Quantity = NULL, @Discount = 0.10;
-- Expected output: Order updated successfully.
