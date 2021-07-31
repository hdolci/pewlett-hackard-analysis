SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
first_name, 
last_name,
title,
from_date,
to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
	ON employees.emp_no = titles.emp_no
	WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;



SELECT * FROM retirement_titles;


--Remove duplicate employees 

SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

--Empolyees near retirement by most recent job title
SELECT 
COUNT(title),
title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;



--Mentorship Eligibility
SELECT DISTINCT ON (employees.emp_no) employees.emp_no,
first_name,
last_name,
birth_date,
dept_emp.from_date,
dept_emp.to_date,
title
INTO mentorship_eligibilty
FROM employees
JOIN dept_emp
	ON employees.emp_no = dept_emp.emp_no
JOIN titles
	ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date = '9999-01-01') AND 
	(employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no;


