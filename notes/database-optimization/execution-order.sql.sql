-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- Execution order of SQL QUERY

 
/* 
Execution order is as:

 1   ->   2   ->   3   ->   4      -->  5   ->   6     ->    7       ->  8
FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT

*/
--  creating categories table
CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
)

INSERT INTO categories
VALUES
(1001, 'Category 1'),
(1002, 'Category 2'),
(1003, 'Category 3'),
(1004, 'Category 4');

-- creating products table

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) -- ON DELETE CASCADE
);

INSERT INTO products
VALUES
(1, 'Product 1', 'Description 1', 10.99, 100, 1001),
(2, 'Product 2', 'Description 2', 15.99, 50, 1002),
(3, 'Product 3', 'Description 3', 20.99, 25, null),
(4, 'Product 4', 'Description 4', 25.99, 15, null);

SELECT *
FROM products AS p
INNER JOIN categories AS c ON p.category_id = c.category_id
WHERE p.price > 5
ORDER BY c.category_name ASC
LIMIT 10;

-- DEMO SQL QUERY WHERE ALL EXECUTION ORDER IS IS_USED 

SELECT *
FROM products AS p
JOIN categories AS c ON p.category_id = c.category_id
WHERE p.price > 50
GROUP BY c.category_id
HAVING COUNT(*) > 5
ORDER BY c.category_name ASC
LIMIT 10;




