--PL/SQL

-- Utilizando o SELECT dentro do PL/SQL - SINTAXE
-- SELECT deve retorna somente uma linha.
-- Se retormas mais de uma gera a EXCEÇÃO TOO_MANY_ROWS
-- Se o SELECT retornar nenhuma linha gera a EXCEÇÃO NO_DATA_FOUND

SET SERVEROUTPUT ON -- Ativa o buffer de saída do servidor e direciona qualquer saída subsequente gerada pelo programa a ser exibida no painel de saída ou no console do aplicativo
 
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


-- Utilizando o DELETE dentro do PL/SQL - SINTAXE

DECLARE
    vemployee_id employees.employee_id%TYPE := 207;
BEGIN
    DELETE FROM employees
    WHERE
        employee_id = vemployee_id;
    COMMIT;
END;


--COMMIT Efetiva a tranzação 
DECLARE
    vemployee_id employees.employee_id%TYPE := 150;
BEGIN
    UPDATE employees
    SET
        salary = 15000
    WHERE
        employee_id = vemployee_id;

    COMMIT;
END;

--ROLLBACK Desfaz o comando
DECLARE
    vemployee_id employees.employee_id%TYPE := 150;
BEGIN
    UPDATE employees
    SET
        salary = 20000
    WHERE
        employee_id = vemployee_id;

    ROLLBACK;
END;


--SAVEPOINT Salva ate o ponto indicado
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
        employees_seq.NEXTVAL,
        'Marcos',
        'Lima',
        'gmailmarcos',
        '515.123.45568',
        sysdate,
        'IT_PROG',
        25000,
        0.4,
        103,
        60
    );
    SAVEPOINT insertok; -- Salva as operacões feita ate este ponto: Importante dar um nome para o "SAVEPONT nomeDoSavePoint"
    
    UPDATE employees
    SET
        salary = 30000
    WHERE
        job_id = 'IT_PROG';

    ROLLBACK TO insertok; -- O Rollback vai apagar só o comando UPDATE PORQUE foi passado o TO INSERTOK que esta salvo pelo SAVEPOINT
  
    COMMIT;
END;   


-- Convenções de Nomenclatura

-- Variavel             Prefixo v
-- Constante            Prefixo c
-- Exceção              Prefixo e
-- Parametro            Prefixo p
-- Variavel Global      Prefixo g
-- Cursor               Sufixo _cursor
-- Tipo Record          Sufixo _record_type
-- Variável Record      Sufixo _record



-- Criado Grupos utilizando a Cláusula GROUP BY

SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id 
ORDER BY department_id;

-- Utilizando a clásula Group by com mais de uma Coluna ou ExpressÃ£o

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando Funções de Grupo

SELECT department_id, AVG(salary)
FROM   employees;

-- Corrigindo consultas incorretas utilizando Funções de Grupo

SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas incorretas utilizando Funções de Grupo
SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;

-- Corrigindo consultas incorretas utilizando Funções de Grupo

-- Restringindo Grupos utilizando a cláusula HAVING

SELECT department_id, MAX(salary)
FROM   employees
GROUP BY department_id
HAVING MAX(salary)>10000;

SELECT job_id, SUM(salary) TOTAL
FROM   employees
WHERE  job_id <> 'SA_REP'
GROUP BY job_id
HAVING   SUM(salary) > 10000
ORDER BY SUM(salary);

-- Aninhando Funções de Grupo

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM   employees
GROUP BY department_id;