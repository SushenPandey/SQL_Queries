SELECT p.SupplierID, COUNT(p.ProductID) AS NumberOfProducts
FROM Products p
GROUP BY p.SupplierID;
