CREATE TABLE Employee (
	id INT,
    full_name VARCHAR(50),
    salary INT
);

ALTER TABLE 
	employees 
ADD 
	age INT;
    
ALTER TABLE
	employees
DROP COLUMN
	age;
    

ALTER TABLE 
	employees
MODIFY
	salary DECIMAL(10,2);
    
ALTER TABLE
	employees
RENAME COLUMN
	salary
TO
	fixed_salary;
	
    

RENAME TABLE
	employee
TO
	employees;


DROP TABLE employee;