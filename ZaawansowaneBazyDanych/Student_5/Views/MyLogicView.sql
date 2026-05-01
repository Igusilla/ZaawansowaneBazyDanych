CREATE VIEW Student_5.MyLogicView AS
SELECT TOP(100) PERCENT ProductID, Name ProductName, StandardCost, ListPrice,
(ListPrice - StandardCost) Profit, ((ListPrice - StandardCost)/ListPrice) * 100 [Marza (%)]
FROM SalesLT.Product