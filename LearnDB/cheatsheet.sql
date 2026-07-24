------------------------ Databases ------------------------
CREATE DATABASE myDB;
USE myDB;
DROP DATABASE myDB;
ALTER DATABASE myDB READONLY = 1; --(we can't modify the database until we turned it off again 0/1)--

------------------------ Tables ------------------------
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	hourly_pay DECIMAL(6, 2),
	hire_date DATE
);

SELECT * FROM employees; --(select all from a table)--
RENAME TABLE employees TO workers;

ALTER TABLE employees ADD phone_number VARCHAR(15);
ALTER TABLE employees RENAME COLUMN phone_number TO email; --(rename coulmn name)--
ALTER TABLE employees MODIFY COLUMN email VARCHAR(100) DEFAULT "*****@gmail.com";
ALTER TABLE employees MODIFY email VARCHAR(100) AFTER last_name; --(change position)--
ALTER TABLE employees DROP COLUMN email;

------------------------ Insert Rows ------------------------
INSERT INTO employees(employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES (1, "Eugene", "Krabs", 25.50, "2012-04-20"),
       (2, "Squidward", "Tentacles", 17.50, "2015-07-02"),
       (3, "Spongebob", "Squarepants", 12.50, "2019-06-27"),
       (4, "Patric", "Star", 9.50, "2018-02-23"),
       (5, "Sandy", "Cheeks", 19.50, "2012-09-01");

INSERT INTO employees (employee_id, first_name, last_name)
VALUES (6, "Sheldon", "Plankton");

------------------------ SELECT ------------------------
SELECT * FROM employees;
SELECT first_name, last_name FROM employees;
SELECT * FROM employees WHERE hourly_pay >= 15;
SELECT * FROM employees WHERE employee_id = 1

------------------------ UPDATE & DELETE ------------------------
UPDATE employees SET hourly_pay = 18, hire_date = "2013-06-25"  WHERE employee_id = 5;
DELETE FROM employees WHERE employee_id = 6;

------------------------ Auto Commit ------------------------
SET AUTOCOMMIT = OFF; --(turned off auto commit first)--
COMMIT; --(commit to save the stage)--
ROLLBACK; --(if we delete something it will undo)--

------------------------ Date & Time ------------------------
CREATE TABLE test(
	my_date DATE,
	my_time TIME,
	my_datetime DATETIME
);
INSERT INTO test VALUES(CURRENT_DATE(), CURRENT_TIME(), NOW());
SELECT * FROM test;

------------------------ Unique ------------------------
CREATE TABLE products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(50),
	price DECIAML(7, 2),
);

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name); --remove duplicate name--

INSERT INTO products VALUES (100, "hamburger", 2.78),
                            (101, "fries", 0.80),
														(102, "ice cream", 0.50),
														(103, "soda", 0.70);

