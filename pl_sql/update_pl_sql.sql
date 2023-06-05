SET SERVEROUTPUT ON

DECLARE
    vEmployee_id   employees.employee_id%type := 207;
    vPercentual    NUMBER(3) := 10;
BEGIN
    UPDATE  employees
    SET     salary = salary * (1 + vpercentual / 100)
    WHERE   employee_id = vemployee_id;
    COMMIT;
END;

SELECT *
FROM employees
WHERE employee_id = 207;