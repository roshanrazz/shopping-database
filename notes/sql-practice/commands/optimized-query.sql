-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


---------------------------- check performace -----------------------------------

SET profiling = 1;

SHOW PROFILES;

SHOW PROFILE FOR QUERY 1;



---------------------------------- Example 1 --------------------------------------

-- Unoptimized Query
SELECT name
FROM students
WHERE grade = 'A';


-- Optimized Query
SELECT name
FROM students
WHERE grade = 'A'
LIMIT 10; -- Limit is used for optimization of query as only certain number of records will be returned


---------------------------------- Example 2 --------------------------------------

-- Unoptimized Query
-- Here we are using the YEAR() function to extract the year from the order_date column, which increases query performance
SELECT *
FROM orders
WHERE YEAR(order_date) = 2023;

-- Optimized Query
-- Here  we directly compare the order_date column with the specified date range, and if table is indexed query performs faster
SELECT *
FROM orders
WHERE order_date >= '2023-01-01' AND order_date < '2024-01-01';

--------------------------------------------- Example 3 ---------------------------------------------

-- Unoptimized Query

SELECT *
FROM customers
WHERE LOWER(first_name) = 'john' AND LOWER(last_name) = 'doe';  -- lower function is called which decreases query performance as extra calculation is required


-- Optimized Query
SELECT *
FROM customers
WHERE first_name = 'John' AND last_name = 'Doe'; -- instead make sure data is already in specific format before comparing which increases query performance


----------------------------------------------- Example 4 ---------------------------------------------

-- Unoptimized Query
SELECT *
FROM products
WHERE category LIKE '%clothing%';  -- using wildcards in begging makes full tables scan as it will not be able to use indexing efficiently

-- Optimized QUERY
SELECT *
FROM products
WHERE category LIKE 'clothing%';  -- if needed use only wildcards at the end as it can still use indexing, so query performance will be better






