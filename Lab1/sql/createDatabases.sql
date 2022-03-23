SHOW DATABASES;
DROP DATABASE employees;
---
DELETE FROM employees;
DELETE FROM dept_emp;
DELETE FROM dept_manager;
DELETE FROM departments;
DELETE FROM titles;
DELETE FROM salaries;
CREATE DATABASE IF NOT EXISTS employees;
use employees;