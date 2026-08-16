-- Create Tables
CREATE TABLE departments (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT  -- This column will have NULLs for the trap!
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary INT,
    status VARCHAR(20)
);

CREATE TABLE projects (
    id INT PRIMARY KEY,
    employee_id INT,
    project_name VARCHAR(100)
);

-- Insert Sample Data
INSERT INTO departments VALUES 
(1, 'Human Resources', 101),
(2, 'Information Technology', 102),
(3, 'Sales', NULL),      -- No manager assigned!
(4, 'Marketing', 104);

INSERT INTO departments VALUES 
(5, 'Cleaning', 105)
;

INSERT INTO employees VALUES 
(1, 'Alice', 1, 60000, 'Active'),
(2, 'Bob', 2, 75000, 'Active'),
(3, 'Charlie', 2, 82000, 'Inactive'),
(4, 'Diana', 3, 55000, 'Active'),
(5, 'Eve', NULL, 95000, 'Active'),  -- Not assigned to any dept
(6, 'Frank', 4, 48000, 'Active');

INSERT INTO projects VALUES 
(1, 1, 'Project Alpha'),
(2, 2, 'Project Beta'),
(3, 2, 'Project Gamma'),
(4, 4, 'Project Delta'),
(5, 6, 'Project Epsilon');
-- Note: Eve (id=5) has no projects. Charlie (id=3) has no projects.

-- PROBLEMS

-- Write a query to find all employees who work in departments 1, 3, or 4.
select
	*
from
	employees
where
	id IN (1, 3, 4);
    
-- Find the names of all employees who are actively working on at least one project 
select
	name
from
	employees
where
	id IN (
		select
			employee_id
		from
			projects
    );
    
-- Find the names of all employees who are not assigned to any project.

select
	name
from
	employees
where
	id NOT IN (
		select
			employee_id
		from
			projects
		where
			employee_id IS NOT null
    );

/*
Find all employees who share the exact same department_id and 
salary as any employee named "Bob".
(Return the employee name, department, and salary).
*/

select
	*
from
	employees
where
	(department_id, salary) IN (
		select 
			department_id, salary
		from
			employees
		where 
			name = 'Bob'
        
    );

/*
Write a query to find the names of all employees who work in a department
 that does not have a manager assigned (manager_id IS NULL).
*/

select
	name
from
	employees
where
	department_id IN (
		select
			id
		from 
			departments
		where
			manager_id IS null
    );
    
/*
Write a query to find all departments that have no employees assigned to them.
*/
select
	*
from
	departments
where
	id NOT IN (
		select
			department_id
		from
			employees
		where
			department_id IS NOT null
            
    );

/*
Find the names of all employees 
who earn more than the average salary of their own specific department.
*/

select
	name
from
	employees as E
where
	salary > (
		select
			AVG(salary)
		from
			employees
		where
			department_id  = E.department_id  AND
             E.department_id IS NOT null
    );











