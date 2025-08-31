-- 📘 SQL NOTES (with USERS table)
-- This script contains theory + examples for revision

-- 1️⃣ Database & Table Creation
USE starterdb;   -- select database

DROP TABLE IF EXISTS users;   -- delete old table if exists

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- unique id
    name VARCHAR(50),                   -- person’s name
    email VARCHAR(100),                 -- email
    gender VARCHAR(10),                 -- male/female
    date_of_birth DATE,                  -- date format YYYY-MM-DD
    salary DECIMAL(10,2)                 -- salary with 2 decimals
);

-- 2️⃣ Insert Data into Table
INSERT INTO users (name, email, gender, date_of_birth, salary) VALUES
('Aarav', 'aarav@example.com', 'male', '1995-05-14', 56000.00),
('Ananya', 'ananya@example.com', 'female', '1999-11-27', 72000.00),
('Raj', 'raj@example.com', 'male', '1985-02-17', 50000.00),
('Aditi', 'aditi@example.com', 'female', '1992-09-15', 62000.00),
('Arjun', 'arjun@example.com', 'male', '1990-12-30', 81000.00),
('Nisha', 'nisha@example.com', 'female', '1998-07-05', 54000.00),
('Amit', 'amit@example.com', 'male', '1993-05-21', 88000.00),
('Priya', 'priya@example.com', 'female', '1995-10-17', 66000.00),
('Karan', 'karan@example.com', 'male', '1988-06-30', 47000.00),
('Vidya', 'vidya@example.com', 'female', '1995-01-27', 58000.00),
('Tushar', 'tushar@example.com', 'male', '1992-11-02', 50000.00),
('Sunita', 'sunita@example.com', 'female', '1991-04-13', 52000.00),
('Nikhil', 'nikhil@example.com', 'male', '1987-08-17', 70000.00),
('Sanya', 'sanya@example.com', 'female', '1994-12-21', 62000.00),
('Ajay', 'ajay@example.com', 'male', '1995-06-19', 52000.00),
('Fatima', 'fatima@example.com', 'female', '1993-01-04', 64000.00);

-- 3️⃣ Filtering Data (WHERE clause)
-- WHERE is used to filter rows based on condition
SELECT * FROM users WHERE gender = 'female';
SELECT * FROM users WHERE salary > 60000.00;
SELECT * FROM users WHERE salary > 60000.00 AND gender = 'female';

-- 4️⃣ Sorting & Limiting
-- ORDER BY sorts ASC (default) or DESC
-- LIMIT restricts number of rows
SELECT * FROM users
WHERE salary > 60000.00 AND gender = 'female'
ORDER BY salary DESC
LIMIT 3;

-- 5️⃣ Updating Data
-- UPDATE modifies rows, always use WHERE
-- Example: Update salary of a specific user
-- UPDATE users SET salary = 40000 WHERE id = 1;

-- Increase salary by 10k for employees earning less than 40k
UPDATE users SET salary = salary + 10000 WHERE salary < 40000;

-- 6️⃣ Deleting Data
-- DELETE removes rows from a table
-- ⚠️ Always use WHERE, otherwise ALL rows will be deleted!
-- Example 1: Delete a user by ID
-- DELETE FROM users WHERE id = 5;
-- Example 2: Delete all female users with salary < 55k
-- DELETE FROM users WHERE gender = 'female' AND salary < 55000;

-- To remove ALL data but keep the table:
-- DELETE FROM users;   -- clears table but keeps structure
-- TRUNCATE TABLE users; -- faster, resets auto_increment also

-- 7️⃣ View All Data
SELECT * FROM users;
