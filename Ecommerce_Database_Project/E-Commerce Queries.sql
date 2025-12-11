-- Show all orders with customer names
USE EcommerceDB
GO

SELECT  
    o.OrderId,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    o.OrderDate,
    o.Status
FROM Orders o
JOIN Customers c
    ON o.CustomerId = c.CustomerId;


-- Show order details (products per order)

SELECT o.OrderId, p.Name AS Product, oi.Quantity, oi.UnitPrice
FROM OrderItems oi
JOIN Orders o
ON oi.OrderId=o.OrderId
JOIN Products p
ON oi.ProductId=p.ProductId
ORDER BY o.OrderId;

-- Total price per order

SELECT o.OrderId, SUM(oi.Quantity*oi.UnitPrice) AS OrderTotal
FROM Orders o
JOIN OrderItems oi ON o.OrderId=oi.OrderId
GROUP BY o.OrderId;

--Total spending per customer

SELECT *
FROM Customers

SELECT *
FROM Orders

SELECT * 
FROM OrderItems

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Customer, 
SUM(oi.Quantity * oi.unitPrice) AS TotalSpent
FROM Orders o
JOIN Customers c ON c.CustomerId=o.CustomerId
JOIN OrderItems oi
ON o.OrderId=oi.OrderId
GROUP BY CONCAT(c.FirstName, ' ', c.LastName)
ORDER BY TotalSpent DESC;

-- Best-selling products

SELECT *
FROM Products

SELECT p.Name, SUM(oi.Quantity) AS TotalSold
FROM Products p
JOIN OrderItems oi
ON p.ProductId=oi.ProductId
GROUP BY p.Name
ORDER BY TotalSold DESC;

-- Orders with more than 1 item (HAVING)

SELECT *
FROM OrderItems

SELECT OrderId, COUNT(*) AS ItemsCount
FROM OrderItems 
GROUP BY OrderId
HAVING COUNT(*)>1

-- Customers who NEVER placed an order

SELECT * 
FROM Customers

SELECT *
FROM Orders

SELECT *
FROM OrderItems

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Customer
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerId=o.CustomerId
WHERE o.OrderId IS NULL;

-- Products out of stock or low stock

SELECT  
    Name,
    Stock
FROM Products
WHERE Stock <= 5
ORDER BY Stock ASC;

-- List all customers with the number of orders they placed

SELECT CONCAT(c.FirstName, ' ', c.LastName) as Customer, 
COUNT(o.OrderId) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON o.CustomerId=c.CustomerId
GROUP BY CONCAT(c.FirstName, ' ', c.LastName)

-- Find customers who placed more than 2 orders

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS Customer, 
COUNT(o.OrderId) AS TotalOrders
FROM Customers c 
JOIN Orders o ON c.CustomerId=o.CustomerId
GROUP BY CONCAT(c.FirstName, ' ', c.LastName)
HAVING COUNT(o.OrderId) > 2

-- List all products with their category names

SELECT *
FROM Products

SELECT *
FROM Categories

SELECT c.Name AS CategoryName, p.Name AS Product, p.Price
FROM Products p 
JOIN Categories c ON p.CategoryId=c.CategoryId

-- Find products that are out of stock

SELECT Name AS Product, Stock
FROM Products
WHERE Stock=0;

-- List all orders with total order amount

SELECT 
    o.OrderId,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerId = c.CustomerId
JOIN OrderItems oi ON o.OrderId = oi.OrderId
GROUP BY o.OrderId, CONCAT(c.FirstName, ' ', c.LastName);

-- Find the most expensive product

SELECT TOP 1 *
FROM Products
ORDER BY Price DESC;


-- Show customers who bought a specific product (e.g., 'Laptop')

SELECT DISTINCT CONCAT(c.FirstName, ' ', c.LastName) AS Customer
FROM Customers c
JOIN Orders o ON c.CustomerId=o.CustomerId
JOIN OrderItems oi ON oi.OrderId=o.OrderId
JOIN Products p ON oi.ProductId=p.ProductId
WHERE p.Name='Laptop';

-- Find categories with more than 3 products

SELECT 
    c.Name AS Category,
    COUNT(p.ProductId) AS TotalProducts
FROM Categories c
JOIN Products p ON c.CategoryId = p.CategoryId
GROUP BY c.Name
HAVING COUNT(p.ProductId) > 3;
