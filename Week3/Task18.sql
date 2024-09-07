SELECT 
    BU,
    Month,
    SUM(Cost) AS Total_Cost,
    SUM(Cost * Employee_Weight) / SUM(Employee_Weight) AS Weighted_Average_Cost
FROM EMPLOYEE_COST
GROUP BY BU, Month;
