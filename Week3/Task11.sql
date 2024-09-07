CREATE TABLE Friends (
    ID INT PRIMARY KEY,
    Friend_ID INT
);

CREATE TABLE Students (
    ID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE Packages (
    ID INT PRIMARY KEY,
    Salary DECIMAL(10, 2)
);


INSERT INTO Friends (ID, Friend_ID)
VALUES
    (1, 2),
    (2, 3),
    (3, 4),
    (4, 1);


INSERT INTO Students (ID, Name)
VALUES
    (1, 'Ashley'),
    (2, 'Samantha'),
    (3, 'Julia'),
    (4, 'Scarlet');


INSERT INTO Packages (ID, Salary)
VALUES
    (1, 15.20),
    (2, 10.06),
    (3, 11.55);


	SELECT S.name
FROM Students S
JOIN Friends F ON S.ID = F.ID
JOIN Packages P ON S.ID = P.ID
JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P2.Salary > P.Salary
ORDER BY P2.Salary;
