CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL,
    location VARCHAR(100) DEFAULT 'INDIA',
    department_code VARCHAR(50) UNIQUE,
    head_id INT,
    FOREIGN KEY(head_id)
		REFERENCES employees(id)
);

ALTER TABLE employees
ADD CONSTRAINT pk_id PRIMARY KEY (id);

ALTER TABLE employees
ADD CONSTRAINT uqfull_name_name UNIQUE (full_name);  

ALTER TABLE employees
ADD CONSTRAINT check_sal CHECK (fixed_salary > 1000) ;
	

