# 1
-- Find all the employees with the same hire date as employee 101010 using a sub-query.
SELECT 
	CONCAT(first_name, ' ', last_name) AS `Employees with hire_date similar to emp_no 101010`
FROM employees
WHERE hire_date IN (
	SELECT hire_date
	FROM employees
	WHERE emp_no = 101010
);

# 2
-- Find all the titles held by all employees with the first name Aamod
SELECT 
	title AS `Titles held by Aamod`
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
);

# 3
-- How many people in the employees table are no longer working for the company?
SELECT
	COUNT(emp_no)
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date < CURDATE()
);

# 4
-- Find all the current department managers that are female.
SELECT
	first_name,
	last_name
FROM employees
WHERE emp_no IN (
	SELECT emp_no
	FROM dept_manager
	WHERE to_date > CURDATE()
)
AND gender = 'F';

# 5 
-- Find all the employees that currently have a higher than average salary. 154543 rows in total. 

SELECT 
	first_name,
	last_name,
	salary
FROM employees
JOIN salaries USING (emp_no)
WHERE emp_no IN (
	SELECT emp_no
	FROM salaries
	WHERE salary > (
		SELECT
			AVG(salary)
		FROM salaries
	)
	AND salaries.to_date > CURDATE()
)
AND to_date > CURDATE();


# 6
-- How many current salaries are within 1 standard deviation of the highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
WHERE salary IN (
	SELECT MAX(salary)
	FROM salaries
	WHERE to_date > CURDATE()
);








