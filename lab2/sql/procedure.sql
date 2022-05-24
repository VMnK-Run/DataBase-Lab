CREATE PROCEDURE calc_avg_salary_for_emp_no(
    IN emp_no_in INT,
    OUT avg FLOAT
)
BEGIN
    SELECT AVG(salary) INTO avg
    FROM salaries s
    WHERE s.emp_no = emp_no_in
    GROUP BY s.emp_no;
END;


DROP PROCEDURE IF EXISTS calc_avg_salary_for_emp_no;

CALL calc_avg_salary_for_emp_no(10002, @avg_salary);
SELECT @avg_salary;
