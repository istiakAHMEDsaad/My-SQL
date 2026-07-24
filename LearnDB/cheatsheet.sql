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

