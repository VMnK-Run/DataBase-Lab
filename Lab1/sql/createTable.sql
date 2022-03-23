use employees;
show TABLES;

DROP TABLE IF EXISTS departments;

CREATE TABLE employees(
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name CHAR(20) NOT NULL,
    last_name CHAR(20) NOT NULL,
    gender ENUM('M', 'F') NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY(emp_no)
);

CREATE TABLE departments(
    dept_no CHAR(10) NOT NULL,
    dept_name CHAR(20) NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY(dept_no),
    UNIQUE KEY(dept_name)
);

CREATE TABLE dept_manager(
    dept_no CHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY(dept_no, emp_no, from_date),
    CONSTRAINT fk_dept_manager_departments FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_dept_manager_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dept_emp(
    emp_no INT NOT NULL,
    dept_no CHAR(10) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY(dept_no, emp_no, from_date),
    CONSTRAINT fk_dept_emp_departments FOREIGN KEY(dept_no) REFERENCES departments(dept_no) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_dept_emp_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE titles(
    emp_no INT NOT NULL,
    title VARCHAR(50) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY(emp_no, from_date),
    CONSTRAINT pk_titles_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE salaries(
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY(emp_no, from_date),
    CONSTRAINT pk_salaries_employees FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE ON UPDATE CASCADE
);