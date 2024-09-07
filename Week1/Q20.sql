SELECT ShipCountry, SUM(TotalAmount) AS TotalSales
FROM Orders
GROUP BY ShipCountry;
