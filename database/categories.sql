
-- categories TABLE
CREATE TABLE IF NOT EXISTS categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
)

DESCRIBE categories;

INSERT INTO categories
VALUES
(1001, 'Category 1'),
(1002, 'Category 2'),
(1003, 'Category 3'),
(1004, 'Category 4'),
(1005, 'Category 5'),
(1006, 'Category 6'),
(1007, 'Category 7'),
(1008, 'Category 8'),
(1009, 'Category 9'),
(1010, 'Category 10');

SELECT * FROM categories LIMIT 5;