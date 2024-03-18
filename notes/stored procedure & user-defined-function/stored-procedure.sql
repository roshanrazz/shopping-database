-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- Stored procedure

-- creating procedure without parameters
DELIMITER //
CREATE PROCEDURE getUsers()
BEGIN
    SELECT * FROM users;
END //
DELIMITER ;

CALL getUsers();


-- IN parameter
DELIMITER //
CREATE PROCEDURE getUser(IN id INT)
BEGIN
    SELECT * FROM users WHERE user_id = id;
END //
DELIMITER ;

CALL getUser(10);

-- OUT parameter
DELIMITER //
CREATE PROCEDURE getUserEmail(IN id INT,OUT user_email VARCHAR(255))
BEGIN
    SELECT email INTO user_email FROM users WHERE user_id = id;
END //
DELIMITER ;

CALL getUserEmail(10,@myEmail);
SELECT @myEmail as email;

-- INOUT parameters

DELIMITER //

CREATE PROCEDURE getName(INOUT user VARCHAR(200))
BEGIN
    SELECT name INTO user FROM users WHERE email = user;
END //

DELIMITER ;

SET @user = 'n@n.com'; -- @user is a variable
CALL getName(@user); -- passed @user as INOUT parameter
SELECT @user as name; -- it is giving output as OUT parameter. INOUT behaves as the combination of both IN and OUT.


-- DROP PROCEDURES
DROP PROCEDURE getUsers;
DROP PROCEDURE getUser;
DROP PROCEDURE getUserEmail;
DROP PROCEDURE getName;

-- create a procedure to make TRANSACTION

DELIMITER $
CREATE PROCEDURE makeTransaction(IN sender_account_number INT, IN receiver_account_number INT, IN amount INT)
BEGIN
    START TRANSACTION;

    UPDATE accounts
    SET balance = balance - amount
    WHERE account_number = sender_account_number;

    UPDATE accounts
    set balance = balance + amount
    WHERE account_number = receiver_account_number;

    INSERT INTO transactions
    (sender_account_number, receiver_account_number, amount, transaction_date)
    VALUES
    (sender_account_number, receiver_account_number, amount, NOW());

    COMMIT;

END $

DELIMITER ;

-- calling transaction
CALL makeTransaction(1003, 1004, 2500);

-- check changes
SELECT * FROM accounts LIMIT 10;

SELECT * FROM transactions LIMIT 10;
