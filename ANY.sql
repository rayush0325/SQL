-- Table 1: Products
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    price DECIMAL(10,2),
    category VARCHAR(20)
);



-- Table 2: Competitor_Prices
CREATE TABLE Competitor_Prices (
    id INT PRIMARY KEY,
    competitor VARCHAR(20),
    price DECIMAL(10,2),
    category VARCHAR(20)
);

INSERT INTO Products (id, name, price, category) VALUES
(1, 'Laptop', 1200.00, 'Electronics'),
(2, 'Mouse', 20.00, 'Electronics'),
(3, 'Keyboard', 45.00, 'Electronics'),
(4, 'Monitor', 300.00, 'Electronics'),
(5, 'Tablet', 400.00, 'Electronics'),
(6, 'Chair', 150.00, 'Furniture'),
(7, 'Desk', 450.00, 'Furniture'),
(8, 'Bookshelf', 275.00, 'Furniture');

INSERT INTO Competitor_Prices (id, competitor, price, category) VALUES
(1, 'CompA', 1100.00, 'Electronics'),
(2, 'CompB', 50.00, 'Electronics'),
(3, 'CompC', 25.00, 'Electronics'),
(4, 'CompD', 100.00, 'Furniture'),
(5, 'CompE', 500.00, 'Furniture'),
(6, 'CompF', 450.00, 'Furniture'),
(7, 'CompG', 30.00, 'Electronics');


-- 1 Retrieve all products that have a price greater than 
-- the price of any competitor product in the Electronics category.

select
	*
from
	products
where
	price > ANY (
		select
			price
		from
			competitor_prices
		where
			category = 'Electronics' AND
            price IS NOT null
            
    );

-- 2 	Retrieve all products that have a price less than 
-- the price of any competitor product in the Furniture category.


-- 3 Retrieve all products whose price exactly matches
-- the price of any competitor product (across all categories).

select
	*
from
	products
where	
	price = ANY (
		select 
			price
		from
			competitor_prices
		where
			price IS NOT null
    );

-- 4 Retrieve all Electronics products whose price is greater than or equal to the price of any competitor product in the same Electronics category.



select
	*
from
	products
where
	category = 'Electronics' AND
    price >= ANY (
		select
			price
		from
			competitor_prices
		where
			category = 'Electronics' AND
            price IS NOT null
    );



-- 5 Retrieve all products (any category) whose price is less than or equal to the price of any competitor product that is priced above 200.

select
	*
from
	products
where
	price <=  ANY (
		select
			price
		from
			competitor_prices
		where
			price > 200 AND
			price is not null
    );

-- 6 Retrieve all products whose price is not equal to the price of any competitor product 

select
	*
from
	products
where
	NOT price = ANY (
		select
			price
		from
			competitor_prices
		where
			price IS NOT null
	);


-- 7 Retrieve all Furniture products that are 
-- cheaper than at least one Furniture competitor, and simultaneously more expensive than at least one other Furniture competitor.


select
	*
from
	products
where
	category = 'Furniture' 
    AND
	price < ANY (
		select
			price
		from
			competitor_prices
		where
			category = 'Furniture' AND
			price IS NOT null
    )
    AND
    price > ANY (
		select
			price
		from
			competitor_prices
		where
			category = 'Furniture' AND
			price IS NOT null
    );

































