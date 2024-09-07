SELECT SupervisorID, COUNT(EmployeeID) AS NumEmployees
FROM Employees
GROUP BY SupervisorID;