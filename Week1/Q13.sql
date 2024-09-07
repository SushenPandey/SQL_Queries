
SELECT OrderID, AVG(Quantity) AS AverageQuantity
FROM OrderDetails
GROUP BY OrderID;