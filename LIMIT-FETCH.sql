CREATE DATABASE practicelimitdb;
use practicelimitdb;

-- 1. Employees table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees (id, name, department, salary, hire_date) VALUES
(1, 'Alice',   'Engineering', 95000.00, '2020-01-15'),
(2, 'Bob',     'Engineering', 85000.00, '2019-03-22'),
(3, 'Charlie', 'Sales',       72000.00, '2021-06-10'),
(4, 'Diana',   'Sales',       78000.00, '2018-11-01'),
(5, 'Eve',     'Marketing',   65000.00, '2022-02-20'),
(6, 'Frank',   'Engineering', 92000.00, '2020-07-05'),
(7, 'Grace',   'Marketing',   68000.00, '2019-09-30'),
(8, 'Henry',   'Sales',       81000.00, '2021-12-12'),
(9, 'Ivy',     'Engineering', 88000.00, '2020-04-18'),
(10,'Jack',    'Sales',       75000.00, '2022-08-25'),
(11,'Karen',   'Marketing',   70000.00, '2021-01-14'),
(12,'Leo',     'Engineering', 91000.00, '2019-05-20');

-- 2. Orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1,  101, '2024-01-10 10:30:00', 150.00),
(2,  102, '2024-01-12 14:20:00', 45.50),
(3,  101, '2024-02-01 09:15:00', 230.00),
(4,  103, '2024-02-15 16:45:00', 320.00),
(5,  104, '2024-03-01 11:00:00', 120.00),
(6,  102, '2024-03-05 13:30:00', 89.99),
(7,  101, '2024-03-20 08:00:00', 400.00),
(8,  105, '2024-04-10 10:00:00', 210.00),
(9,  103, '2024-04-15 15:30:00', 175.00),
(10, 104, '2024-05-01 12:00:00', 60.00),
(11, 106, '2024-05-20 09:30:00', 550.00),
(12, 102, '2024-06-01 17:00:00', 95.00),
(13, 101, '2024-06-15 11:00:00', 130.00),
(14, 105, '2024-07-01 14:00:00', 270.00),
(15, 103, '2024-07-15 10:30:00', 180.00);

-- 3. Products table
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products (id, product_name, category, price, stock) VALUES
(1,  'Laptop',     'Electronics', 1200.00, 15),
(2,  'Mouse',      'Electronics', 25.00,   100),
(3,  'Keyboard',   'Electronics', 75.00,   30),
(4,  'Monitor',    'Electronics', 300.00,  8),
(5,  'Desk Chair', 'Furniture',   250.00,  12),
(6,  'Bookshelf',  'Furniture',   180.00,  5),
(7,  'Notebook',   'Stationery',  5.00,    200),
(8,  'Pen Set',    'Stationery',  15.00,   150),
(9,  'Printer',    'Electronics', 450.00,  6),
(10, 'Desk Lamp',  'Furniture',   35.00,   20);