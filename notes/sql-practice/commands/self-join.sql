-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- self join joins the table with itself if certain condition is matched

CREATE TABLE employees(
    employee_id INT,
    name VARCHAR(50),
    salary INT,
    email VARCHAR(200),
    reffered_by INT,
    PRIMARY KEY(employee_id)
)

INSERT INTO employees VALUES
(1, 'John', 1000, 'j@j.com', 2),
(2, 'Ram', 2000, 'r@r.com', 5),
(3, 'Sita', 3000, 's@s.com', NULL),
(4, 'Rohit', 4000, 'r@r.com', 3),
(5, 'Gita', 5000, 'g@g.com', 4),
(6, 'Kishore', 6000, 'k@k.com', 5),
(7, 'Mohan', 7000, 'm@r.com', 6),
(8, 'Gita', 8000, 'g@r.com', NULL),
(9, 'Rock', 9000, 'r@r.com', 5),
(10, 'Razz', 10000, 'r@r.com', 9),
(11, 'Dikshya', 11000, 'd@r.com', 10);


SELECT * FROM employees LIMIT 10;


-- using self join to find the details about reffered employees

SELECT e1.name, e1.salary, e1.email, e2.name AS reffered_by_name, e2.email AS reffered_by_email
FROM employees e1
INNER JOIN employees e2
ON e1.reffered_by = e2.employee_id;