use  week2;

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Name NVARCHAR(50),
    ListPrice DECIMAL(19, 4),
    SafetyStockLevel INT
);

CREATE TABLE ProductInventory (
    ProductID INT PRIMARY KEY,
    Quantity INT
);

CREATE TABLE SalesOrderDetail (
    SalesOrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    SalesOrderID INT,
    ProductID INT,
    OrderQty INT,
    UnitPrice DECIMAL(19, 4),
    UnitPriceDiscount DECIMAL(4, 2)
);

INSERT INTO Product (ProductID, Name, ListPrice, SafetyStockLevel)
VALUES (1, 'Product A', 100.00, 10),
       (2, 'Product B', 200.00, 15);

INSERT INTO ProductInventory (ProductID, Quantity)
VALUES (1, 50),
       (2, 20);

