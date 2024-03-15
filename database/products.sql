-- create products TABLE
use shopDB;

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(255),
    price DECIMAL(10,2),
    stock_quantity INT
);

DESCRIBE products;

INSERT INTO products
VALUES
(1, "product1", "description1", 10.99, 100),
(2, "product2", "description2", 20.99, 200),
(3, "product3", "description3", 30.99, 300),
(4, "product4", "description4", 40.99, 400),
(5, "product5", "description5", 50.99, 500),
(6, "product6", "description6", 60.99, 600),
(7, "product7", "description7", 70.99, 700),
(8, "product8", "description8", 80.99, 800),
(9, "product9", "description9", 90.99, 900),
(10, "product10", "description10", 100.99, 1000);

SELECT * FROM products LIMIT 5;