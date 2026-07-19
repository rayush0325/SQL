/* inserting values in all column*/
employeesINSERT INTO 
	employees
VALUES
( 1, 'ayush', 5000 ),
(2, 'devansh', 6000),
(3, 'yash', 7000)
;

/*insert into specific columns*/
INSERT INTO 
	employees(id, full_name)
VALUES
	(4, 'anurag');

INSERT INTO employees
VALUES (1, 'ayush', 5000);
    

INSERT INTO employees (age)
VALUES (25);
/*new row is created using insert query */    
    

SELECT
	*
FROM 
	employees;