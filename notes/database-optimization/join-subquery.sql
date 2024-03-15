-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


---------------------------- check performace -----------------------------------

SET profiling = 1;

SHOW PROFILES;

SHOW PROFILE FOR QUERY 1;

-- creating dummy data

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO customers
VALUES
(1, 'John', 'j@j.com'),
(2, 'Ram', 'r@r.com'),
(3, 'Sita', 's@s.com'),
(4, 'Rohit', 'r@r.com'),
(5, 'Gita', 'g@g.com');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE SET NULL
);

INSERT INTO orders
VALUES
(1, 2, '2022-01-01', 100.00),
(2, 1, '2022-01-02', 200.00),
(3, 5, '2022-01-03', 300.00),
(4, 4, '2022-01-04', 400.00),
(5, 3, '2022-01-05', 500.00);

-- using SUB QUERY
SELECT customer_name, email
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- using join
SELECT c.customer_name, c.email
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;



-- Here we can see the performance of join is quite faster compared to subquery used.
