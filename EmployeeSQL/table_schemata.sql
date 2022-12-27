DROP TABLE IF EXISTS departments cascade;

CREATE TABLE departments (
    dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(80) NOT NULL
);

DROP TABLE IF EXISTS titles cascade;

CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY NOT NULL,
    title VARCHAR(80) NOT NULL
);

DROP TABLE IF EXISTS employees cascade;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

DROP TABLE IF EXISTS dept_emp cascade;

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT dept_emp_prim PRIMARY KEY (emp_no, dept_no)
);

DROP TABLE IF EXISTS dept_manager cascade;

CREATE TABLE dept_manager (
    dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT dept_manager_prim PRIMARY KEY (dept_no, emp_no)
);

DROP TABLE IF EXISTS salaries cascade;

CREATE TABLE salaries (
    emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary INT NOT NULL
);