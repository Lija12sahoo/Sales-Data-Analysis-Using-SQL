CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Date DATE,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10,2)
);
INSERT INTO Sales (SaleID, Date, CustomerID, ProductID, Quantity, TotalAmount)
VALUES (1, '2024-03-10', 101, 2001, 3, 150.00);
SELECT SUM(TotalAmount) AS TotalRevenue FROM Sales;
SELECT COUNT(SaleID) AS TotalOrders FROM Sales;    
SELECT ProductID, SUM(Quantity) AS TotalSold
FROM Sales
GROUP BY ProductID
ORDER BY TotalSold DESC
LIMIT 5;
SELECT 
    DATE_FORMAT(Date, '%Y-%m') AS Month, 
FROM Sales
GROUP BY Month
ORDER BY Month;
SELECT Employees.Name, COUNT(Sales.SaleID) AS TotalSales
FROM Sales
JOIN Employees ON Sales.EmployeeID = Employees.EmployeeID
GROUP BY Employees.Name
ORDER BY TotalSales DESC;
SELECT 
    SUM(TotalAmount) / COUNT(SaleID) AS AvgOrderValue
FROM Sales;
SELECT Customers.Name, SUM(Sales.TotalAmount) AS TotalSpent
FROM Sales
JOIN Customers ON Sales.CustomerID = Customers.CustomerID
GROUP BY Customers.Name
ORDER BY TotalSpent DESC
LIMIT 5;
SELECT Products.Category, SUM(Sales.TotalAmount) AS Revenue
FROM Sales
JOIN Products ON Sales.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY Revenue DESC;
