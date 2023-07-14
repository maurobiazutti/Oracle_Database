-- Criando uma Procedure de Banco de Dados ENTRADA tipo IN

--Estrutura Basica
CREATE OR REPLACE PROCEDURE PRC_NOME_DA_PROCEDURE (
-- Paramentros da procedure
) AS
-- Variáveis
BEGIN
-- CÓDIGO DA PROCEDURE

END;

--EX - 1 - Inserindo novos dados na tabela
CREATE OR REPLACE PROCEDURE PRC_INSERE_EMPREGADO
-- variaveis que vão receber os parametros
  (pfirst_name    IN VARCHAR2,
   plast_name     IN VARCHAR2,
   pemail         IN VARCHAR2,
   pphone_number  IN VARCHAR2,
   phire_date     IN DATE DEFAULT SYSDATE,
   pjob_id        IN VARCHAR2,
   pSALARY        IN NUMBER,
   pCOMMICION_PCT IN NUMBER,
   pMANAGER_ID    IN NUMBER,
   pDEPARTMENT_ID IN NUMBER)
IS 

BEGIN
-- inserindo os parametros recebidos
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
    department_id )
  VALUES (
    employees_seq.nextval,
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    psalary,
    pcommicion_pct,
    pmanager_id,
    pdepartment_id );
EXCEPTION
  WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando a Procedure pelo Bloco PL/SQL
BEGIN
  PRC_INSERE_EMPREGADO('David', 'Bowie','DBOWIE','515.127.4861',SYSDATE,'IT_PROG',15000,NULL,103,60);
  COMMIT;
END;

-- Consultando o empregado inserido
SELECT *
FROM   employees
WHERE  first_name = 'David' AND
       last_name = 'Bowie';

-- Executando a Procedure com o comando EXECUTE do SQL*PLUS
EXEC PRC_INSERE_EMPREGADO('Greg', 'Lake','GLAKE','515.127.4961',SYSDATE,'IT_PROG',15000,NULL,103,60)
COMMIT;

-- Consultando o empregado inserido
SELECT *
FROM   employees
WHERE  first_name = 'Greg' AND
       last_name = 'Lake';


--EX - 2 - Aumento de Salario
CREATE OR REPLACE PROCEDURE PRC_AUMENTA_SALARIO_EMPREGADO
  (pemployee_id   IN NUMBER,
   ppercentual    IN NUMBER)
IS
  -- Nenhuma Variavel declarada
BEGIN
  UPDATE employees 
  SET salary = salary * (1 + ppercentual / 100)
  WHERE employee_id = pemployee_id;

EXCEPTION
  WHEN OTHERS 
  THEN
     RAISE_APPLICATION_ERROR(-20001, 'Erro Oracle: ' || SQLCODE || ' - ' || SQLERRM);
END;

-- Executando a Procedure pelo Bloco PL/SQL

BEGIN
  PRC_AUMENTA_SALARIO_EMPREGADO(109,10);
  COMMIT;
END;

-- Utilizando Parametros tipo OUT e IN OUT
CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO
  (pemployee_id   IN NUMBER,
   pfirst_name    OUT VARCHAR2,
   plast_name     OUT VARCHAR2,
   pemail         OUT VARCHAR2,
   pphone_number  OUT VARCHAR2,
   phire_date     OUT DATE,
   pjob_id        OUT VARCHAR2,
   pSALARY        OUT NUMBER,
   pCOMMISSION_PCT OUT NUMBER,
   pMANAGER_ID    OUT NUMBER,
   pDEPARTMENT_ID OUT NUMBER)
IS 
BEGIN
  SELECT
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
  INTO 
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    psalary,
    pcommission_pct,
    pmanager_id,
    pdepartment_id
  FROM employees
  WHERE employee_id = pemployee_id;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
     RAISE_APPLICATION_ERROR(-20001, 'Empregado NÃ£o existe: ' || pemployee_id);
  WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando procedure parametro Tipo OUT
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
  employees_record  employees%ROWTYPE;
BEGIN
  PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary, 
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;

