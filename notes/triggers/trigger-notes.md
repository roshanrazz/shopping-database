# Trigger

## Trigger:
**Trigger** is a database object that is associated with a table and is executed automatically when certain events occur within the database. These events include INSERT, UPDATE, and DELETE operations on the table. Triggers can be useful for enforcing business rules, maintaining data integrity, auditing changes, or implementing complex security mechanisms. Trigger is run automatically before or after any event has occured i.e insert, update or delete is performed.

Syntax:
```
CREATE TRIGGER trigger_name
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON table_name
FOR EACH ROW
BEGIN
    -- Trigger body, containing SQL statements
END;

```
Example:
```
CREATE TRIGGER before_insert_users
BEFORE INSERT
ON users
FOR EACH ROW
BEGIN
SET NEW.created_at = NOW(); -- NEW referes to new record inserted
SET NEW.updated_at = NOW();
END;
```