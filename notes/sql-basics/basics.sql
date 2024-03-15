-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


-- SHOW DATABASES
SHOW DATABASES;

--  USE DATABASE COMMAND
USE myShopDB;

-- SHOW TABLES IN A DATABASE
SHOW TABLES;

-- CREATE TABLE 
CREATE TABLE users(
    user_id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    address VARCHAR(255),
    phone_number VARCHAR(255)
);

-- describe table structure
DESCRIBE users;

-- ALTER THE TABLE STRUCTURE

ALTER TABLE users
ADD full_name VARCHAR(255);       -- ADD NEW COLUMN

ALTER TABLE users
MODIFY user_id INT AUTO_INCREMENT;     -- MODIFY EXISTING COLUMN

-- insert data into tables
INSERT INTO users (full_name,username,email,password,address,phone_number) VALUES ('Nancy','imnancy','nancy@mail','654321','Janakpur','987654321');

-- show table data with limited amount of rows(records)
SELECT * FROM users LIMIT 5;

-- if you want to ignore first rows use OFFSET
SELECT * FROM users LIMIT 3 OFFSET 1;


-- update table data
UPDATE users SET username = "imjack" where user_id = 4;

-- show number of records in a table
SELECT COUNT(*) FROM users;

-- delete records from table
DELETE FROM users WHERE user_id = 6;

-- Get boolean value if records are present after verifying all conditions
SELECT EXISTS(SELECT * FROM users WHERE username = 'imrazz') as result;
SELECT COUNT(*) >= 2 AS bool_data FROM users;

-- order BY
SELECT * FROM users ORDER BY email,user_id DESC;

-- group record based on similarity
SELECT address,COUNT(*) AS total FROM users GROUP BY address;

-- OPERATORS IN MYSQL

-- = EQUAL TO
-- != NOT EQUAL TO
-- > GREATER THAN
-- < LESS THAN
-- >= GREATER THAN OR EQUAL TO
-- <= LESS THAN OR EQUAL TO
-- <> NOT EQUAL TO
-- AND
-- OR
-- NOT
-- IN
-- LIKE
-- BETWEEN
-- IS NULL

SELECT * FROM users WHERE username = 'imnancy';
SELECT * FROM users WHERE username != 'imnancy';
SELECT * FROM users WHERE username = 'imnancy' AND address != "KTM";
SELECT * FROM users WHERE username = 'imnancy' OR address = "KTM";
SELECT * FROM users WHERE user_id >= 3;
SELECT * FROM users WHERE user_id BETWEEN 2 AND 5;
SELECT * FROM users WHERE user_id IN (3,5);
SELECT * FROM users WHERE username IN ('imnancy','imjk');
SELECT * FROM users WHERE username NOT IN ('imnancy','imjack','imrock');
SELECT * FROM users WHERE username LIKE '%mR%zz'; -- like for filtering data based on character like regex

SELECT * FROM users WHERE username IS NULL;
SELECT * FROM users WHERE username IS NOT NULL;

-- Aggregate FUNCTION
-- COUNT
-- SUM
-- MIN
-- MAX
-- AVG

SELECT COUNT(user_id) AS Total FROM users;

SELECT SUM(user_id) AS SumTotal FROM users;

SELECT MIN(user_id) AS MinTotal FROM users;

SELECT MAX(user_id) AS MaxTotal FROM users;

SELECT AVG(user_id) AS AverageValue FROM users;

-- Having used with AGGREGATE FUNCTION as where cannot be used with them

SELECT address, COUNT(user_id) as total FROM users GROUP BY address HAVING COUNT(user_id) >= 3;

-- WHERE condition

SELECT * FROM users WHERE username = '' or 1=1;
SELECT * FROM users WHERE 1; -- No error as 1 means true so all records will be shown

SELECT * FROM users WHERE 0; -- No error but 0 means false so records will be shown

SELECT * FROM users WHERE user_id=1000 OR 1=1;