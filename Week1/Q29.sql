SELECT o.*
FROM Orders o
WHERE o.CustomerID = (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    ORDER BY SUM(TotalAmount) DESC
    LIMIT 1
);