-- Utilizando Parametros tipo OUT com opções NOCOPY
CREATE OR REPLACE PROCEDURE PRC_CONSULTA_EMPREGADO
  (pemployee_id   IN NUMBER,
   pfirst_name    OUT NOCOPY VARCHAR2,
   plast_name     OUT NOCOPY VARCHAR2,
   pemail         OUT NOCOPY VARCHAR2,
   pphone_number  OUT NOCOPY VARCHAR2,
   phire_date     OUT NOCOPY DATE,
   pjob_id        OUT NOCOPY VARCHAR2,
   pSALARY        OUT NOCOPY NUMBER,
   pCOMMISSION_PCT OUT NOCOPY NUMBER,
   pMANAGER_ID    OUT NOCOPY NUMBER,
   pDEPARTMENT_ID OUT NOCOPY NUMBER)
IS 
BEGIN
  SELECT
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
  INTO 
    pfirst_name,
    plast_name,
    pemail,
    pphone_number,
    phire_date,
    pjob_id,
    psalary,
    pcommission_pct,
    pmanager_id,
    pdepartment_id
  FROM employees
  WHERE employee_id = pemployee_id;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
     RAISE_APPLICATION_ERROR(-20001, 'Empregado NÃ£o existe: ' || pemployee_id);
  WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;

-- Executando procedure parametro Tipo OUT
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE 
  employees_record  employees%ROWTYPE;
BEGIN
  PRC_CONSULTA_EMPREGADO(100, employees_record.first_name, employees_record.last_name, employees_record.email,
    employees_record.phone_number, employees_record.hire_date, employees_record.job_id, employees_record.salary, 
    employees_record.commission_pct, employees_record.manager_id, employees_record.department_id);
    DBMS_OUTPUT.PUT_LINE(employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
END;



--Procedure Cadastro e Validação
--PROCEDURE PARA CADASTRAR USUÁRIO
CREATE OR REPLACE PROCEDURE prc_insert_cadastro_produto (
    p_nome_produto  VARCHAR2,
    p_linha_produto VARCHAR2,
    p_tipo_produto  CHAR
) AS
    v_count INT := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO v_count
    FROM
        tb_produto
    WHERE
        nome_produto = p_nome_produto;

    IF ( NVL(v_count, 0) > 0 ) THEN
        INSERT INTO tb_produto (
            id_produto,
            nome_produto,
            linha_produto,
            tipo_produto
        ) VALUES (
            id_produto.NEXTVAL,
            p_nome_produto,
            p_linha_produto,
            p_tipo_produto
        );

    ELSE
        raise_application_error(-20001, 'PRODUTO CADASTRADO COM SUCESSO!');
    END IF;

END;



--Procedure Cadastro e Validação
--PROCEDURE PARA EXCLUSÃO EMPRESA
CREATE OR REPLACE PROCEDURE prc_delete_cadastro_empresa (
    p_id_empresa INT
) AS
    v_count INT := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO v_count
    FROM
        tb_empresa
    WHERE
        id_empresa = p_id_empresa;

    IF ( nvl(v_count, 0) > 0 ) THEN
        DELETE FROM tb_empresa
        WHERE
            id_empresa = p_id_empresa;

        COMMIT;
    ELSE
        raise_application_error(-20001, 'EMPRESA NÃO EXISTE!');
    END IF;

END;



--Procedure DELETE
--PROCEDURE PARA EXCLUSÃO EMPRESA
CREATE OR REPLACE PROCEDURE prc_delete_cadastro_empresa (
    p_id_empresa INT
) AS
    v_count INT := 0;
BEGIN
    SELECT
        COUNT(1)
    INTO v_count
    FROM
        tb_empresa
    WHERE
        id_empresa = p_id_empresa;

    IF ( nvl(v_count, 0) > 0 ) THEN
        DELETE FROM tb_empresa
        WHERE
            id_empresa = p_id_empresa;

        COMMIT;
    ELSE
        raise_application_error(-20001, 'EMPRESA NÃO EXISTE!');
    END IF;

END;





