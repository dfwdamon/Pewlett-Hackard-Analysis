SELECT * FROM public.language;

SELECT * FROM departments;

SELECT * FROM language;

SELECT * FROM employees;

-- Creating tables for PH-EmployeeDB
CREATE TABLE dep_emp (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);


DROP TABLE inventory CASCADE;


CREATE TABLE dept_emp (emp_no INT NOT NULL,
					   dept_no VARCHAR(4) NOT NULL,
					   from_date DATE NOT NULL,
					   to_date DATE NOT NULL,
					   FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
					   FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
					   PRIMARY KEY (emp_no, dept_no));

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, title, from_date)
);
					 
SELECT * FROM dept_emp;
					 

CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL,
  dept_name VARCHAR(40) NOT NULL,
  PRIMARY KEY (dept_no),
  UNIQUE (dept_name)
);					 
					 			 
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
					 
		
CREATE TABLE employees (
  emp_no INT NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  gender VARCHAR NOT NULL,
  hire_date DATE NOT NULL,
  PRIMARY KEY (emp_no)
);

					 
) 
-- ?? get an error when trying to import! 
SELECT * FROM dept_emp;

??
-- CREATE TABLE dept_emp (emp_no INT NOT NULL,
-- 					dept_no VARCHAR (4) NOT NULL,
-- 					from_date DATE NOT NULL,
-- 					to_date DATE NOT NULL,
-- 					PRIMARY KEY (emp_no, dept_no));
					
					
					


