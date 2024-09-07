create table Packages(ID int , Salary int);
create table Friends(ID int , Friend_ID int);
create table Students(ID int , Name varchar(10));


INSERT INTO Packages (ID, Salary)
VALUES (1, 15.20),
       (2, 10.06),
       (3, 11.55),
       (4, 12.12);
INSERT INTO Friends (ID, Friend_ID)
VALUES (1, 2),
       (2, 3),
       (3, 4),
       (4, 1);
INSERT INTO Students (ID, Name)
VALUES (1, 'Ashley'),
       (2, 'Samantha'),
       (3, 'Julia'),
       (4, 'Scarlet');


SELECT S.Name
FROM Students AS S
INNER JOIN Friends AS F ON S.ID = F.ID
INNER JOIN Packages AS P1 ON S.ID = P1.ID
INNER JOIN Packages AS P2 ON F.Friend_ID = P2.ID
WHERE P2.Salary > P1.Salary
ORDER BY P2.Salary;
