-- Drop tables if exist
DROP TABLE IF EXISTS departments, dept_emp, dept_manager, salaries, titles, employees;

-- Create tables.
-- The create sequence: departments → titles → employees → dept_emp → dept_manager → salaries

CREATE TABLE departments (
    dept_no CHAR(4) NOT NULL PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE titles (
    title_id CHAR(5) NOT NULL PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title CHAR(5) NOT NULL REFERENCES titles(title_id),
    birth_date DATE,
    first_name VARCHAR,
    last_name VARCHAR,
    sex CHAR(1) CHECK (sex = 'M' OR sex = 'F'),
    hire_date DATE
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL REFERENCES employees(emp_no),
    dept_no CHAR(4) NOT NULL REFERENCES departments(dept_no),
    PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE dept_manager (
    dept_no CHAR(4) NOT NULL REFERENCES departments(dept_no),
    emp_no INT NOT NULL PRIMARY KEY REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL PRIMARY KEY REFERENCES employees(emp_no),
    salary INT NOT NULL
);