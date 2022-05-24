
set global log_bin_trust_function_creators=TRUE;
delimiter |
CREATE FUNCTION is_manager(emp_no_in INT) RETURNS BOOLEAN
BEGIN
	IF NOT EXISTS(
		SELECT * 
        FROM dept_manager
        WHERE emp_no = emp_no_in
    )
    THEN RETURN FALSE;
    ELSE RETURN TRUE;
    END IF;
END |
delimiter ;

SELECT is_manager(110022) AS is_manager;
SELECT is_manager(100002) AS is_manager;


-- DROP
DROP FUNCTION IF EXISTS is_manager;