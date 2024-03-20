-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- orders TABLE

SHOW TABLES;

CREATE TABLE orders (
    order_id INT PRIMARY KEY, user_id INT, order_date DATE, status VARCHAR(50), Foreign Key (user_id) REFERENCES users (user_id) ON DELETE NULL
)

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY, order_id INT, product_id INT, quantity INT, unit_price DECIMAL(10, 2), FOREIGN KEY (order_id) REFERENCES orders (order_id), FOREIGN KEY (product_id) REFERENCES products (product_id)
)

CREATE TABLE payments (
    payment_id INT PRIMARY KEY, order_id INT, payment_date DATE, payment_method VARCHAR(50), amount DECIMAL(10, 2), FOREIGN KEY (order_id) REFERENCES orders (order_id) -- ON DELETE RESTRICT --> restrict deletion. It is default behavior even not used.
)

CREATE TABLE reviews (
    review_id INT PRIMARY KEY, product_id INT, user_id INT, review_text TEXT, rating INT, FOREIGN KEY (product_id) REFERENCES products (product_id), -- ON DELETE CASCADE --> delete reviews if product deleted
    Foreign Key (user_id) REFERENCES users (user_id) -- ON DELETE SET NULL  --> set reviews to null if user deleted
)

CREATE TABLE wishlists (
    wishlist_id INT PRIMARY KEY, user_id INT, product_id INT, Foreign Key (user_id) REFERENCES users (user_id), Foreign Key (product_id) REFERENCES products (product_id)
)

DESCRIBE wishlists;

-- show recorsds in tables

SELECT * FROM users LIMIT 10;

SELECT * FROM products LIMIT 10;

SELECT * FROM categories LIMIT 10;

SELECT * FROM orders LIMIT 10;

SELECT * FROM order_items LIMIT 10;

SELECT * FROM payments LIMIT 10;

SELECT * FROM reviews LIMIT 10;

SELECT * FROM wishlists LIMIT 10;

------------- INSERT  INTO Tables -----------