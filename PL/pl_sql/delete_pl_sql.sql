DECLARE
    vEmployee_id employees.employee_id%TYPE := 207;
BEGIN
    DELETE FROM employees
    WHERE employee_id = vEmployee_id;
    COMMIT;
END;

SELECT *
FROM employees;