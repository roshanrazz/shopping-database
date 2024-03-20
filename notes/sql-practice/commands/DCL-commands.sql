-- Active: 1709531650233@@127.0.0.1@3306@myShopDB

-- create new USER

CREATE USER IF NOT EXISTS 'razz' @'localhost' IDENTIFIED BY 'zzar';

-- show users

SELECT * FROM mysql.user;

SELECT user, host FROM mysql.user;

-- drop user

DROP USER 'razz' @'localhost';

-- set password for existing user

SET PASSWORD FOR 'razz' @'localhost' = 'zzar';

-- SHOW GRANTS FOR USER
SHOW GRANTS;
-- FOR CURRENT USER
SHOW GRANTS FOR 'razz' @'localhost';
-- FOR SPECIFIC USER
SHOW GRANTS FOR 'root' @'%';
-- FOR SPECIFIC USER
-- GRANT ALL PRIVILEGES ON SPECIFIC DATABASE
GRANT ALL PRIVILEGES ON myShopDB.* TO 'razz' @'localhost';

GRANT ALL PRIVILEGES ON *.* TO 'razz' @'localhost';
-- ALL DATABASE
-- GRANT SPECIFIC PRIVILEGES
GRANT SELECT, INSERT ON myShopDB.* TO 'razz' @'localhost';

GRANT SELECT ON *.* TO 'razz' @'localhost';

-- REVOKE ALL PRIVILEGES

REVOKE ALL PRIVILEGES ON *.* FROM 'razz' @'localhost';

REVOKE INSERT ON myShopDB.* FROM 'razz' @'localhost';