-- types of joins
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- FULL JOIN
-- CROSS JOIN
-- self join

SELECT * FROM users;

SELECT * FROM categories;

SELECT * FROM products;

-- Inner JOIN

SELECT * FROM products INNER JOIN categories ON products.category_id = categories.category_id;

SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p INNER JOIN categories c                          --  inner join
ON p.category_id = c.category_id;  

--  simply join means inner join by default
SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p JOIN categories c                      
ON p.category_id = c.category_id;   

-- using comma to join table
SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p, categories c                          -- commma is same as inner join
WHERE p.category_id = c.category_id;     




--  left JOIN --> Returns data from left table and null for right table if data not match

SELECT * FROM products LEFT JOIN categories ON products.category_id = categories.category_id;

SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p LEFT JOIN categories c                      
ON p.category_id = c.category_id;  

-- Right join --> Returns data from right table and null for left table if data not match

SELECT * FROM products RIGHT JOIN categories ON products.category_id = categories.category_id;

SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p RIGHT JOIN categories c                      
ON p.category_id = c.category_id;

-- FULL JOIN outer join --> Returns data from both table
-- full join not present in mysql
-- we can achieve using union of LEFT Join and right join

SELECT * FROM products LEFT JOIN categories ON products.category_id = categories.category_id
UNION
SELECT * FROM products RIGHT JOIN categories ON products.category_id = categories.category_id;

SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p LEFT JOIN categories c                      
ON p.category_id = c.category_id
UNION
SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p RIGHT JOIN categories c                      
ON p.category_id = c.category_id;

--  UNION vs UNION ALL
--  UNION DUPLICATES NOT ALLOWED
SELECT * FROM products LEFT JOIN categories ON products.category_id = categories.category_id
UNION
SELECT * FROM products RIGHT JOIN categories ON products.category_id = categories.category_id;

-- UNION ALL duplicates allowed
SELECT * FROM products LEFT JOIN categories ON products.category_id = categories.category_id
UNION ALL
SELECT * FROM products RIGHT JOIN categories ON products.category_id = categories.category_id;