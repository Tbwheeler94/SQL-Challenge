CREATE TABLE "employees" (
    "emp_no" int,
    "birth_date" date,
    "first_name" varchar(24),
    "last_name" varchar(24),
    "gender" varchar(8),
    "hire_date" date,
    PRIMARY KEY ("emp_no")
);

CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, from_date)
);

CREATE TABLE dept_mananager (
dept_no VARCHAR,
emp_no INT,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE departments (
dept_no VARCHAR,
dept_name VARCHAR,
PRIMARY KEY(dept_no)
);

CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE titles (
emp_no INT,
title VARCHAR,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, from_date)
);

select * from salaries

----List the following details of each employee: employee number, 
----last name, first name, gender, and salary.

SELECT emp.emp_no,
emp.last_name,
emp.first_name,
emp.gender,
sal.Salary
FROM employees as emp
LEFT JOIN salaries as sal
ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

----List employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
  AND hire_date < '1986-12-31';
  
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT f.dept_no, d.dept_name, 
f.emp_no, e.last_name, 
e.first_name, f.from_date, f.to_date
FROM dept_manager as f
LEFT JOIN departments as d
ON (d.dept_no = f.dept_no)
LEFT JOIN employees as e
ON (e.emp_no = f.emp_no);

--List the department of each employee with the following 
--information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no);

--List all employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';
  
---List all employees in the Sales department, 
---including their employee number, last name, 
---first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no)
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no)
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

SELECT last_name, 
COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY employees.count DESC;












