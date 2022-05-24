use employees;
set global log_bin_trust_function_creators=TRUE;
DELIMITER |
CREATE PROCEDURE calc_avg_and_var_salary_for_emp_no(
    IN emp_no_in INT,
    OUT avg REAL,
    OUT var REAL
)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE newSalary INTEGER;
    DECLARE cnt INTEGER;
    DECLARE MovieCursor CURSOR FOR
        SELECT salary FROM salaries WHERE emp_no = emp_no_in;
    DECLARE CONTINUE HANDLER FOR NOT found SET done = 1;

    SET avg = 0.0;
    SET var = 0.0;
    SET cnt = 0;
    OPEN MovieCursor;
    MovieLoop : LOOP
        FETCH FROM MovieCursor INTO newSalary;
        IF done = 1 THEN LEAVE MovieLoop; END IF;
        SET cnt = cnt + 1;
        SET avg = avg + newSalary;
        SET var = var + newSalary * newSalary;
    END LOOP;
    SET avg = avg / cnt;
    SET var = var / cnt - avg * avg;
    CLOSE MovieCursor;
END |

DELIMITER ;

CALL calc_avg_and_var_salary_for_emp_no(10002 , @avg_salary, @var_salary);
SELECT @avg_salary AS avg_salary, @var_salary AS var_salary;

-- DROP 
DROP PROCEDURE IF EXISTS calc_avg_and_var_salary_for_emp_no;