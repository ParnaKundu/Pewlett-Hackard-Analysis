-- Query from the table
SELECT * FROM departments;

SELECT * FROM employees;

SELECT count(*) FROM dept_emp;

SELECT * FROM dept_manager;

SELECT count(*) FROM salaries;

SELECT count(*) FROM titles;


-- Determine Retirement Eligibility
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Employees born in 1952
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

-- Employees born in 1953
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

-- Employees born in 1954
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

-- Employees born in 1955
SELECT first_name, last_name 
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Determine Retirement Eligibility - born between 1952 & 1955 and hired between 1985 & 1988
SELECT first_name, last_name 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count the employees ready to retire
SELECT count(first_name) 
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create New Table
SELECT first_name, last_name 
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') 
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Query from the new table
SELECT * FROM retirement_info;
