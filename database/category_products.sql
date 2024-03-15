
-- categories TABLE
CREATE TABLE IF NOT EXISTS category_products(
    category_products_id INT PRIMARY KEY,
    category_id INT,
    product_id INT,
    Foreign Key (category_id) REFERENCES categories(category_id) ON DELETE CASCADE,
    Foreign Key (product_id) REFERENCES products(product_id) ON DELETE CASCADE
)

DESCRIBE category_products;

INSERT INTO category_products(category_products_id, category_id, product_id)
VALUES
(1,1001,1),
(2,1002,2),
(3,NULL,3),
(4,1004,NULL),
(5,1005,5),
(6,1006,NULL),
(7,1007,7),
(8,NULL,8),
(9,1009,9),
(10,1010,10);

SELECT * FROM category_products LIMIT 5;