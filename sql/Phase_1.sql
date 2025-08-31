/***************************************************************
*                        DATABASE SECTION                       *
***************************************************************/

-- Drop database if exists
DROP DATABASE IF EXISTS sql4_everyone;

-- Create database
CREATE DATABASE sql4_everyone;

-- Select database
USE sql4_everyone;


/***************************************************************
*                        TABLE CREATION                         *
***************************************************************/

-- Drop table if exists (to avoid "table already exists" error)
DROP TABLE IF EXISTS users;

-- Create 'users' table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,           -- Unique identifier for each user
    name VARCHAR(100) NOT NULL,                 -- User's full name, max 100 characters
    email VARCHAR(100) UNIQUE NOT NULL,         -- User's email address
    gender ENUM('Male', 'Female', 'Other'),     -- Gender (Male, Female, Other)
    date_of_birth DATE,                          -- Date of birth
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Timestamp auto-set on row creation
);


/***************************************************************
*                        SQL DATA TYPES                         *
***************************************************************/

-- INT        : Integer type, used for whole numbers.
-- VARCHAR(n) : Variable-length string, up to n characters.
-- ENUM       : String with a restricted set of values.
-- DATE       : Stores date values.
-- TIMESTAMP  : Stores date and time, auto-set to current timestamp.
-- BOOLEAN    : Stores TRUE or FALSE values (often used for flags).


/***************************************************************
*                       SQL CONSTRAINTS                         *
***************************************************************/

-- PRIMARY KEY     : Uniquely identifies each record. Example: id INT PRIMARY KEY
-- AUTO_INCREMENT  : Automatically increases for new rows. Often used with PRIMARY KEY
-- NOT NULL        : Column cannot be empty. Example: name VARCHAR(100) NOT NULL
-- UNIQUE          : Ensures values are unique. Example: email VARCHAR(100) UNIQUE
-- DEFAULT         : Sets a default value if none provided.
-- CHECK           : Ensures column values satisfy a condition. Example: age INT CHECK (age >= 0)
-- FOREIGN KEY     : Links a column to a primary key in another table. Example:
--                   user_id INT,
--                   FOREIGN KEY (user_id) REFERENCES users(id)


/***************************************************************
*                        ALTER TABLE EXAMPLES                  *
***************************************************************/

-- 1. Add a new column (phone number)
ALTER TABLE users
ADD COLUMN phone_number VARCHAR(15);

-- 2. Add a boolean column with default TRUE (active status)
ALTER TABLE users
ADD COLUMN is_active BOOLEAN DEFAULT TRUE;

-- 3. Modify an existing column (increase 'name' length)
ALTER TABLE users
MODIFY COLUMN name VARCHAR(150) NOT NULL;

-- 4. Rename a column (phone_number → contact_number)
ALTER TABLE users
CHANGE COLUMN phone_number contact_number VARCHAR(20);

-- 5. Drop a column (remove contact_number)
ALTER TABLE users
DROP COLUMN contact_number;

-- 6. Change column position
ALTER TABLE users
MODIFY COLUMN gender ENUM('Male','Female','Other') AFTER name;

-- Notes:
--  - Correct order: ADD COLUMN column_name DATA_TYPE [DEFAULT/CONSTRAINTS];
--  - Defaults must come after the data type
--  - Always backup tables before altering
--  - Some changes (like MODIFY) may take time on large tables


/***************************************************************
*                        SIMPLE QUERIES                         *
***************************************************************/

-- Fetch all data from users
SELECT * FROM users;

-- Fetch only emails
SELECT email FROM users;
