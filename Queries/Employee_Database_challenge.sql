SELECT
e.emp_no,
e.first_name,
e.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM 
employees as e
LEFT JOIN titles as ti 
ON (e.emp_no = ti.emp_no)
WHERE e.birth_date BETWEEN ('1952-01-01') AND ('1955-12-31')
ORDER BY e.emp_no asc

select * from unique_titles
SELECT DISTINCT ON (emp_no)
emp_no,
first_name,
last_name,
title
INTO 
unique_titles
FROM 
retirement_titles
ORDER BY 
emp_no asc, to_date desc


select
count(emp_no),
title
INTO retiring_titles
from unique_titles
group by(title)
order by count(title) desc

select distinct on(e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
into mentorship_eligibility
from employees e
left join dept_emp de
on (e.emp_no = de.emp_no)
left join titles ti
on (e.emp_no = ti.emp_no)
where (e.birth_date between ('1965-01-01') and ('1965-12-31'))
and de.to_date in ('9999-01-01')
order by e.emp_no, de.to_date asc