create table tasks(Task_Id int , Start_Date varchar(15) , End_Date varchar(15));

INSERT INTO tasks (Task_Id, Start_Date, End_Date)
VALUES
    (1, '2015-10-01', '2015-10-02'),
    (2, '2015-10-02', '2015-10-03'),
    (3, '2015-10-03', '2015-10-04'),
    (4, '2015-10-13', '2015-10-14'),
    (5, '2015-10-14', '2015-10-15'),
    (6, '2015-10-28', '2015-10-29'),
    (7, '2015-10-30', '2015-10-31');

SELECT Start_Date, End_Date
FROM tasks
ORDER BY DATEDIFF(day, Start_Date, End_Date);

