-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

/*
    Normalization involves structuring a database to reduce redundancy and dependency.
    It typically results in a more efficient use of storage space and ensures data integrity.
 */


-- Authors' details are stored separately IN NORMALIZATION
 CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(255)
);

INSERT INTO authors
VALUES
(1, 'Author 1'),
(2, 'Author 2'),
(3, 'Author 3'),
(4, 'Author 4'),
(5, 'Author 5'),
(6, 'Author 6'),
(7, 'Author 7'),
(8, 'Author 8'),
(9, 'Author 9'),
(10, 'Author 10');

-- Each book entry refers to an author by their author_id
 CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

INSERT INTO books
VALUES
(1, 'Book 1', 1),
(2, 'Book 2', 2),
(3, 'Book 3', NULL),
(4, 'Book 4', 4),
(5, 'Book 5', 5),
(6, 'Book 6', NULL),
(7, 'Book 7', 7),
(8, 'Book 8', 8),
(9, 'Book 9', NULL),
(10, 'Book 10', 10);

-- Join is used to fetch data from both tables so extra calculation is involved in query
SELECT b.title, a.author_name
FROM books AS b
INNER JOIN authors AS a
ON b.author_id = a.author_id;


/*
    Denormalization involves adding redundant data to one or more tables to improve query performance by reducing the need for joins.
    While it can improve read performance, it can also complicate data management and may lead to potential data inconsistencies
*/


-- In this denormalizied table, instead of creating new table for authors, we use the same table for authors details which increases query read performance but may degrade query write performance
CREATE TABLE books_denormalized (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_name VARCHAR(255)
);

INSERT INTO books_denormalized
VALUES
(1, 'Book 1', 'Author 1'),
(2, 'Book 2', 'Author 2'),
(3, 'Book 3', NULL),
(4, 'Book 4', 'Author 4'),
(5, 'Book 5', 'Author 5'),
(6, 'Book 6', 'Author 6'),
(7, 'Book 7', 'Author 7'),
(8, 'Book 8', 'Author 8'),
(9, 'Book 9', NULL),
(10, 'Book 10', 'Author 10');

-- No join required so increases query performance_schema
SELECT title, author_name
FROM books_denormalized; 

