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