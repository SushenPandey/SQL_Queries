
SELECT OrderDate, SUM(TotalAmount) AS TotalAmount
FROM Orders
GROUP BY OrderDate
ORDER BY TotalAmount DESC
LIMIT 1;