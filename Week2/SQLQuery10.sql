-- Test the stored procedure with valid parameters
EXEC DeleteOrderDetails @OrderID = 1, @ProductID = 1;
-- Expected output: Order details deleted successfully.

-- Test the stored procedure with invalid OrderID
EXEC DeleteOrderDetails @OrderID = 9999, @ProductID = 1;
-- Expected output: Invalid OrderID. The OrderID 9999 does not exist.

-- Test the stored procedure with invalid ProductID
EXEC DeleteOrderDetails @OrderID = 1, @ProductID = 9999;
-- Expected output: Invalid ProductID. The ProductID 9999 does not exist in the specified OrderID.
