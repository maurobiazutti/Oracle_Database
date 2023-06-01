--Usando o SELECTE  dentro do bloco 

SET SERVEROUTPUT ON

DECLARE
    vFirst_name     funcionarios.first_name%TYPE; 
    vLast_name      funcionarios.last_name%TYPE;
    vSalary         funcionarios.salary%TYPE;
    vEmployee_id    funcionarios.employee_id%TYPE :=121;
BEGIN
    SELECT first_name, last_name, salary
    INTO vfirst_name, vlast_name, vsalary
    FROM funcionarios
    WHERE employee_id = vEmployee_id;
    DBMS_OUTPUT.PUT_LINE('Employee id: ' || vEmployee_id); 
    DBMS_OUTPUT.PUT_LINE('First Name: ' || vFirst_name);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || vLast_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || vSalary);
END;


DECLARE
    vJob_id             funcionarios.job_id%TYPE := 'IT_PROG';
    vMedia_Salario     funcionarios.salary%TYPE;
    VSoma_Salario      funcionarios.salary%TYPE;
BEGIN
    SELECT ROUND(AVG(salary),2), ROUND(SUM(salary),2)
    INTO vMedia_salario, vSoma_Salario
    FROM funcionarios
    WHERE job_id = vJob_id;
    DBMS_OUTPUT.PUT_LINE('Cargo: ' || vjob_id);
    DBMS_OUTPUT.PUT_LINE('Media de Salarios: ' || vmedia_salario);
    DBMS_OUTPUT.PUT_LINE('Soma dos Salarios: ' || vsoma_salario);
END;


















