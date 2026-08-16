create database existsdb;
use existsdb;
-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Data
INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Alice', 'NY'),
(2, 'Bob', 'LA'),
(3, 'Charlie', 'NY'),
(4, 'Diana', 'SF');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(101, 1, '2024-01-10'),
(102, 1, '2024-05-15'),
(103, 2, '2023-12-01'),
(104, 3, '2024-03-20'),
(105, 3, '2024-07-22');

INSERT INTO Products (ProductID, ProductName, Price, Stock) VALUES
(1, 'Phone', 500.00, 10),
(2, 'Headphones', 30.00, 25),
(3, 'Charger', 15.00, 50),
(4, 'Monitor', 200.00, 5);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(201, 101, 1, 1),  -- Alice bought Phone
(202, 101, 2, 2),  -- Alice bought Headphones
(203, 102, 3, 1),  -- Alice bought Charger
(204, 103, 2, 1),  -- Bob bought Headphones
(205, 104, 1, 1),  -- Charlie bought Phone
(206, 105, 3, 2);  -- Charlie bought Charger

show tables;

-- 1 Write a query to find all customers who have placed at least one order.

select
	*
from
	customers as C
where
	EXISTS (
		select 
			*
		from
			orders
		where
			customerID = C.customerID
	); 


-- 2 Write a query to find all customers who have never placed an order.

select
	*
from
	customers as C
where
	NOT EXISTS (
		select 
			*
		from
			orders
		where
			customerID = C.customerID
	); 

-- Write a query to find all products that have been ordered at least once.

select
	*
from
	products as P
where
	EXISTS (
		select
			*
		from
			OrderDetails
		where
			productID = P.productID
    );
		
-- 5 Write a query to find all customers who have ordered at least one product with a price greater than $50.






















