-- Active: 1709531650233@@127.0.0.1@3306@myShopDB


-- function to calculate tax

DELIMITER $  -- changing delimter to '$' so i can use ';' in between my query as termination of a query will be set by '$'
CREATE FUNCTION calculateTax(amount DECIMAL(10,2),tax_rate DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE tax DECIMAL(10,2);
    SET tax = amount * tax_rate/100;
    RETURN tax;
END $ -- query ends here as we changed delimter to '$'

DELIMITER ; -- delimter back to ';'

-- calling function
SELECT calculateTax(2000,13) as TaxAmount;