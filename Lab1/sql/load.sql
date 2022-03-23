SHOW TABLES;

SHOW VARIABLES LIKE "secure_file_priv";

LOAD DATA INFILE "data_employees.txt" 
INTO TABLE employees
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(emp_no, birth_date, first_name, last_name, gender, hire_date);

LOAD DATA INFILE "data_departments.txt" 
INTO TABLE departments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE "data_dept_manager.txt"
INTO TABLE dept_manager
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE "data_dept_emp.txt"
INTO TABLE dept_emp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE "data_titles.txt"
INTO TABLE titles
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';

LOAD DATA INFILE "data_salaries.txt"
INTO TABLE salaries
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n';