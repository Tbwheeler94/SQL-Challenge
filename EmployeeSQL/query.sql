--Create Employees Tables
CREATE TABLE "employees" (
    "emp_no" int,
    "birth_date" date,
    "first_name" varchar(24),
    "last_name" varchar(24),
    "gender" varchar(8),
    "hire_date" date,
    PRIMARY KEY ("emp_no")
);

--Create Employees Salaries Table
CREATE TABLE salaries (
emp_no INT NOT NULL,
salary INT NOT NULL,
from_date DATE NOT NULL,
to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
PRIMARY KEY (emp_no, from_date)
);

--Create Department Manager Table
CREATE TABLE dept_mananager (
dept_no VARCHAR,
emp_no INT,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--Create Departments Table
CREATE TABLE departments (
dept_no VARCHAR,
dept_name VARCHAR,
PRIMARY KEY(dept_no)
);

--Create Department Employees Table
CREATE TABLE dept_emp (
emp_no INT,
dept_no VARCHAR,
from_date DATE,
to_date DATE,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

--Create Titles Table
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

--Select Employee Number, Last Name, First Name, Gender, Salary
SELECT emp.emp_no,
emp.last_name,
emp.first_name,
emp.gender,
sal.Salary
--Join Employees and Salaries tables on employee number
FROM employees as emp
LEFT JOIN salaries as sal
ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

----List employees who were hired in 1986
--Select Employee Number, First Name, Last Name, Hire Date
SELECT emp_no, first_name, last_name, hire_date
FROM employees
--Filter for hire dates during 1986
WHERE hire_date >= '1986-01-01'
  AND hire_date < '1986-12-31';
  
--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.

SELECT f.dept_no, d.dept_name, 
f.emp_no, e.last_name, 
e.first_name, f.from_date, f.to_date
FROM dept_manager as f
--Join employee, dept_emp, departments tables
LEFT JOIN departments as d
ON (d.dept_no = f.dept_no)
LEFT JOIN employees as e
ON (e.emp_no = f.emp_no);

--List the department of each employee with the following 
--information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
--Join employee, dept_emp, departments tables
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no);

--List all employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT emp_no, first_name, last_name, hire_date
FROM employees
--Filter for people with first name Hercules and last names beginning with B
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';
  
---List all employees in the Sales department, 
---including their employee number, last name, 
---first name, and department name.

--Select emp_no, last_name, first_name from employee and dept_name from departments
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
--Join employee, dept_emp, departments tables
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no)
--Filter by only Sales department
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

--Select emp_no from employee and dept_name from departments
SELECT e.emp_no, e.last_name, e.first_name, f.dept_name
FROM employees as e
--Join employee, dept_emp, departments tables
LEFT JOIN dept_emp as d
ON (d.emp_no = e.emp_no)
LEFT JOIN departments as f
ON (f.dept_no = d.dept_no)
--Filter for people in Sales & Development departments
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.

--Select and groupby last name column, run count on each last name
SELECT last_name, 
COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY employees.count DESC;

---List employee salary by title (Bonus)
CREATE VIEW title_salary AS
SELECT titles.title, salaries.salary
FROM titles
LEFT JOIN salaries
ON (salaries.emp_no = titles.emp_no);











