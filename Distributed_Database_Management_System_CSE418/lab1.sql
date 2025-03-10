--****************** Create Database **********************
CREATE DATABASE shopManagements;

--****************** create tables *********************
--1.Customers table :

CREATE TABLE customers(
    cid INT,
    name VARCHAR(50),
    address VARCHAR(50)
);

--2. Products table :

CREATE TABLE products(
    pid INT,
    pname VARCHAR(50),
    price INT
);

--3. Orders table :

CREATE TABLE orders(
    oid INT,
    cid INT,
    pid INT
);

--**************** Add Primary Keys ****************
ALTER TABLE customers
ADD PRIMARY KEY (cid);

ALTER TABLE products
ADD PRIMARY KEY (pid);

ALTER TABLE orders
ADD PRIMARY KEY (oid);

--**************** Insert data in table ****************
--1. customers table :
INSERT INTO customers (cid, name, address) VALUES
(1, 'Alice Johnson', '123 Maple St, Springfield'),
(2, 'Bob Smith', '456 Oak Rd, Riverdale'),
(3, 'Charlie Brown', '789 Pine Ave, Shelbyville'),
(4, 'Diana Prince', '101 Elm St, Gotham'),
(5, 'Evan Carter', '202 Birch Blvd, Metropolis'),
(6, 'Fiona White', '303 Cedar Dr, Star City'),
(7, 'George Miller', '404 Willow Way, Central City'),
(8, 'Helen Green', '505 Redwood Ln, Coast City'),
(9, 'Ian Gray', '606 Cherry St, Jump City'),
(10, 'Julia Roberts', '707 Maplewood Dr, Smallville');

--2. products table :
INSERT INTO products (pid, pname, price) VALUES
(1, 'Laptop', 1200),
(2, 'Smartphone', 800),
(3, 'Headphones', 150),
(4, 'Tablet', 300),
(5, 'Smartwatch', 250),
(6, 'Keyboard', 50),
(7, 'Mouse', 25),
(8, 'Monitor', 220),
(9, 'Charger', 15),
(10, 'Webcam', 90);

--3. orders table:
INSERT INTO orders (oid, cid, pid) VALUES
(1, 1, 3),
(2, 2, 7),
(3, 3, 1),
(4, 4, 5),
(5, 5, 2),
(6, 6, 8),
(7, 7, 4),
(8, 8, 9),
(9, 9, 6),
(10, 10, 10);

--*************** set foreign key *********************
ALTER TABLE orders
ADD FOREIGN KEY (cid) REFERENCES customers(cid);

ALTER TABLE orders
ADD FOREIGN KEY (pid) REFERENCES products(pid);



--***************************** QUESTIONS SOLVE *********************

--1. find the sum of prices of all products
--===>
SELECT SUM(price)
FROM products;

--2. Find the product with max price.
--===>
SELECT MAX(price)
FROM products;

--3. Find the second max.
--===>
SELECT price 
FROM products 
ORDER BY price DESC 
LIMIT 1 OFFSET 1;

--4. Find the number of customers.
--===>
SELECT COUNT(cid)
FROM customers;

--5. Find the avg amount ordered by cid = 1
--===>
SELECT AVG(p.price) AS avg_order_amount
FROM orders o
JOIN products p ON o.pid = p.pid
WHERE o.cid = 1;

--6. Find the avg amount ordered by Fiona White
--===>
SELECT AVG(p.price) AS avg_order_amount
FROM orders o
JOIN products p ON o.pid = p.pid
JOIN customers c ON o.cid = c.cid
WHERE c.name = 'Fiona White';

--7. Find who have orders.
--===>
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.cid = o.cid;

--8. Find who doesn't have any order
--===>
SELECT c.name
FROM customers c
LEFT JOIN orders o ON c.cid = o.cid
WHERE o.oid IS NULL;