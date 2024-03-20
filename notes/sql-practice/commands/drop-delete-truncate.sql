-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

/*

    DROP --> DDL comamnd --> as it affects the structure of the table. It deletes the entire table or the database
    TRUNCATE --> DDL command   --> as it affects the structure of the table. It deletes the entire table and recreate the structure again. So faster compared to delete
    DELETE --> DML command   --> as it does not affect the table structure. It only deletes the records of table line by line. So Comparatively slower in compared to truncate

*/

SHOW TABLES;

CREATE Table products
(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products
VALUES
(1, 'product1', 'description1', 10.99, 100),
(2, 'product2', 'description2', 20.99, 200),
(3, 'product3', 'description3', 30.99, 300),
(4, 'product4', 'description4', 40.99, 400),
(5, 'product5', 'description5', 50.99, 500),
(6, 'product6', 'description6', 60.99, 600),
(7, 'product7', 'description7', 70.99, 700),
(8, 'product8', 'description8', 80.99, 800),
(9, 'product9', 'description9', 90.99, 900),
(10, 'product10', 'description10', 100.99, 1000);

SELECT * FROM products LIMIT 10;

-- drop table

DROP TABLE products;

DESCRIBE products; -- table does not exist

-- truncate table

TRUNCATE products;

DESCRIBE products; -- table exists but all the records gets deleted as table is dropped and recreated the table structure

-- delete table

DELETE FROM products;

DESCRIBE products; -- table exists but all the records gets deleted

