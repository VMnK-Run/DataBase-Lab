CREATE TRIGGER updateDepartmentName
AFTER UPDATE ON departments_copy
FOR EACH ROW
INSERT INTO departments_copy_log(login_name, update_date, dept_no, dept_name_old, dept_name_new)
VALUES(user(), current_timestamp(), old.dept_no, old.dept_name, new.dept_name);



UPDATE departments_copy
SET dept_name = CONCAT(dept_name, ' Dept')
WHERE dept_no = 'd005';
SELECT * FROM departments_copy;
SELECT * FROM departments_copy_log;

-- DROP　AND DELETE
DROP TRIGGER IF EXISTS updateDepartmentName;
DELETE FROM departments_copy_log;
DROP TABLE departments_copy_log;

