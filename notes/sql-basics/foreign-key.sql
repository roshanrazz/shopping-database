-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


-- A FOREIGN KEY is a field (or collection of fields) in child table, that refers to the PRIMARY KEY of the parent table.
-- It is used to create referential integrity between tables.

SHOW TABLES;

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
)

DESCRIBE categories;

INSERT INTO categories
VALUES
(1001, 'Category 1'),
(1002, 'Category 2'),
(1003, 'Category 3'),
(1004, 'Category 4');

SELECT * FROM categories LIMIT 5;
DELETE FROM categories WHERE category_id=1004;
DROP Table products;
/*
     we can set following constraints in foreign key:
     ON DELETE RESTRICT   --> restrict deletion in parent table if refrenced by child table. It is default behavior even not used.
     ON DELETE SET NULL   --> set child table row to null if parent table row is deleted
     ON DELETE CASCADE    --> delete child table row if parent table row is deleted
*/
CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stock_quantity INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) -- ON DELETE CASCADE
);

DESCRIBE products;

INSERT INTO products
VALUES
(1, 'Product 1', 'Description 1', 10.99, 100, 1001),
(2, 'Product 2', 'Description 2', 15.99, 50, 1002),
(3, 'Product 3', 'Description 3', 20.99, 25, null),
(4, 'Product 4', 'Description 4', 25.99, 15, null);

SELECT * FROM products LIMIT 5;

-- insert in parent and child TABLE

INSERT INTO categories
VALUES
(1005, 'Category 5');                 -- no issue it is possible in parent TABLE

INSERT INTO products
VALUES
(5, 'Product 5', 'Description 5', 30.99, 10, null);  -- insert only possible with null value in place of refrence column
INSERT INTO products
VALUES
(6, 'Product 6', 'Description 6', 35.99, 10, null); 

INSERT INTO products
VALUES
(7, 'Product 7', 'Description 7', 40.99, 10, null);


-- check DELETE and UPDATE in case of child table 

UPDATE products
SET price = 15.39
WHERE product_id = 3;     -- update possible in case of child table
DELETE FROM products WHERE product_id = 3;   -- delete possible in case of child table

-- check DELETE and UPDATE in case of parent table 

UPDATE categories
SET category_name = 'This is Category 4'
WHERE category_id = 1004;     -- update possible in case of parent table

DELETE FROM categories WHERE category_id = 1003;   -- delete not possible in case of parent table if it has refrence in child table
DELETE FROM categories WHERE category_id = 1001;   -- delete not possible in case of parent table if it has refrence in child table