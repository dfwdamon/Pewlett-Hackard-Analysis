SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--skill drill--
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';
--skill drill--

--count function
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


SELECT  first_name, last_name
INTO retirement_info --places query results into a New Table!--
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');


--Join Retirement_info table with the Data_Emp emp_no column. --
DROP TABLE retirement_info;

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
-- check the table
SELECT * FROM retirement_info;

-- redone with alias --
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date,
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

	
-- Joining retirement_info and dept_emp tables --
SELECT retirement_info.emp_no,
	retirement_info.first_name,
retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp  -- second table
ON retirement_info.emp_no = dept_emp.emp_no; -- ON two table and column names

-- shorten with alias --
SELECT retirement_info.emp_no,
	retirement_info.first_name,
retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp  -- second table
ON retirement_info.emp_no = dept_emp.emp_no;

-- shortened --
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;


SELECT ri.emp_no,
	ri.first_name,
ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');


SELECT * FROM current_emp;

--9/29 PM--
-- 7.3.3 -- 
-- Joining depts and dept_manager tables
-- INNER JOIN --
SELECT departments.dept_name, -- selects only the columns we want to view from T1/T2. --
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
	FROM departments -- points to T1 to be joined. --
	INNER JOIN dept_manager -- points to the second table T2 to join. --
	ON departments.dept_no = dept_manager.dept_no -- Tells where Postgres should look for matches --  

-- Use LEFT JOIN to capture retirement-info Table -- 
-- Joining retirement_info and ept_emp tables
SELECT retirement_info.emp_no,  
	retirement_info.first_name,	
	retirement_info.last_name,
	dept_emp.to_date
	FROM retirement_info
	LEFT JOIN dept_emp
	ON retirement_info.emp_no = dept_emp.emp_no --Where tables are linked--

-- 7.3.4 --
-- 10/1/2022 -- 

-- Employee count by department number --
SELECT COUNT(ce.emp_no), de.dept_no  -- count func used on emp_no for total empl-- 
FROM current_emp as ce  -- Alias assigned to both tables --
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no -- match on emp_no col.--
GROUP BY de.dept_no  -- GROUP BY added to the select statement --
ORDER BY de.dept_no -- orders by dept_no --
--CREATE TABLE new_table;??


SELECT * FROM Salaries
ORDER BY to_date DESC;

-- --
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info -- new temp table -- 
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- 2. Mgmt List --
-- List of mgrs per department --
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
-- INTO manager_info
FROM dept_manager AS dm
INNER JOIN departments AS d
	ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp AS ce
	ON (dm.emp_no = ce.emp_no);


--3. Department Retirees --
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp AS ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);



-- 7.3.6 Create a Tailored List --
-- SKILL DRILL -- ??
-- SELECT * FROM departments;
-- d007 is Sales --
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
FROM current_emp AS ce
INNER JOIN dept_emp AS de
ON (de.emp_no = ce.emp_no)
INNER JOIN departments AS d
ON (d.dept_no = de.dept_no)
WHERE (d.dept_name 'Sales');
