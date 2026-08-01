------------------------ Databases ------------------------
CREATE DATABASE myDB;
USE myDB;
DROP DATABASE myDB;
ALTER DATABASE myDB READ ONLY = 1; --(we can't modify the database until we turned it off again 0/1)--



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
SELECT * FROM employees WHERE (hourly_pay >= 15);
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
	price DECIMAL(7, 2)
);

ALTER TABLE products ADD CONSTRAINT UNIQUE(product_name); --remove duplicate name--

INSERT INTO products VALUES (100, "hamburger", 2.78),
                            (101, "fries", 0.80),
                            (102, "ice cream", 0.50),
                            (103, "soda", 0.70)

------------------------ Not null ------------------------
CREATE TABLE products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(50),
	price DECIMAL(7, 2) NOT NULL 
);
ALTER TABLE products MODIFY price DECIMAL(7, 2) NOT NULL; --if you forgot to add--
INSERT INTO employees(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	DECIMAL(6, 2),
	hire_date DATE,
	CONSTRAINT chk_pay CHECK (hourly_pay >= 10)
);
ALTER TABLE employees ADD CONSTRAINT chk_pay CHECK(hourly_pay >= 10);



------------------------ Not null ------------------------
ALTER TABLE products ALTER price SET DEFAULT 0;



------------------------ Primary Key ------------------------
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY,
	amount DECIMAL(7, 2)
);
ALTER TABLE transactions ADD CONSTRAINT set_primay PRIMARY KEY(transaction_id); --if you forgot to add primary key--



------------------------ Auto Increment ------------------------
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
	amount DECIMAL(7, 2)
);

INSERT INTO transactions(amount) VALUES (234);
SELECT * FROM transactions;

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);



------------------------ FOREIGN KEY ------------------------
INSERT INTO customers(first_name, last_name)
VALUES ("Fred", "Fish"),
       ("Larry", "Lobster"),
			 ("Bubble", "Bass");

CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
	amount DECIMAL(7, 2),
	customer_id INT,
	CONSTRAINT fk_customer FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

ALTER TABLE transactions ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

--remove foreign key find the key id first--
ALTER TABLE transactions DROP FOREIGN KEY fk_customer; --or--
ALTER TABLE transactions DROP CONSTRAINT fk_customer;


------------------------ Join Table ------------------------
--inner, right, left join--
SELECT * FROM transactions INNER JOIN customers ON transactions.customer_id = customers.customer_id;
--spesific column--
SELECT transaction_id, amount, first_name, last_name FROM transactions INNER JOIN customers ON transactions.customer_id = customers.customer_id;



------------------------ Functions ------------------------
--COUNT, MIN, MAX, AVG, SUM, CONCAT--
SELECT CONUT(cusomer_id) AS "count" FROM transactions; --where condition if needed--



------------------------ Logical Operator and, or, not ------------------------
ALTER TABLE employees ADD COLUMN job VARCHAR (50) AFTER hourly_pay;
UPDATE employees SET job = "manager" WHERE employee_id = 1;
SELECT * FROM employees WHERE hire_date < "2026-04-27" AND job = "cook";
SELECT * FROM employees WHERE NOT job = "manager" AND NOT job = "asst. manager";
SELECT * FROM employees WHERE hire_date BETWEEN "2025-01-01" AND "2026-01-01";
SELECT * FROM employees WHERE job IN ("cook", "cashier", "janitor");



------------------------ Wild card ------------------------
SELECT * FROM employees WHERE first_name LIKE "s%";
SELECT * FROM employees WHERE last_name LIKE "%s";
SELECT * FROM employees WHERE hire_date = "2023%";
-- _oo_ this will look for 4 words start & end with random word --
SELECT * FROM employees WHERE job LIKE "_cook"; --undershalsh means random character--
SELECT * FROM employees WHERE hire_date LIKE "____-01-01"



------------------------ Orders ------------------------
SELECT * FROM employees ORDER BY last_name DESC; -- ASC --
SELECT * FROM transactions ORDER BY amount, cusomer_id;



------------------------ Limit ------------------------
SELECT * FROM customers LIMIT 4;
SELECT * FROM customers ORDER BY last_name DESC LIMIT 25, 15;



------------------------ Union ------------------------
SELECT * FROM income UNION SELECT * FROM expense; -- UNION ALL allows dupliate --
