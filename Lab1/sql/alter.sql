USE employees;
SHOW TABLES;
#5.14
INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date)
VALUES(10000, '1981-10-1', 'Jimmy', 'Lin', 'M', '2011-12-8');
#5.15
UPDATE employees SET first_name = 'Jim' WHERE emp_no = 10000; 

#5.16
DELETE FROM employees WHERE emp_no = 10000;

#5.17
INSERT INTO employees(emp_no, birth_date, first_name, last_name, gender, hire_date) 
VALUES(
    10001, '1981-10-1', 'Jimmy', 'Lin', 'M', '2011-12-8'
);

DELETE FROM employees WHERE emp_no = 10001;