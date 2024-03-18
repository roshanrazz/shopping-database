# Stored Procedure

## Stored Procedure:
A **stored procedure** is a prepared SQL code that you can save, so the code can be reused over and over again.
So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.
A procedure is a named block of code that can accept parameters, perform actions, and return results.
Example:
```
DELIMITER //

CREATE PROCEDURE getUserEmail(IN id INT,OUT user_email VARCHAR(255))
BEGIN
    SELECT email INTO user_email FROM users WHERE user_id = id;
END //

DELIMITER ;

CALL getUserEmail(10,@myEmail);
SELECT @myEmail as email;
```

## Parameters:
Procedures in MySQL can accept parameters. There are three types of parameters:
- **IN parameters**: These parameters are read-only within the procedure. They are passed by value, meaning their values cannot be modified within the procedure.

- **OUT parameters**: These parameters are write-only within the procedure. They are used to return values from the procedure to the caller.

- **INOUT parameters**: These parameters can be both read from and written to within the procedure. They are passed by reference, allowing their values to be modified within the procedure and returned to the caller.

## Why stored procedure???
1. **Code Reusability**: Procedures encapsulate SQL logic into reusable units. Once created, they can be called multiple times from different parts of an application. This promotes code reuse and simplifies maintenance since any changes or optimizations only need to be made in one place.

2. **Improved Performance**: Stored procedures are precompiled and stored in the database, which can lead to improved performance compared to executing ad-hoc SQL queries from an application. They reduce network traffic by minimizing the number of SQL statements sent to the database server.

3. **Enhanced Security**: With stored procedures, you can grant execution privileges to users without exposing underlying table structures. This allows for fine-grained access control, ensuring that users only interact with the database through predefined procedures, reducing the risk of SQL injection attacks.

4. **Transaction Management**: Procedures allow you to encapsulate multiple SQL statements within a single transaction. This ensures data consistency and integrity by guaranteeing that a series of operations either succeed or fail as a single unit.

