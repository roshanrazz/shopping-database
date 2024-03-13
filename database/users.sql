CREATE DATABASE shopDB;

use shopDB;

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    phone_number VARCHAR(255),
    user_type VARCHAR(100)
);

INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Roshan', 'roshan@example.com', '123456', '1654567890', 'admin');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Razz', 'razz@example.com', '123456', '1265467890', 'seller');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Jack', 'jack@example.com', '123654', '1234567890', 'seller');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Nancy', 'nancy@example.com', '123456', '1234567890', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Rock', 'rock@example.com', '123456', '1236547890', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Hari', 'hari@example.com', '123456', '1234567890', 'seller');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Mohan', 'mohan@example.com', '123456', '1234567890', 'seller');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Ram', 'ram@example.com', '123456', '1234567890', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Sita', 'sita@example.com', '321456', '1265467321', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Misty', 'misty@example.com', '123456', '1234567321', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Dikshya', 'dikshya@example.com', '123456', '1234563210', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Pihu', 'pihu@example.com', '321456', '1234567890', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Manish', 'manish@example.com', '321456', '1234563210', 'user');
INSERT INTO users(name, email, password, phone_number, user_type) VALUES('Shuvam', 'shuvam@example.com', '321456', '1234567321', 'user');


SELECT * FROM users LIMIT 10;



