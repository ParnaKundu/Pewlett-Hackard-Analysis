# Pewlett-Hackard-Analysis
Database with SQL

## Overview of the Analysis

Pewlett Hackard is a large company boasting several thousand employees, and it's been around for a long time. As baby boomers begin to retire at a rapid rate, Pewlett Hackard is looking towards the future in two ways. First, it's offering a retirement package for those who meet certain criteria. Second, it's starting to think about which positions will need to be filled in the near future. 

In addition, the company is also attempting to identify employees who are eligible to participate in a mentorship program. This analysis will help the company be prepared for the 'silver tsunami' as many current employees reach retirement age.


## Results -- Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed.

- The analysis shows that there will be over 72,000 employees retiring. The breakup based on the departments is [Retiring roles.](https://github.com/ParnaKundu/Pewlett-Hackard-Analysis/blob/main/retiring_titles.png)

- The analysis also reveals that only 2 'Managers' are retiring and the majority of the retiring employees are 'Senior Engineer' and 'Senior Staff'. 

- Looking at the mentorship_eligibility table, there are 1549 employees that are eligible for being mentors.

- The mentorship_eligibility and the retirement_titles table show that several employees have been holding the same title for a long time.

## Summary -- Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."

- How many roles will need to be filled as the "silver tsunami" begins to make an impact?

    A total of 72,458 employees will be retiring as the "silver tsunami" begins to make an impact. As such Pewlett Hackard should plan to fill 72,458 roles.


- Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

    Yes, there are a total of 1,549 retirement-ready employees who are qualified to mentor the next generation of Pewlett Hackard employees.

-  Additional queries :-

    1. The following query can be written to determine how many mentors are available in each department  

        SELECT title, COUNT(title) as Count
        FROM mentorship_eligibility
        GROUP BY title
        ORDER BY title;

        The result is as shown in [Mentorship results.](https://github.com/ParnaKundu/Pewlett-Hackard-Analysis/blob/main/mentorship.png)

    2. The following query can be written to understand how many employees are retiring from each department

        SELECT d.dept_name, count(de.to_date)
        FROM unique_titles as t
        LEFT JOIN dept_emp as de
        on t.emp_no = de.emp_no
        LEFT JOIN departments as d
        ON de.dept_no = d.dept_no
        GROUP BY d.dept_name, de.to_date
        HAVING de.to_date = '9999-01-01';

        The result is as shown in [Department count.](https://github.com/ParnaKundu/Pewlett-Hackard-Analysis/blob/main/department.png)



