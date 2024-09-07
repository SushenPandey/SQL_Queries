WITH CorrectAverage AS (
    SELECT AVG(Salary) AS ActualAverage
    FROM EMPLOYEES
),
MiscalculatedAverage AS (
    SELECT AVG(NULLIF(Salary, 0)) AS MiscalculatedAverage
    FROM EMPLOYEES
)
SELECT CEILING(CorrectAverage.ActualAverage - MiscalculatedAverage.MiscalculatedAverage) AS ErrorAmount
FROM CorrectAverage, MiscalculatedAverage;
