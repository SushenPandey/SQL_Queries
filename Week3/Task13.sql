SELECT 
    BU,
    Month,
    Cost,
    Revenue,
    CASE
        WHEN Revenue = 0 THEN NULL
        ELSE Cost / Revenue
    END AS Cost_to_Revenue_Ratio
FROM BU_FINANCES;
