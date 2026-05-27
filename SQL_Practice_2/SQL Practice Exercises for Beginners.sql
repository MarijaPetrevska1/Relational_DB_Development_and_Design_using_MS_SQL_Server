USE SalesDB
-- 1. Retrieve all columns from the Sales table.

SELECT *
FROM Sales


-- 2. Retrieve the product_name and unit_price from the Products table.

SELECT p.product_name AS ProductName, p.unit_price AS Unit_price
FROM Products p

-- 3. Retrieve the sale_id and sale_date from the Sales table.

SELECT s.sale_id AS Sale_Id, s.sale_date AS Sale_Date
FROM Sales s


-- 4. Filter the Sales table to show only sales with a total_price greater than $100.

SELECT *
FROM Sales s
WHERE s.total_price>100;

-- 5. Filter the Products table to show only products in the 'Electronics' category.

SELECT p.product_name AS Product_Name, p.category AS Category
FROM Products p
WHERE p.category = 'Electronics';

--  6. Retrieve the sale_id and total_price from the Sales table for sales made on January 3, 2024.

SELECT s.sale_id AS Sale_Id, s.total_price AS Total_Price
FROM Sales s
WHERE s.sale_date = '2024-01-03';

-- 7. Retrieve the product_id and product_name from the Products table for products with a unit_price greater than $100.

SELECT p.product_id AS ProductId, p.product_name AS Product_Name
FROM Products p
WHERE p.unit_price>100;

-- 8. Calculate the total revenue generated from all sales in the Sales table.

SELECT SUM(total_price) AS totalRevenue
FROM Sales

-- 9. Calculate the average unit_price of products in the Products table.

SELECT AVG(unit_price) AS UnitPrice
FROM Products p

-- 10. Calculate the total quantity_sold from the Sales table.

SELECT COUNT(quantity_sold) AS total_quantity_sold
FROM Sales;

-- 11. Count Sales Per Day from the Sales table

SELECT sale_date, COUNT(*) AS sales_count
FROM Sales
GROUP BY sale_date
ORDER BY sale_date;


-- 12. Retrieve product_name and unit_price from the Products table with the Highest Unit Price

SELECT p.product_name, p.unit_price
FROM Products p
WHERE p.unit_price = (
	SELECT MAX(unit_price)
	FROM Products
);

-- 13. Retrieve the sale_id, product_id, and total_price 
-- from the Sales table for sales with a quantity_sold greater than 4.

SELECT s.sale_id AS SaleId, s.product_id AS ProductId, s.total_price AS TotalPrice
FROM Sales s
WHERE s.quantity_sold > 4;


-- 14. Retrieve the product_name and unit_price from the 
-- Products table, ordering the results by unit_price in descending order.
 SELECT *
 FROM Products

 SELECT *
 FROM Sales

 SELECT p.product_name, p.unit_price
 FROM Products p
 ORDER BY p.unit_price DESC;

 -- 15. Retrieve the total_price of all sales, 
 -- rounding the values to two decimal places.

 SELECT ROUND(SUM(s.total_price), 2) AS Total_Price
 FROM Sales s

 -- 16. Calculate the average total_price of sales in the Sales table.

 SELECT AVG(s.total_price) AS Average_total_price
 FROM Sales s

 -- 17. Retrieve the sale_id and sale_date from the 
 -- Sales table, formatting the sale_date as 'YYYY-MM-DD'.

  SELECT *
 FROM Products

 SELECT *
 FROM Sales

SELECT s.sale_id, 
	CONVERT(VARCHAR(10), s.sale_date, 23) AS sale_date
FROM Sales s

--18. Calculate the total revenue generated from
-- sales of products in the 'Electronics' category.

SELECT SUM(s.total_price) AS total_Revenue
FROM Sales s JOIN Products p ON 
p.product_id = s.product_id 
WHERE p.category = 'Electronics';

--19. Retrieve the product_name and unit_price
-- from the Products table, filtering the unit_price to 
-- show only values between $20 and $600.

SELECT * 
FROM Sales
SELECT *
FROM Products

SELECT p.product_name AS ProductName, p.unit_price
FROM Products p
WHERE p.unit_price BETWEEN 20 AND 60;


-- 20. Retrieve the product_name and category from the 
-- Products table, ordering the results by category in ascending order.

SELECT p.product_name, p.category
FROM Products p
ORDER BY p.category ASC;
