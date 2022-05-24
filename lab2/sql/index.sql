SET profiling = 1;
SELECT * 
FROM employees 
WHERE first_name = 'Peternela' AND last_name = 'Anick';
SET profiling = 0;
SHOW PROFILES;

EXPLAIN
SELECT * 
FROM employees 
WHERE first_name = 'Peternela' AND last_name = 'Anick';

CREATE INDEX idx_first_last_name ON employees(first_name, last_name);
CREATE INDEX employees_name_index ON employees(first_name, last_name);

-- DROP
ALTER TABLE employees DROP INDEX idx_first_last_name;
DROP INDEX idx_first_last_name ON employees;

-- 5.22
SET profiling = 1;
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, s.salary
FROM departments AS d
		INNER JOIN dept_emp AS de ON d.dept_no=de.dept_no
		INNER JOIN employees AS e ON de.emp_no=e.emp_no
		INNER JOIN salaries AS s ON e.emp_no=s.emp_no
WHERE e.first_name='Peternela' AND e.last_name='Anick';
SET profiling = 0;
SHOW PROFILES;



-- drop foreign keys
ALTER TABLE salaries DROP FOREIGN KEY fk_salaries_employees;
ALTER TABLE titles DROP FOREIGN KEY fk_titles_employees;
ALTER TABLE dept_emp DROP FOREIGN KEY fk_dept_emp_employees;
ALTER TABLE dept_emp DROP FOREIGN KEY fk_dept_emp_departments;
ALTER TABLE dept_manager DROP FOREIGN KEY fk_dept_manager_employees;
ALTER TABLE dept_manager DROP FOREIGN KEY fk_dept_manager_departments;


-- drop primary keys
ALTER TABLE employees DROP PRIMARY KEY;
ALTER TABLE departments DROP PRIMARY KEY;
ALTER TABLE dept_emp DROP PRIMARY KEY;
ALTER TABLE salaries DROP PRIMARY KEY;


-- add primary keys
ALTER TABLE employees ADD CONSTRAINT pk_employees PRIMARY KEY(emp_no);
ALTER TABLE departments ADD CONSTRAINT pk_departments PRIMARY KEY(dept_no);
ALTER TABLE dept_emp ADD CONSTRAINT pk_dept_emp PRIMARY KEY(emp_no, dept_no);
ALTER TABLE salaries ADD CONSTRAINT pk_salaries PRIMARY KEY(emp_no, from_date);


-- add foreign keys
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_employees FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
ALTER TABLE titles ADD CONSTRAINT fk_titles_employees FOREIGN KEY (emp_no) REFERENCES employees (emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_employees FOREIGN KEY (emp_no)  REFERENCES employees(emp_no);
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_employees FOREIGN KEY (emp_no)  REFERENCES employees(emp_no);
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_departments FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
