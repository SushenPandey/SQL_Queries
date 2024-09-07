SELECT o.ShipCountry, SUM(o.TotalAmount) AS TotalSales
FROM Orders o
GROUP BY o.ShipCountry
ORDER BY TotalSales DESC
LIMIT 10;
