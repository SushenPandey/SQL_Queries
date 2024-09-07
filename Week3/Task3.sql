create table Functions(x int,y int);
INSERT INTO Functions(X, Y)
VALUES (20, 20),
       (20, 20),
       (20, 21),
       (23, 22),
       (22, 23),
       (21, 20);



SELECT p1.x AS X1, p1.y AS Y1
FROM Functions AS p1
JOIN Functions AS p2 ON p1.X = p2.Y AND p1.Y = p2.X
WHERE p1.X <> p2.X;
