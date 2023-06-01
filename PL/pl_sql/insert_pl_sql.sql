DECLARE

BEGIN
INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    email,
    phone_number,
    hire_date,
    job_id,
    salary,
    commission_pct,
    manager_id,
    department_id
) VALUES (
    employees_seq.nextval, 
    'Kobe',
    'Bryant',
    'KBRYANT',
    '551.123.45568',
    SYSDATE,
    'IT_PROG',
    15000,
    0.4,
    103,
    60
);
COMMIT;
END;

SELECT *
FROM employees
WHERE first_name = 'Kobe';
