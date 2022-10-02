-- Deliverable 1
-- DROP TABLE if error occurs
-- DROP TABLE retirement_titles;
-- Table 1: Retirement Titles
SELECT e.emp_no, e.first_name, e.last_name, t.title,t.from_date, t.to_date, e.birth_date
INTO retirement_titles
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
Where(e.birth_Date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (e.emp_no) ASC;
-- VIEW TABLE
SELECT * FROM retirement_titles;
-- export csv

-- DROP TABLE IF ERROR OCCURS
-- DROP TABLE unique_titles;
-- Table 2 Unique Titles, Use Retirement Titles
Select DISTINCT ON(rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY (rt.emp_no) ASC;
-- VIEW TABLE
SELECT * FROM unique_titles;
-- export csv

-- DROP TABLE if error occurs
-- DROP TABLE retiring_titles_count;
-- #16. Table 3 : UNIQUE TITLE COUNT
SELECT COUNT(ut.emp_no) , ut.title
INTO retiring_titles_count
FROM unique_titles AS ut
GROUP BY ut.title
ORDER BY COUNT DESC;
-- View Table
SELECT * FROM retiring_titles_count;
-- export csv
-- SELECT SUM (count) FROM retiring_titles_count;


-- Deliverable 2
-- Drop Table if error/ inaccurate data stored for table
-- DROP TABLE mentorship_eligibilty;
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_emp AS de	
ON (e.emp_no = de.emp_no)
WHERE(e.birth_Date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY (e.emp_no) ASC;
-- VIEW TABLE
SELECT * FROM mentorship_eligibility;
-- View Count
SELECT COUNT (*) FROM mentorship_eligibility;
-- export .csv

