INSERT INTO Categories (Name)
VALUES
('Electronics'),
('Books'),
('Clothing'),
('Home & Kitchen');

INSERT INTO Customers (FirstName, LastName, Email, Phone)
VALUES
('John', 'Doe', 'john.doe@email.com', '070-111-222'),
('Alice', 'Johnson', 'alice.johnson@email.com', '071-222-333'),
('Mark', 'Smith', 'mark.smith@email.com', '072-333-444'),
('Emily', 'Brown', 'emily.brown@email.com', '075-444-555');

INSERT INTO Products (Name, Price, Stock, CategoryId)
VALUES
('Laptop', 1200.00, 10, 1),
('Smartphone', 800.00, 15, 1),
('SQL Fundamentals Book', 35.00, 50, 2),
('Cookbook', 25.00, 40, 2),
('T-Shirt', 15.00, 100, 3),
('Coffee Machine', 150.00, 20, 4);

INSERT INTO Orders (CustomerId, Status)
VALUES
(1, 'Completed'),
(2, 'Pending'),
(1, 'Completed'),
(3, 'Pending');

INSERT INTO OrderItems (OrderId, ProductId, Quantity, UnitPrice)
VALUES
-- Order 1 (John Doe)
(1, 1, 1, 1200.00),   -- Laptop
(1, 3, 2, 35.00),     -- SQL Book

-- Order 2 (Alice Johnson)
(2, 2, 1, 800.00),    -- Smartphone
(2, 5, 3, 15.00),     -- T-Shirts

-- Order 3 (John Doe)
(3, 6, 1, 150.00),    -- Coffee Machine

-- Order 4 (Mark Smith)
(4, 3, 1, 35.00),
(4, 4, 1, 25.00);

SELECT * FROM Customers;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderItems;

