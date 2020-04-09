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