-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

/*
    Subqueries, also known as nested queries or inner queries, are queries embedded within another SQL statement.
    They serve as a powerful tool to retrieve data based on the results of another query.
    The primary purpose of subqueries is to break down complex problems into smaller, more manageable parts, making SQL queries more efficient and easier to read.
*/

-- Find all employees who earn more than the average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);   -- subquery used here to find average of salary FIRST_VALUE

-- using join to achieve the same result
SELECT e.name, e.salary
FROM employees e
JOIN (SELECT AVG(salary) AS avg_salary FROM employees) AS ae
ON e.salary > ae.avg_salary;
