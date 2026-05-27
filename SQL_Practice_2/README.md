
# SQL concepts for the queries:

================================================================================
 1. SELECT + WHERE (Filtering data) ===> Used to filter rows.

SELECT *

FROM Products

WHERE unit_price > 100; 

 2. ORDER BY (Sorting) ===> Used to sort results.

ORDER BY unit_price DESC;

ASC	smallest → largest

DESC	largest → smallest

 3. Aggregate Functions
   
SUM()

AVG()

COUNT()

MAX()

MIN()

 4. GROUP BY ===> Used when combining aggregates with columns.

SELECT category, AVG(unit_price)

FROM Products

GROUP BY category;

 5. JOIN (Core SQL concept) ===> Used to combine tables.

SELECT *

FROM Sales s

JOIN Products p

ON s.product_id = p.product_id;

 6. LEFT JOIN + IS NULL (Find missing records)

Used to find records that do NOT exist in another table.

Example: products that were never sold

SELECT p.product_name

FROM Products p

LEFT JOIN Sales s

ON p.product_id = s.product_id

WHERE s.product_id IS NULL;

 7. Subqueries ===> Used when comparing with aggregated values. 

Used with: AVG, MAX, MIN, SUM.

WHERE quantity_sold >

(

    SELECT AVG(quantity_sold)
    
    FROM Sales
    
)

 8. LIKE (Text search)

'Smart%' => starts with Smart

'%phone' => ends with phone

'%art%' => contains art

 9. BETWEEN (Range filtering)

WHERE unit_price BETWEEN 20 AND 600;
    
 10. DATE Functions

YEAR()

MONTH()

GETDATE()

DATEDIFF()

 11. CASE WHEN => SQL IF/ELSE

CASE 

    WHEN total_price > 1000 THEN 'High'
    
    ELSE 'Low'
    
END


  
   
   
