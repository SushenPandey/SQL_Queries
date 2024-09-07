SELECT 
    Job_Family,
    SUM(CASE WHEN Location = 'India' THEN Cost ELSE 0 END) AS Cost_India,
    SUM(CASE WHEN Location = 'International' THEN Cost ELSE 0 END) AS Cost_International,
    CASE
        WHEN SUM(Cost) = 0 THEN NULL
        ELSE (SUM(CASE WHEN Location = 'India' THEN Cost ELSE 0 END) / SUM(Cost)) * 100
    END AS Percentage_India,
    CASE
        WHEN SUM(Cost) = 0 THEN NULL
        ELSE (SUM(CASE WHEN Location = 'International' THEN Cost ELSE 0 END) / SUM(Cost)) * 100
    END AS Percentage_International
FROM JOB_COST
GROUP BY Job_Family;
