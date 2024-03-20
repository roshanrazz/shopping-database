-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


-- TRANSACTIONS
drop table accounts;
CREATE TABLE accounts(
    account_number INT PRIMARY KEY,
    balance DECIMAL(10, 2),
    name VARCHAR(255)
)

INSERT INTO accounts(account_number, balance, name) VALUES
(1000, 1000.00, 'Ram'),
(1001, 2000.00, 'Rock'),
(1002, 3000.00, 'Jack'),
(1003, 4000.00, 'Roshan'),
(1004, 5000.00, 'Nancy');

SELECT * FROM accounts LIMIT 10;

SELECT * FROM transactions LIMIT 10;

CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    sender_account_number INT,
    receiver_account_number INT,
    amount DECIMAL(10, 2),
    transaction_date DATETIME
)

-- Nancy sending 1500 to Jack
START TRANSACTION;
SAVEPOINT mySavepoint;  -- create a savepoint

UPDATE accounts
SET balance = balance - 1500
WHERE account_number = 1004;

UPDATE accounts
set balance = balance + 1500
WHERE account_number = 1002;

INSERT INTO transactions
(sender_account_number, receiver_account_number, amount, transaction_date)
VALUES
(1004, 1002, 1500, NOW());
ROLLBACK TO mySavepoint; -- execute it if you want to rollback to savepoint mySavepoint
COMMIT; -- commits the transaction. changes will be saved into database

-- check changes
SELECT * FROM accounts LIMIT 10;

SELECT * FROM transactions LIMIT 10;


-- Jack sending 2000 to Nancy
START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE account_number = 1002;

UPDATE accounts
set balance = balance + 2000
WHERE account_number = 1004;

INSERT INTO transactions
(sender_account_number, receiver_account_number, amount, transaction_date)
VALUES
(1002, 1004, 2000, NOW());

ROLLBACK; -- Rollback the transaction so changes will not be saved in database

-- check changes

SELECT * FROM accounts LIMIT 10;

SELECT * FROM transactions LIMIT 10;