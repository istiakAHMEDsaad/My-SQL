--==================== Database customer management ====================

-- Step 1: (create databse)
CREATE DATABASE customer_managment

-- Step 2: (create customers table)
CREATE TABLE customers(
	cid INT PRIMARY KEY,
	name VARCHAR(20),
    address VARCHAR(50)
);

-- Step 3: (create products table)
CREATE TABLE products(
	pid INT PRIMARY KEY,
    	pname VARCHAR(30),
	price INT
);

-- Step 4: (create order table)	
CREATE TABLE orders(
	oid INT PRIMARY KEY,
    	cid INT,
    	pid INT,
    	FOREIGN KEY (cid) REFERENCES customers (cid),
    	FOREIGN KEY (pid) REFERENCES products (pid)
);


-- Step 5: (insert data in customers table)
INSERT INTO customers (cid, name, address) VALUES
(1, 'John Doe', '123 Elm Street, Springfield'),
(2, 'Jane Smith', '456 Oak Avenue, Metropolis'),
(3, 'Bob Johnson', '789 Pine Road, Smalltown'),
(4, 'Alice Cooper', '101 Maple Lane, Rivertown'),
(5, 'Charlie Brown', '202 Birch Blvd, Hilltop City');

-- Step 6: (insert data in products table)
INSERT INTO products (pid, pname, price) VALUES
(1, 'Laptop', 1000),
(2, 'Smartphone', 500),
(3, 'Headphones', 150),
(4, 'Tablet', 300),
(5, 'Smartwatch', 200);

-- Step 7: (insert data in orders table)
INSERT INTO orders (oid, cid, pid) VALUES
(1, 1, 1), -- John Doe ordered a Laptop
(2, 2, 2), -- Jane Smith ordered a Smartphone
(3, 3, 3), -- Bob Johnson ordered Headphones
(4, 4, 4), -- Alice Cooper ordered a Tablet
(5, 5, 5); -- Charlie Brown ordered a Smartwatch
--================================================================

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Question Solve ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. Find the sum of prices of all products:
	SELECT SUM(price)
	FROM products;

-- 2. Find the product with max price:
	SELECT MAX(price)
	FROM products;

-- 3. Find the second max:
	SELECT price
	FROM products
	ORDER BY price DESC
	LIMIT 1 OFFSET 1;

-- 4. Find the number of customers:
	SELECT COUNT(*)
	FROM customers;

-- 5. Find the avg amount orderd by cid = 1
 	SELECT AVG(pri.price) AS average_order_amount
	FROM orders ord
	JOIN products pri ON ord.pid = pri.pid
	WHERE ord.cid = 1;

-- 6. Find the avg amount ordered by  Alice Cooper:
 	SELECT AVG(pri.price) AS average_order_amount
	FROM orders ord
	JOIN products pri ON ord.pid = pri.pid
	JOIN customers cus ON ord.cid = cus.cid
	WHERE cus.name = 'Alice Cooper';

-- 7. Find who have orders:
 	SELECT DISTINCT cus.name
	FROM customers cus
	JOIN orders ord ON cus.cid = ord.cid;

-- 8. Find who have orders:
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~