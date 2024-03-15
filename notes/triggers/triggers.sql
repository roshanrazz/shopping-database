-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


USE sampleDB;

-- creating user table
CREATE TABLE users(
    user_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    date_of_birth DATE,
    created_at DATETIME,
    updated_at DATETIME
);

-- creating trigger that automatically insert created_at AND updated_at TIMESTAMP WHILE INSERTING
-- trigger can be run {BEFORE, AFTER}  {INSERT, UPDATE, DELETE} on table. It will run automatically on insert,update or delete events
CREATE TRIGGER before_insert_users
BEFORE INSERT
ON users
FOR EACH ROW
BEGIN
SET NEW.created_at = NOW(); -- NEW referes to new record inserted
SET NEW.updated_at = NOW();
END;

-- SHOW CREATED TRIGGER
SHOW TRIGGERS;

-- DROP TRIGGER
DROP TRIGGER before_insert_users;

-- INSERT INTO users TABLE
INSERT INTO users (user_id, name, email, password, date_of_birth)
VALUES
(1, 'Nancy', 'n@n.com', 'password', '2000-01-01');

SELECT * FROM users LIMIT 10; -- HERE WE CAN SEE TRIGGER IS EXECUTED AUTOMATICALLY BEFORE INSERTING

-- creating trigger for updating TIMESTAMP while updating

CREATE TRIGGER before_update_users
BEFORE UPDATE
ON users
FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END;

-- update user

UPDATE users
SET name="Rock"
WHERE user_id = 1;

SELECT * FROM users LIMIT 10;

