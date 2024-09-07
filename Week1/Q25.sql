SELECT e.EmployeeID,
       e.FirstName,
       e.LastName,
       COALESCE(SUM(o.TotalAmount), 0) AS TotalSales
FROM Employees e
LEFT JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;
