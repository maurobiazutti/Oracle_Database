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

