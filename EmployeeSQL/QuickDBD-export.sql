-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Employees table
CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "birth_date" dateTime   NOT NULL,
    "first_name" varchar(24)   NOT NULL,
    "last_name" varchar(24)   NOT NULL,
    "gender" varchar(8)   NOT NULL,
    "hire_date" dateTime   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" varchar(16)   NOT NULL,
    "dept_name" varchar(24)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "EmployeesbyDepartment" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(16)   NOT NULL,
    "FromDate" dateTime   NOT NULL,
    "ToDate" dateTime   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "Salary" int   NOT NULL,
    "FromDate" dateTime   NOT NULL,
    "ToDate" dateTime   NOT NULL
);

CREATE TABLE "Titles" (
    "emp_no" int   NOT NULL,
    "Title" varchar(24)   NOT NULL,
    "FromDate" dateTime   NOT NULL,
    "ToDate" dateTime   NOT NULL
);

CREATE TABLE "DepartmentManager" (
    "dept_no" varchar(16)   NOT NULL,
    "emp_no" int   NOT NULL,
    "FromDate" dateTime   NOT NULL,
    "ToDate" dateTime   NOT NULL
);

ALTER TABLE "EmployeesbyDepartment" ADD CONSTRAINT "fk_EmployeesbyDepartment_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "EmployeesbyDepartment" ADD CONSTRAINT "fk_EmployeesbyDepartment_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "DepartmentManager" ADD CONSTRAINT "fk_DepartmentManager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

