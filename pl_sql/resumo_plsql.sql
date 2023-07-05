--PL/SQL

-- Utilizando o SELECT dentro do PL/SQL - SINTAXE
-- SELECT deve retorna somente uma linha.
-- Se retormas mais de uma gera a EXCEÇÃO TOO_MANY_ROWS
-- Se o SELECT retornar nenhuma linha gera a EXCEÇÃO NO_DATA_FOUND

SET SERVEROUTPUT ON
 
/*
01 - Exemplo
Codigo Id: 121
Primeiro Nome: Adam
Ultimo Nome: Fripp
Salario: 8200
*/
DECLARE
    vfirst_name  employees.first_name%TYPE;
    vlast_name   employees.last_name%TYPE;
    vsalary      employees.salary%TYPE;
    vemployee_id employees.employee_id%TYPE := 121;
BEGIN
    SELECT
        first_name,
        last_name,
        salary
    INTO
        vfirst_name,
        vlast_name,
        vsalary
    FROM
        employees
    WHERE
        employee_id = vemployee_id;

    dbms_output.put_line('Codigo Id: ' || vemployee_id);
    dbms_output.put_line('Primeiro Nome: ' || vfirst_name);
    dbms_output.put_line('Ultimo Nome: ' || vlast_name);
    dbms_output.put_line('Salario: ' || vsalary);
END;


/*
02 - Exemplo
Cargo: IT_PROG
Media Salarios: 5760
Somatorio de Salarios: 28800
*/
DECLARE
    vjob_id     employees.job_id%TYPE := 'IT_PROG';
    vavg_salary employees.salary%TYPE;
    vsum_salary employees.salary%TYPE;
BEGIN
    SELECT
        round(AVG(salary),
              2),
        round(SUM(salary),
              2)
    INTO
        vavg_salary,
        vsum_salary
    FROM
        employees
    WHERE
        job_id = vjob_id;

    dbms_output.put_line('Cargo: ' || vjob_id);
    dbms_output.put_line('Media Salarios: ' || vavg_salary);
    dbms_output.put_line('Somatorio de Salarios: ' || vsum_salary);
END;


-- Utilizando o INSERT dentro do PL/SQL - SINTAXE

-- 01- Exemplo de como fazer INSET com PL/SQL
DECLARE
    vfisrt_name employees.first_name%TYPE;
    vlast_name  employees.last_name%TYPE;
    vsalary     employees.salary%TYPE;
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
        employees_seq.NEXTVAL,
        'Kobe',
        'Bryant',
        'KBRYANT',
        '515.123.48868',
        sysdate,
        'IT_PROG',
        15000,
        0.4,
        103,
        60
    );

    COMMIT;
END;


-- 02- Exemplo de como fazer INSET com PL/SQL
DECLARE
    vemployee_id    employees.employee_id%TYPE := employees_seq.NEXTVAL;
    vfisrt_name     employees.first_name%TYPE := 'Mauro';
    vlast_name      employees.last_name%TYPE := 'Biazutti';
    vemail          employees.email%TYPE := 'GMAILMAURO';
    vphone_number   employees.phone_number%TYPE := '37988222022';
    vhire_date      employees.hire_date%TYPE := sysdate;
    vjob_id         employees.job_id%TYPE := 'IT_PROG';
    vsalary         employees.salary%TYPE := 18000;
    vcommission_pct employees.commission_pct%TYPE := 0.4;
    vmanager_id     employees.manager_id%TYPE := 103;
    vdepartment_id  employees.department_id%TYPE := 60;
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
        vemployee_id,
        vfisrt_name,
        vlast_name,
        vemail,
        vphone_number,
        vhire_date,
        vjob_id,
        vsalary,
        vcommission_pct,
        vmanager_id,
        vdepartment_id
    );

    COMMIT;
END;

-- Utilizando o UPDATE dentro do PL/SQL - SINTAXE

--Atualizando salario com aumento de 10%
DECLARE
    vemployee_id employees.employee_id%TYPE := 209;
    vpercentual  NUMBER(3) := 10;
BEGIN
    UPDATE employees
    SET
        salary = (vpercentual / 100 * salary) + salary
    WHERE
        employee_id = vemployee_id;

    COMMIT;
END;