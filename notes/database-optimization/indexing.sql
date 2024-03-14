-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- Indexing

/*
Indexing is of two types.
1. Clustered Index : It is created automatically by the database engine. It is created on table itself, so no extra space is used. It is faster than Non-clustered index.
2. Non-Clustered Index: Non-clustered indexes store the index data separately from the actual table data. It is like the index page of books. Seperate index is created along with its mapping, so extra space is used.
*/



-- creating table for indexing
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products VALUES
(5, 'Product 5', 'Description 5', 899.99, 10),
(7, 'Product 7', 'Description 7', 799.99, 5),
(3, 'Product 3', 'Description 3', 999.99, 3),
(4, 'Product 4', 'Description 4', 1699.99, 8),
(1, 'Product 1', 'Description 5', 1299.99, 6),
(9, 'Product 9', 'Description 9', 799.99, 4),
(2, 'Product 2', 'Description 2', 999.99, 2),
(8, 'Product 8', 'Description 8', 699.99, 7),
(6, 'Product 6', 'Description 6', 1199.99, 9),
(10, 'Product 10', 'Description 10', 199.99, 1);

SELECT * FROM products LIMIT 5;

--  Even we add data in random order in products table, rows are sorted because of clustered index created automatically.



-- Enable profiling
SET profiling = 1; 

-- Run query you want to check performance
SELECT * FROM products WHERE price > 599 AND price < 1399;

-- display profiling information for all query
SHOW PROFILES;

--  display profiling information for specific query in details.
SHOW PROFILE FOR QUERY 1;

-- Now create index on products for better performance
CREATE INDEX index_price_products ON products (price ASC); -- can create index on multiple column


-- Run same query again
SELECT * FROM products WHERE price > 599 AND price < 1399;

-- see the performance again it should be better then earlier
SHOW PROFILES;

SHOW PROFILE FOR QUERY 3;


-- for removing INDEX
DROP INDEX index_price_products ON products;


-- Note : performance change cannot be observed clearly in table with less records.