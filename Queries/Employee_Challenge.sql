-----------Retiring Employees---------

----Excerise 1----
--1. Join 'employees" and "titles" table together with primary key "emp_no"
--2. Filter data for employees who were born between 1952 and 1955. Then order by "emp.no"
--3. export results into "retirement_titles.csv"
SELECT 
  e.emp_no, e.first_name, e.last_name,
  t.title, t.from_date, t.to_date
  INTO retirees_titles
From
  employees AS e
  INNER JOIN titles AS t ON(e.emp_no = t.emp_no)
WHERE ( e.birth_date BETWEEN '1952-01-01'
    AND '1955-12-31')
ORDER BY e.emp_no ASC;


----Excerise 2----
--1. Removing Duplicate Enteries form "retirees_titles" table
--2. Remove employees no longer with company 
--3. Sort by "emp_no" and "to_date"
--4. Output to unique_titles table 
SELECT DISTINCT ON(emp_no)
  emp_no, first_name, last_name, title, to_date
  INTO unique_titles
FROM retirees_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

---Excerise 3---
--1. Count number of titles from "unique_titles" table
--2. Group by the "title" and sort by count in descending order 
--3. Output to "retiring_titles" table

SELECT
  title,
  COUNT(emp_no) AS count_titles
  INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count_titles DESC;

-----------Mentorship Program--------
--1. Remove duplicate rows
--2. Join "employees", "dept_emp" and "titles" table together using primary key "emp_no"
--3. Filter to current employees and birthdate January 1, 1965 and December 31, 1965.
--4. Sort by "emp_no"
--5. Outupt to "mentorship_eligibilty" table
SELECT DISTINCT ON(e.emp_no)
  e.emp_no, e.first_name, e.last_name, e.birth_date,
  de.from_date,  de.to_date,
  t.title,
  INTO mentorship_eligibilty
FROM employees AS e
    INNER JOIN dept_emp AS de ON(e.emp_no = de.emp_no)
        INNER JOIN titles AS t ON(e.emp_no = t.emp_no)
WHERE
  (de.to_date = '9999-01-01') AND
  (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no ASC;