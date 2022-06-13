-- Deliverable 1: The number of retiring employees by title
SELECT  e.emp_no,
		e.first_name,
        e.last_name, 
		t.title,
        t.from_date,
        t.to_date
INTO retirement_title
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
order by e.emp_no;

SELECT * FROM retirement_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_title
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;

SELECT * FROM unique_titles;

-- Employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles;

-- Deliverable 2:The employees eligible for the mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
		e.first_name,
        e.last_name,
		e.birth_date,
        de.from_date,
        de.to_date,
		t.title
INTO mentorship_eligibilty
FROM employees as e
LEFT JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
order by e.emp_no;

SELECT * FROM mentorship_eligibilty;


		