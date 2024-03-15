-- views

SELECT * FROM products;

-- creating views
CREATE VIEW
products_stock_view
AS
SELECT product_name, price, stock_quantity
FROM
products
WHERE
stock_quantity > 30;

-- select from view
SELECT * FROM products_stock_view;

-- updating view updates table also
UPDATE products_stock_view
SET
price = 0
WHERE
product_name = 'Product 1';

-- updating table updates view also
UPDATE products
SET
price = 199
WHERE
product_name = 'Product 1';

-- drop view
DROP VIEW products_stock_view;

-- view with join
-- We can create view of complex query so that we don't have to type same complex query again and again
CREATE VIEW products_categories_view
AS
SELECT p.product_id, p.product_name, p.description, p.price, p.stock_quantity, c.category_name
FROM
products p INNER JOIN categories c                    
ON p.category_id = c.category_id;

-- select from view
SELECT * FROM products_categories_view;