SHOW TABLES;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM titles;
SELECT * FROM salaries;

SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM departments;
SELECT COUNT(*) FROM dept_manager;
SELECT COUNT(*) FROM dept_emp;
SELECT COUNT(*) FROM titles;
SELECT COUNT(*) FROM salaries;

SELECT * FROM salaries WHERE emp_no = 10001;

#5.1 返回前10条员工记录
SELECT * 
FROM employees 
LIMIT 0, 10;
#5.2
SELECT emp_no, birth_date, gender, hire_date 
FROM employees 
WHERE first_name = 'Peternela' AND last_name = 'Anick';
#5.3
SELECT emp_no, first_name, last_name, birth_date
FROM employees 
WHERE birth_date BETWEEN '1961-7-15' AND '1961-7-20';
#5.4
SELECT * 
FROM employees 
WHERE first_name LIKE 'Peter%' OR last_name LIKE 'Peter%';
#5.5
SELECT MAX(salary) AS max_salary 
FROM salaries;
#5.6
SELECT dept_no, COUNT(emp_no) AS dept_emp_count 
FROM dept_emp 
GROUP BY dept_no ORDER BY dept_no;
#5.7
SELECT emp_no, dept_no, from_date, to_date 
FROM dept_emp 
WHERE emp_no IN 
    (
        SELECT emp_no 
        FROM employees 
        WHERE first_name = 'Peternela' 
        AND last_name = 'Anick'
    ); --task5.7
--------------------
#5.8
SELECT emp_no, first_name, last_name 
FROM employees
WHERE (first_name, last_name) IN
(SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING COUNT(*) > 1);-- 5.8

SELECT employees1.emp_no, employees2.emp_no, employees1.first_name, employees2.last_name
FROM employees employees1, employees employees2
WHERE employees1.emp_no < employees2.emp_no 
    AND employees1.first_name = employees2.first_name
    AND employees1.last_name = employees2.last_name
LIMIT 0, 10;
--------------------
#5.9
(
    SELECT emp_no 
    FROM employees
    WHERE first_name = 'Margo' AND last_name = 'Anily'
)
UNION
(
    SELECT emp_no 
    FROM employees
    WHERE birth_date = '1959-10-30'AND hire_date = '1989-09-12'
);--task 5.9

#5.10
SELECT dept_name
FROM departments
WHERE dept_no =
    (
        SELECT dept_no
        FROM dept_emp
        WHERE emp_no = 
        (
            SELECT emp_no
            FROM employees
            WHERE first_name = 'Margo'
            AND last_name = 'Anily'
        )
    );--task 5.10

#5.11
SELECT dept_name
FROM departments JOIN 
    (
        dept_emp JOIN employees 
        ON dept_emp.emp_no = employees.emp_no
        AND employees.first_name = 'Margo'
        AND employees.last_name = 'Anily'
    ) 
ON departments.dept_no = dept_emp.dept_no;--task 5.11
-----------------------------------------
#5.12
SELECT emp_no, first_name, last_name
FROM employees
WHERE NOT EXISTS
(
    SELECT *
    FROM departments
    WHERE NOT EXISTS
    (
        SELECT *
        FROM dept_emp
        WHERE dept_emp.emp_no = employees.emp_no
        AND dept_emp.dept_no = departments.dept_no
    )
);

SELECT dept_no
FROM departments
WHERE not EXISTS
(
    SELECT dept_no
    FROM dept_emp
    WHERE dept_emp.dept_no = departments.dept_no
);
---------------------------------

#5.13
SELECT dept_emp.dept_no, dept_name, COUNT(dept_emp.dept_no) AS dept_emp_count
FROM dept_emp, departments
WHERE departments.dept_no = dept_emp.dept_no
GROUP BY dept_emp.dept_no HAVING COUNT(*) > 50000
ORDER BY dept_emp.dept_no;--task 5.13
