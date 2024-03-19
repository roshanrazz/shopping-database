-- Active: 1709531650233@@127.0.0.1@3306@myShopDB
SHOW TABLES;

SELECT * FROM users;

CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(200)
)

INSERT INTO employee(id, name, email, city)
VALUES
(1, 'Roshan', 'roshan@example.com', 'Kathmandu'),
(2, 'Razz', 'razz@example.com', 'Hyderabad'),
(3, 'Jack', 'jack@example.com', 'Janakpur'),
(4, 'Nancy', 'nancy@example.com', 'Kathmandu'),
(5, 'John', 'john@example.com', 'Hyderabad'),
(6, 'Mohan', 'mohan@example.com', 'Janakpur'),
(7, 'Ram', 'ram@example.com', 'Kathmandu'),
(8, 'Sita', 'sita@example.com', 'Janakpur');


CREATE TABLE students(
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    city VARCHAR(200),
    branch VARCHAR(200)
);

INSERT INTO students VALUES
(1, 'Ahron', 'ahron@example.com', 'Janakpur', 'CSE'),
(2, 'Jazz', 'jazz@example.com', 'Hyderabad', 'CE'),
(3, 'Wick', 'wick@example.com', 'Janakpur', 'CE'),
(4, 'Kath', 'kath@example.com', 'Kathmandu', 'ECE'),
(5, 'Enny', 'enny@example.com', 'Janakpur', 'CSE'),
(6, 'Lok', 'lok@example.com', 'Hyderabad', 'ECE'),
(7, 'Geer', 'geer@example.com', 'Kathmandu', 'CSE'),
(8, 'Snita', 'snita@example.com', 'Kathmandu', 'ECE'),
(9, 'Roshan', 'roshan@example.com', 'Kathmandu', 'CSE');


-- SQL query to find the employee and studnts who reside in the same city

SELECT e.name AS employee_name, e.email as employee_email, s.name as student_name, s.email as student_email, e.city 
FROM employee e
JOIN students s
ON e.city = s.city
LIMIT 50;


--  GROUP students by city

SELECT city, COUNT(city) as total
FROM students
GROUP BY city
ORDER BY city ASC;

-- group employee by city

SELECT city, COUNT(city) as total
FROM employee
GROUP BY city
ORDER BY city ASC;




-- group by city after joining

SELECT s.city AS city, COUNT(s.city)
FROM employee e
INNER JOIN students s
ON s.city = e.city
GROUP BY s.city
ORDER BY s.city ASC;

-- find all from employee table where city is from student city using subquery

SELECT * FROM employee
WHERE city in (SELECT city from students);

--  find all from employee table where city is from student city using join

SELECT DISTINCT e.*   -- we have to use DISTINCT as we get alot of duplicate data using join
FROM employee e
JOIN students s
ON e.city = s.city
ORDER BY e.id;      

-- find products with category name
SELECT p.product_name, p.price, c.category_name
FROM products p
INNER JOIN categories c
ON p.category_id = c.category_id
LIMIT 50;

-- display all products whose price is greater than average PROCEDURE

SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);
SELECT *,
CASE
    WHEN price > 0 AND price < 15 THEN  'price is less than 15'
    WHEN price >= 15 AND price <+ 20 THEN  'price is in between 15 and 20'
    ELSE  'price is greater than 20'
END AS result
FROM products;
