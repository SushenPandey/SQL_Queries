SELECT DISTINCT Customers.*
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID;