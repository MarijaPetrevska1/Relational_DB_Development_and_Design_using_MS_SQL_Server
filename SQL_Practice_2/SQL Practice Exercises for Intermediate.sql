USE SalesDB

-- 1. Calculate the total quantity_sold of products in the 'Electronics' 
-- category.

SELECT *
FROM Products

SELECT *
FROM Sales


SELECT SUM(s.quantity_sold) AS TotalQuantitySOLD
FROM Sales s JOIN Products p 
ON s.product_id = p.product_id
WHERE p.category = 'Electronics';

-- 2. Retrieve the product_name and total_price from the Sales table, 
-- calculating the total_price as quantity_sold multiplied by unit_price.


SELECT 
    p.product_name AS ProductName,
    (s.quantity_sold * p.unit_price) AS TotalPrice
FROM Products p
JOIN Sales s 
    ON p.product_id = s.product_id;


-- 3. Identify the Most Frequently Sold Product from Sales table

SELECT TOP 1 p.product_name, COUNT(*) AS sales_count
FROM Sales s
JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY sales_count DESC;

-- 4. Find the Products Not Sold from Products table

SELECT product_id, product_name 
FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Sales);

SELECT *
FROM Products

SELECT *
FROM Sales

SELECT p.product_id, p.product_name
FROM Products p
LEFT JOIN Sales s
ON p.product_id = s.product_id
WHERE s.product_id IS NULL;

-- 5. Calculate the total revenue generated from sales 
-- for each product category.

SELECT SUM(s.total_price) AS TotalPrice, p.category AS Category
FROM Sales s JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.category;

-- 6. Find the product category with the highest average unit price.

SELECT TOP 1 p.category, AVG(p.unit_price) AS avg_unit_price
FROM Products p
GROUP BY p.category
ORDER BY avg_unit_price DESC

--7. Identify products with total sales exceeding 30.

SELECT p.product_name
FROM Sales s JOIN Products p
ON s.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(s.total_price) > 30;

-- 8. Count the number of sales made in each month.

SELECT *
FROM Sales

SELECT MONTH(s.sale_date) AS SaleMonth, COUNT(*) AS NumberOfSales
FROM Sales s
GROUP BY MONTH(s.sale_date)
ORDER BY SaleMonth

-- 9. Retrieve Sales Details for Products with 'Smart' in Their Name

SELECT * 
FROM Sales
SELECT * 
FROM Products

SELECT s.sale_id, s.product_id, p.product_name, p.category
FROM Sales s JOIN Products p
ON s.product_id = p.product_id
WHERE p.product_name LIKE 'Smart%';


--10. Determine the average quantity sold for products with a unit price 
-- greater than $100.

SELECT AVG(s.quantity_sold) AS Avg_quantity_sold
FROM Sales s JOIN Products p
ON s.product_id = p.product_id
WHERE p.unit_price > 100;

-- 11. Retrieve the product name and total sales revenue for each product.

SELECT * 
FROM SALES
SELECT *
FROM Products

SELECT p.product_name AS ProductName, SUM(s.total_price) AS total_Revenue
FROM Products p JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name

-- 12. List all sales along with the corresponding product names.

SELECT s.sale_id, p.product_name, s.quantity_sold, s.sale_date, s.total_price
FROM Sales s JOIN Products p
ON s.product_id = p.product_id;


-- 13. Retrieve the product name and total sales revenue for each product.

SELECT p.product_name, SUM(s.total_price) AS TotalRevenue
FROM Sales s JOIN Products p
ON p.product_id = s.product_id
GROUP BY p.product_name

-- 14. Rank products based on total sales revenue. 

SELECT p.product_name, SUM(s.total_price) AS TotalRevenue
FROM Products p JOIN Sales s
ON p.product_id = s.product_id
GROUP BY p.product_name
ORDER BY TotalRevenue DESC;

-- 15. Calculate the running total revenue for each product category.

SELECT 
    p.category,
    s.sale_date,
    s.total_price,
    SUM(s.total_price) OVER (
        PARTITION BY p.category
        ORDER BY s.sale_date
    ) AS RunningTotalRevenue
FROM Products p
JOIN Sales s
    ON p.product_id = s.product_id;

-- 16. Categorize sales as "High", "Medium", or "Low" based on total price 
-- (e.g., > $200 is High, $100-$200 is Medium, < $100 is Low).

SELECT sale_id,
	CASE 
		WHEN total_price > 200 THEN 'High'
		WHEN total_price BETWEEN 100 AND 200 THEN 'Medium'
		ELSE 'Low'
	END AS sales_category
FROM Sales;

-- 17. Identify sales where the quantity sold is greater than the average quantity sold.

SELECT s.sale_id, s.product_id, p.product_name
FROM Products p
JOIN Sales s
    ON p.product_id = s.product_id
WHERE s.quantity_sold>
	(
	SELECT AVG(s.quantity_sold)
	FROM Sales s
	);

-- 18. Extract the month and year from the sale date 
-- and count the number of sales for each month.

SELECT *
FROM Sales
SELECT *
FROM Products


SELECT 
	YEAR(s.sale_date) AS SaleYear, 
	MONTH(s.sale_date) AS SaleMonth, 
	COUNT(*) AS NumberOfSales
FROM Sales s
GROUP BY YEAR(s.sale_date), MONTH(s.sale_date)
ORDER BY SaleYear, SaleMonth;