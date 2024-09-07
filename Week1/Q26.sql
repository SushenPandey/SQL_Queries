SELECT e.SupervisorID,
       m.FirstName AS SupervisorFirstName,
       m.LastName AS SupervisorLastName,
       COUNT(e.EmployeeID) AS NumberOfSubordinates
FROM Employees e
JOIN Employees m ON e.SupervisorID = m.EmployeeID
GROUP BY e.SupervisorID, m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) > 4;
