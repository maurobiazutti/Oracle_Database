-- Controlando Transações do Banco de Dados

SET SERVEROUTPUT ON

DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   UPDATE employees 
   SET    salary = 15000
   WHERE  employee_id =  vEmployee_id;
   COMMIT; -- Vai Salvar no banco de dados a operação feita 
END;


DECLARE
   vEmployee_id    employees.employee_id%type := 150;
BEGIN
   UPDATE employees 
   SET    salary = 20000
   WHERE  employee_id =  vEmployee_id;
   ROLLBACK;  -- Vai desfazer o ultimo comando sem Salvar no banco
END;

BEGIN
    INSERT INTO employees 
    (employee_id, first_name, last_name, email, phone_number, hire_date,
    job_id, salary, commission_pct, manager_id, department_id)
    VALUES 
    (employees_seq.nextval, 'Kobe', 'Bryant', 'KBRYANT', '515.123.45568', SYSDATE,
    'IT_PROG', 15000, 0.4, 103, 60);
    
    SAVEPOINT INSERT_OK; -- Vai salvar as alterações ate aki
    
    UPDATE employees 
    SET    salary = 30000
    WHERE  job_id = 'IT_PROG';
    
    ROLLBACK TO UPDATE_OK; --Vai desfazer a operação de UPDATE 
    COMMIT; -- Vai Salvar no banco somente ATE O SAVEPOINT INSERT_OK
END;


