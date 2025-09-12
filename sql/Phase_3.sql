-- Use database
USE starterdb;

-- Drop table if exists
DROP TABLE IF EXISTS users;

-- Create table
CREATE TABLE users(
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

-- Insert sample data
INSERT INTO users VALUES
('Mukul','MukulMishra795@gmail.com'),
('Ananya','Ananya@example.com'),
('Raj','Raj@example.com');

-- Change column size (correct syntax)
ALTER TABLE users MODIFY COLUMN name VARCHAR(100);

-- Show all records
SELECT * FROM users;

-------------------------------------------------
-- 🎯 Examples of SQL Functions
-------------------------------------------------

-- String Functions
SELECT UPPER(name) AS upper_name, LOWER(email) AS lower_email FROM users;
SELECT CONCAT(name, ' -> ', email) AS user_details FROM users;
SELECT name, LENGTH(name) AS name_length FROM users;

-- Numeric Functions (using salary example)
-- First, add a salary column
ALTER TABLE users ADD COLUMN salary DECIMAL(10,2);

-- Update salaries
UPDATE users SET salary = 50000 WHERE name='Mukul';
UPDATE users SET salary = 60000 WHERE name='Ananya';
UPDATE users SET salary = 45000 WHERE name='Raj';

-- Use numeric functions
SELECT name, salary, ROUND(salary/12,2) AS monthly_salary FROM users;

-- Date Functions
-- Add a date_of_birth column
ALTER TABLE users ADD COLUMN date_of_birth DATE;

-- Insert some DOB values
UPDATE users SET date_of_birth='1999-05-14' WHERE name='Mukul';
UPDATE users SET date_of_birth='2001-07-22' WHERE name='Ananya';
UPDATE users SET date_of_birth='1995-12-11' WHERE name='Raj';

-- Use date functions
SELECT name, YEAR(date_of_birth) AS birth_year, MONTH(date_of_birth) AS birth_month FROM users;
SELECT name, TIMESTAMPDIFF(YEAR,date_of_birth,CURDATE()) AS age FROM users;

-- Aggregate Functions
SELECT COUNT(*) AS total_users FROM users;
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary, AVG(salary) AS average_salary FROM users;


-- ============================================================
-- 🎯 SQL TRANSACTION CONTROL NOTES
-- ============================================================

-- By default, most SQL systems run in "autocommit mode".
-- That means every statement (INSERT, UPDATE, DELETE) 
-- is automatically committed to the database.
-- To control transactions manually, we can turn autocommit OFF.

SET autocommit = 0;

-- ============================================================
-- 📝 COMMIT
-- ------------------------------------------------------------
-- COMMIT saves all the changes made in the current transaction 
-- permanently into the database.
-- Once committed, you cannot roll back those changes.
-- ============================================================

USE starterdb;

DROP TABLE IF EXISTS bank;
CREATE TABLE bank(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    balance DECIMAL(10,2)
);

INSERT INTO bank (name, balance) VALUES
('Mukul', 1000.00),
('Ananya', 2000.00);

-- Start transaction
UPDATE bank SET balance = balance - 200 WHERE name='Mukul'; -- Debit Mukul
UPDATE bank SET balance = balance + 200 WHERE name='Ananya'; -- Credit Ananya

-- Save changes permanently
COMMIT;

-- ============================================================
-- 📝 ROLLBACK
-- ------------------------------------------------------------
-- ROLLBACK undoes all changes made in the current transaction 
-- since the last COMMIT.
-- This is useful if something goes wrong (e.g., insufficient funds).
-- ============================================================

UPDATE bank SET balance = balance - 500 WHERE name='Mukul'; -- Try debiting
UPDATE bank SET balance = balance + 500 WHERE name='Ananya';

-- Oops! Let's cancel these changes
ROLLBACK;

SELECT * FROM bank;

-- ============================================================
-- 📝 SAVEPOINT
-- ------------------------------------------------------------
-- SAVEPOINT sets a checkpoint within a transaction.
-- We can ROLLBACK to a specific SAVEPOINT instead of undoing everything.
-- ============================================================

-- Start transaction
UPDATE bank SET balance = balance - 100 WHERE name='Mukul';
SAVEPOINT step1;  -- Savepoint created

UPDATE bank SET balance = balance + 100 WHERE name='Ananya';
SAVEPOINT step2;  -- Another savepoint

-- Rollback only to step1 (undo last update, keep first)
ROLLBACK TO step1;

-- Finally, commit the remaining changes
COMMIT;

-- ============================================================
-- ✅ Summary (as comments)
-- ------------------------------------------------------------
-- SET autocommit = 0;   -> Enables manual transaction control
-- COMMIT;               -> Saves all changes permanently
-- ROLLBACK;             -> Cancels changes since last COMMIT
-- SAVEPOINT name;       -> Creates a checkpoint
-- ROLLBACK TO name;     -> Rollbacks to specific savepoint
-- ============================================================

SELECT * FROM bank;
