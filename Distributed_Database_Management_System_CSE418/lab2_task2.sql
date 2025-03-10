--***************** Create database *****************
CREATE DATABASE coffeeShopDB;

--**************** Create table *******************
1. customer table: 
CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(50)
);

--2. products table:
CREATE TABLE product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

--3. order table:
CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) 
    REFERENCES customer(customer_id)
);

--4. order details:
CREATE TABLE orderDetails(
    orderDetail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) 
    REFERENCES orders(order_id),
    FOREIGN KEY (product_id) 
    REFERENCES product(product_id)
);

--*************** Insert data in table ***************
customer data:
INSERT INTO customer (customer_id, name, phone) VALUES
(1, 'Alice Johnson', '01711111111'),
(2, 'Bob Smith', '01722222222'),
(3, 'Charlie Brown', '01733333333'),
(4, 'David Lee', '01744444444'),
(5, 'Emma Watson', '01755555555'),
(6, 'Frank Miller', '01766666666'),
(7, 'Grace Kelly', '01777777777'),
(8, 'Hannah White', '01788888888'),
(9, 'Ian Thomas', '01799999999'),
(10, 'Jack Wilson', '01800000000');

product data:
INSERT INTO product (product_id, product_name, price) VALUES
(1, 'Espresso', 2.50),
(2, 'Cappuccino', 3.50),
(3, 'Latte', 4.00),
(4, 'Americano', 3.00),
(5, 'Mocha', 4.50),
(6, 'Macchiato', 3.75),
(7, 'Flat White', 4.25),
(8, 'Cold Brew', 4.50),
(9, 'Iced Latte', 4.75),
(10, 'Affogato', 5.00);

order data:
INSERT INTO orders (order_id, customer_id, total_price) VALUES
(1, 1, 7.50),
(2, 2, 9.00),
(3, 3, 12.50),
(4, 4, 6.00),
(5, 5, 8.75),
(6, 6, 11.25),
(7, 7, 10.50),
(8, 8, 7.25),
(9, 9, 9.50),
(10, 10, 13.00);

orderDetails data:
INSERT INTO orderDetails (orderDetail_id, order_id, product_id, quantity) VALUES
(1, 1, 2, 2),
(2, 1, 5, 1),
(3, 2, 3, 1),
(4, 2, 6, 2),
(5, 3, 1, 2),
(6, 3, 8, 1),
(7, 4, 4, 2),
(8, 5, 7, 1),
(9, 5, 9, 2),
(10, 6, 10, 1);


--******************** 5 queries **************************
--1. Get All Customers:
SELECT * FROM customer;

--2.Get All Orders with Total Price
SELECT order_id, customer_id, total_price FROM orders;

--3.Find Orders of a Specific Customer
SELECT * FROM orders WHERE customer_id = 5;

--4.Get Order Details with Product Names
SELECT od.orderDetail_id, od.order_id, p.product_name, od.quantity 
FROM orderDetails od
JOIN product p ON od.product_id = p.product_id;

--5.Find Customers Who Have Placed Orders
SELECT DISTINCT c.name 
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id;