# 1 Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT 
	emp_no, dept_no, hire_date, to_date,
	IF(to_date > now(), 1, 0) AS is_current_employee
FROM employees
JOIN dept_emp USING(emp_no);

# 2 Write a query that returns all employee names, and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT 
	first_name, last_name, 
		CASE 
			WHEN last_name REGEXP '^[a-h]' THEN 'A-H'
			WHEN last_name REGEXP '^[i-q]' THEN 'I-Q'
			WHEN last_name REGEXP '^[r-z]' THEN 'R-Z'
			ELSE 'Other'
		END AS alpha_group
FROM employees;

# 3 How many employees were born in each decade?

SELECT COUNT(*),
	CASE
		WHEN birth_date LIKE '198%' THEN '80s'
		WHEN birth_date LIKE '197%' THEN '70s'
		WHEN birth_date LIKE '196%' THEN '60s'
		WHEN birth_date LIKE '195%' THEN '50s'
		WHEN birth_date LIKE '194%' THEN '40s'
	 	ELSE 'other'
	 END AS decade
FROM employees
GROUP BY decade;

