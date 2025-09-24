-- 1. Create Database
CREATE DATABASE IF NOT EXISTS InternshipDB;
USE InternshipDB;

-- 2. Drop tables if they exist (reverse dependency order)
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS `Order`;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Customer;

-- 3. Create tables in correct order

-- Customer Table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Category Table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Product Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Order Table
CREATE TABLE `Order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- OrderItem Table
CREATE TABLE OrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10,2) NOT NULL,
    method VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id)
);

USE InternshipDB;

SHOW TABLES;

-- Optional: check table structure
DESCRIBE Customer;
DESCRIBE Product;
DESCRIBE `Order`;



-- Sample Category
INSERT INTO Category(name, description) VALUES ('Electronics', 'Electronic gadgets');

-- Sample Product
INSERT INTO Product(name, description, price, stock_quantity, category_id)
VALUES ('Smartphone', 'Android phone', 19999.99, 10, 1);

-- Sample Customer
INSERT INTO Customer(first_name, last_name, email, phone)
VALUES ('Gayatri', 'A', 'gayatri@example.com', '1234567890');

-- Sample Order
INSERT INTO `Order`(customer_id, status) VALUES (1, 'Pending');

-- Sample OrderItem
INSERT INTO OrderItem(order_id, product_id, quantity, price) VALUES (1, 1, 1, 19999.99);

-- Sample Payment
INSERT INTO Payment(order_id, amount, method, status) VALUES (1, 19999.99, 'Credit Card', 'Completed');
