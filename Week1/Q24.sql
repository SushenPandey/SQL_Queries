SELECT e.FirstName AS EmployeeFirstName,
       e.LastName AS EmployeeLastName,
       s.FirstName AS SupervisorFirstName,
       s.LastName AS SupervisorLastName
FROM Employees e
LEFT JOIN Employees s ON e.SupervisorID = s.EmployeeID;
