-- Consultando dados utilizando o comando SQL SELECT

-- Utilizando o comando DESCRIBE
DESCRIBE employees

DESC employess

DESC departments

DESC Jobs

DESC departments

--Para mostrar todos os usuarios
SELECT ALL_USERS. *
FROM ALL_USERS;


-- Selecionando todas as colunas da Tabela
SELECT *
FROM   departments;

DESC employees

SELECT *
FROM   employees;

DESC Jobs

SELECT * 
FROM   jobs;

-- Selecionando colunas específicas
SELECT employee_id, first_name, last_name, salary
FROM   employees;

SELECT department_id, department_name, manager_id
FROM   departments;

-- Utilizando operadores aritméticos
SELECT  first_name, last_name, salary, salary * 1.15 
FROM    employees;

-- Regras de Precedência de Operadores (MESMA DA MATEMATICA)
SELECT  first_name, last_name, salary, salary + 100 * 1.15 
FROM    employees;

-- Utilizando parênteses para alterar a precedência
SELECT  first_name, last_name, salary, (salary + 100) * 1.15 
FROM    employees;

--Entendo o valor Nulo (NULL É A AUSÊNCIA DE VALOR)
SELECT  first_name, last_name, job_id, salary,  commission_pct
FROM    employees;

-- Utilizando Valores Nulos em expressões aritméticas
SELECT  first_name, last_name, job_id, commission_pct, 200000 * commission_pct
FROM    employees
WHERE   commission_pct IS NULL;

-- Utilizando Alias de Coluna
SELECT first_name AS nome, last_name AS sobrenome, salary AS salário
FROM employees;

SELECT first_name nome, last_name  sobrenome, salary salário
FROM employees;

SELECT first_name "Nome", last_name "Sobrenome", salary "Salário ($)", commission_pct "Percentual de comissão"
FROM   employees;

-- Utilizando Operador de concatenação 
SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM   employees;

-- Utilizando Operador de concatenação e Strings de caracteres 
SELECT first_name || ' ' || last_name || ', data de admissão: ' || hire_date "Funcionário"
FROM   employees;


-- Utilizando Concatenação com Alias
SELECT
    first_name  || ' ' || 
    last_name || ' ' "Nome", 
    salary "Salario",
    department_id "Setor"
FROM
    employees
WHERE
    department_id = 60;

NOME                SALARIO     SETOR
Alexander Hunold 	9000	    60
Bruce Ernst 	    6000	    60
David Austin 	    4800	    60
Valli Pataballa 	4800	    60
Diana Lorentz 	    4200	    60


-- Utilizando Operador alternativo para aspas
SELECT department_name || q'[ Department's Manager Id: ]'
|| manager_id "Departamento e Gerente"
FROM departments;

-- Linhas duplicadas
SELECT department_id
FROM employees;

-- Utilizando DISTINCT para eliminar linhas duplicadas
SELECT DISTINCT department_id
FROM employees;

SELECT DISTINCT last_name
FROM employees;

SELECT DISTINCT last_name, first_name
FROM employees;

