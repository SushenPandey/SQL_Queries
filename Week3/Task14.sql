SELECT 
    Sub_Band,
    COUNT(Employee_ID) AS Headcount,
    (COUNT(Employee_ID) * 100.0 / (SELECT COUNT(*) FROM EMPLOYEES)) AS Percentage_Headcount
FROM EMPLOYEES
GROUP BY Sub_Band;
