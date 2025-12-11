USE EcommerceDB
GO

-- View: Active Products with Category
 
CREATE VIEW ActiveProducts AS
SELECT p.ProductId, p.Name, p.Price, c.Name AS Category
FROM Products p
JOIN Categories c ON p.CategoryId = c.CategoryId
WHERE p.IsActive = 1;
GO

-- View: Order Income Overview

CREATE VIEW OrderPrices AS
SELECT 
    o.OrderId,
    SUM(oi.Quantity * oi.UnitPrice) AS TotalAmount
FROM Orders o
JOIN OrderItems oi ON o.OrderId = oi.OrderId
GROUP BY o.OrderId;
GO

