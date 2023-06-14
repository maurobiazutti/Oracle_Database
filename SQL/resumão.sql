--Exibe todas as colunas e dados da tabela employees
SELECT * 
FROM employees;

--Exibe as colunas first_name concatenada com last_name com Alias "Nome Completo" da tabela employees
SELECT first_name || ' ' || last_name "Nome Completo", job_id "Cargo" ,commission_pct "Comissão"
FROM employees;

/*Retornar apenas valores únicos de uma coluna ou conjunto de colunas. 
Ele remove as duplicatas dos resultados da consulta, 
exibindo apenas um registro para cada valor único encontrado*/
SELECT DISTINCT department_id
FROM employees;

--WHERE
--Vai trazer todos os department_id = 90
SELECT employee_id, last_name, job_id, department_id
FROM employees
WHERE department_id = 90;

--Vai buscar os salarios entre 8000 e 15000
SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 8000 and 15000;

--Busca uma lista de valores utilizando o operador IN
SELECT first_name, salary, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP');

--Busca com WHERE LIKE
SELECT first_name ,last_name
FROM employees
WHERE first_name LiKE '%ha%'--Busca todas as palavras que tenha "ha"
AND last_name LIKE '%ll%';--"AND -> E" Todos q contenha "ll" no last_name

WHERE first_name LiKE 'I%';--Começa com "I" 
WHERE first_name LiKE 'ar%';--Termina com "ar"
WHERE first_name LiKE 'I%l'; --Começa com "I" e termina com "l"

--WHERE NULL
WHERE manager_id IS NULL; -- Para busca "NULL" na coluna

--WHERE AND EXIBE QUANDO AS DUAS CONDIÇÕES FOREM TRUE
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
AND job_id = 'IT_PROG';--Busca pelos salarios MAIOR OU IGUAL A 5000 E que sejam IT_PROG

--WHERE OR Vai trazer todos que atenda pelo menos UM dos requisitos
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 5000
OR job_id = 'IT_PROG';

--WHERE NOT
SELECT employee_id, last_name ,salary, job_id
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'FI_ACCOUNT', 'SA_REP'); --Vai Trazer todos que não estão na lista.


--ORDER BY
SELECT last_name, hire_date
FROM employees
ORDER BY hire_date; --Ordem Crescente

SELECT last_name, hire_date
FROM employees
ORDER BY hire_date DESC;-- Ordem Descendente

SELECT last_name, salary*12 Salario_Anual
FROM employees
ORDER BY Salario_Anual;--TBM pode ser referenciado por ALIAS

SELECT last_name, department_id, salary
FROM employees
ORDER BY department_id, salary DESC; --Pode ser ordenado por duas colunas


--Variavel de Substituição
SELECT last_name, department_id, salary, job_id
FROM employees
WHERE job_id = '&job_id'; --Se for string ou data tem q esta entre ' '

SELECT last_name, department_id, salary, job_id
FROM employees
WHERE department_id = &department_id; -- Para Numero
