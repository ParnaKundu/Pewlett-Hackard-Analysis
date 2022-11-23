------- DELIVERABLE 1--------

-- Create a Retirement Titles table to hold titles for employees born between Jan 1, 1952 and Dec 31, 1955 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees AS e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--Remove Duplicates to retain the most recent titles of current employees into Unique titles table
SELECT DISTINCT ON (emp_no) emp_no, 
            first_name,
            last_name,
            title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Create Retiring titles table that contain the count of employees by their most recent job title
SELECT COUNT(title) as "Count", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "Count" DESC;

------- DELIVERABLE 2--------

-- Select all employees with their current title
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
        e.first_name, 
        e.last_name,
        e.birth_date, 
        de.from_date,
        de.to_date, 
        t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE de.to_date = '9999-01-01'
    AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;
