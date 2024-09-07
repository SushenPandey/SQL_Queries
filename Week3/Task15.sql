SELECT Employee_ID, Name, Salary
FROM (
    SELECT Employee_ID, Name, Salary,
           ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Rank
    FROM EMPLOYEES
) AS RankedEmployees
WHERE Rank <= 5;
