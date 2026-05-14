-- 1. All cities in USA with population > 100000
SELECT *
FROM CITY
WHERE CountryCode = 'USA'
  AND Population > 100000;


-- 2. All columns from CITY
SELECT *
FROM CITY;


-- 3. City with ID = 1661
SELECT *
FROM CITY
WHERE ID = 1661;


-- 4. All Japanese cities (JPN)
SELECT *
FROM CITY
WHERE CountryCode = 'JPN';


-- 5. Names of Japanese cities
SELECT Name
FROM CITY
WHERE CountryCode = 'JPN';


-- 6. City and State from STATION
SELECT City, State
FROM STATION;


-- 7. Cities with even ID (no duplicates)
SELECT DISTINCT City
FROM STATION
WHERE MOD(ID, 2) = 0;


-- 8. Difference between total and distinct CITY entries
SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;


-- 9. Shortest city name + length
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1;


-- 10. Longest city name + length
SELECT CITY, LENGTH(CITY)
FROM STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1;


-- 11. Cities starting with vowels (no duplicates)
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%'
   OR CITY LIKE 'E%'
   OR CITY LIKE 'I%'
   OR CITY LIKE 'O%'
   OR CITY LIKE 'U%';


-- 12. Cities starting AND ending with vowels
SELECT DISTINCT CITY
FROM STATION
WHERE (CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
  AND (CITY LIKE '%A' OR CITY LIKE '%E' OR CITY LIKE '%I' OR CITY LIKE '%O' OR CITY LIKE '%U');