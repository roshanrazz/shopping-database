-- Active: 1709531650233@@127.0.0.1@3306@myShopDB
SHOW TABLES;

-- get first row ONLY
SELECT * FROM users LIMIT 1;

SELECT * FROM users ORDER BY user_id ASC LIMIT 1;

-- get last record based on PRIMARY KEY

SELECT * FROM users ORDER BY user_id DESC LIMIT 1;

-- get five records starting from row 4

SELECT * FROM users LIMIT 5 OFFSET 3; -- offset 3 means start after 3 rows


-- get 3 rows from last
SELECT * FROM users ORDER BY user_id DESC LIMIT 3;

-- get 3 rows from last, leaving the last row.

SELECT * FROM users ORDER BY user_id DESC LIMIT 3 OFFSET 1;

-- find all user whose name start with 'R'

SELECT * FROM users WHERE name LIKE 'R%'; -- % means after R any number of character and any character

-- find all user whose name starts with R and ends with m
SELECT * FROM users WHERE name LIKE 'R%m';

-- find all users whose name starts with R and ends with m but is of three character only. eg : Ram, Rem, Rom

SELECT * FROM users WHERE name LIKE 'R_m'; -- '_' means single occurence of any character

-- This query selects a string literal as a single column result.
SELECT "The cure for the pain is in the pain." AS Quote;

-- SQL query to display three numbers in three columns. 
SELECT 1 AS ONE, 2 Two, 3 Three;

-- SQL query to display the sum of two numbers 10 and 15 from the RDBMS server
SELECT 10+15 as sum;

-- sql query to display avergae of three numbers

SELECT (10+15+20)/3 as average;

-- arithemetic calculation
SELECT 10*12/3+5 as result;

-- select unique name from users

SELECT DISTINCT name FROM users LIMIT 10;

-- find users whose name in Nancy or email is s@s.com
SELECT name, email FROM users WHERE name='Nancy' OR email = 's@s.com';

-- find users whose name in Nancy and email is n@s.com
SELECT name, email FROM users WHERE name='Nancy' AND email = 'n@n.com';

-- find all users whose date of birth is recorded or is not NULL
SELECT * FROM users WHERE date_of_birth IS NOT NULL LIMIT 10;

-- find all users whoise name is Gita and date of birth between year 1995 to 2005

SELECT * FROM users
WHERE name = 'Gita'
AND date_of_birth 
BETWEEN '1995-01-01' AND '2005-12-31'
LIMIT 10;

-- price between 10 and 20
SELECT * FROM products WHERE price BETWEEN 10 AND 20;

-- average price
SELECT AVG(price) as avergae_price FROM products;

-- check if data is present inside TABLE

SELECT EXISTS(
    SELECT * FROM products
    WHERE price > 10
) AS result;

