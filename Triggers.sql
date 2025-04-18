SELECT * FROM customers_log;

SELECT * FROM customers
ORDER BY customer_id;


CREATE TRIGGER customer_updated
    BEFORE UPDATE ON customers
    FOR EACH ROW
    WHEN (NEW.first_name <> OLD.first_name OR NEW.last_name <> OLD.last_name)
    EXECUTE PROCEDURE log_customers_change();

-- Update the first_name of a customer
UPDATE customers
SET first_name = 'Steve'
WHERE last_name = 'Hall';

-- Check the customers table
SELECT *
FROM customers
ORDER BY customer_id;

-- Check the customers_log table
SELECT *
FROM customers_log;

-- Update the years_old of a customer
UPDATE customers
SET years_old = 10
WHERE last_name = 'Hall';

-- Check the customers table
SELECT *
FROM customers
ORDER BY customer_id;

-- Check the customers_log table
SELECT *
FROM customers_log;

CREATE TRIGGER customer_insert
    AFTER INSERT ON customers
    FOR EACH STATEMENT
    EXECUTE PROCEDURE log_customers_change();

-- Insert three records into the customers table
INSERT INTO customers (first_name, last_name, email_address, home_phone, city, state_name, years_old)
VALUES
    ('Jeffrey', 'Cook', 'Jeffrey.Cook@example.com', '202-555-0398', 'Jersey City', 'New Jersey', 66),
    ('Arthur', 'Turner', 'Arthur.Turner@example.com', '202-555-0123', 'Newark', 'New Jersey', 49),
    ('Nathan', 'Cooper', 'Nathan.Cooper@example.com', '202-555-0456', 'Trenton', 'New Jersey', 72);

-- Check the customers table
SELECT *
FROM customers
ORDER BY customer_id;

-- Check the customers_log table
SELECT *
FROM customers_log;

CREATE TRIGGER customer_min_age
    BEFORE UPDATE ON customers
    FOR EACH ROW
    WHEN (NEW.years_old < 13)
    EXECUTE PROCEDURE override_with_min_age();

-- Update a customer's age to below 13
UPDATE customers
SET years_old = 12
WHERE last_name = 'Campbell';

-- Update a customer's age to above 13
UPDATE customers
SET years_old = 24
WHERE last_name = 'Cook';

-- Check the customers table
SELECT *
FROM customers
ORDER BY customer_id;

-- Check the customers_log table
SELECT *
FROM customers_log;

-- Update first_name and years_old of a customer
UPDATE customers
SET years_old = 9,
    first_name = 'Dennis'
WHERE last_name = 'Hall';

-- Check the customers table
SELECT *
FROM customers
ORDER BY customer_id;

-- Check the customers_log table
SELECT *
FROM customers_log;

DROP TRIGGER IF EXISTS customer_min_age ON customers;

