create table occupations(Name varchar(10),Occupations varchar(10));

insert into occupations values('samantha','Doctor'),
('julia','Actor'),('maria','Actor'),('meera','Singer'),('Ashely','Professor'),('Ketty','Professor'),('Jane','Actor'),('Jenny','Doctor'),('Priya','Singer');

WITH SortedNames AS (
    SELECT 
        Name,
        Occupations,
        ROW_NUMBER() OVER (PARTITION BY Occupations ORDER BY Name) AS RowNum
    FROM OCCUPATIONS
),
PivotedNames AS (
    SELECT
        MAX(CASE WHEN Occupations = 'Doctor' THEN Name END) AS Doctor,
        MAX(CASE WHEN Occupations = 'Professor' THEN Name END) AS Professor,
        MAX(CASE WHEN Occupations = 'Singer' THEN Name END) AS Singer,
        MAX(CASE WHEN Occupations = 'Actor' THEN Name END) AS Actor,
        RowNum
    FROM SortedNames
    GROUP BY RowNum
)
SELECT Doctor, Professor, Singer, Actor
FROM PivotedNames
ORDER BY RowNum;
