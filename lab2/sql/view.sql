CREATE VIEW finance_employees_view AS
    SELECT employees.emp_no, first_name, last_name, gender, birth_date, hire_date
    FROM employees
    WHERE employees.emp_no IN
    (
        SELECT dept_emp.emp_no
        FROM dept_emp
        WHERE dept_emp.dept_no = 
        (
            SELECT departments.dept_no 
            FROM departments 
            WHERE departments.dept_name LIKE '%Finance%'
        )
    );

SELECT * FROM finance_employees_view LIMIT 10;
SELECT COUNT(*) FROM finance_employees_view;


-- DROP
DROP VIEW IF EXISTS finance_employees_view;
