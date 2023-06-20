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


/*FUNÇÕES SINGLE-ROW

--Funções de Caracter

--Case Conversion
LOWER   -> Transforma em minuscula
UPPER   -> Transforma em Maiuscula
INITCAP -> Transforma primeira letra de cada palavra em Maiuscula

--Caracter Manipulation
CONCAT  -> (‘Curso', 'Introdução ORACLE 19c’) Concatena = Curso Introdução ORACLE 19c
SUBSTR  -> (‘Introdução_ORACLE 19c’,1,11) pega do 1 ao 11 caracter = introduçao_ 
LENGTH  -> (‘Introdução ORACLE 19c’) Vai devolver o tamanho = 21
INSTR   -> (‘Introdução ORACLE 19c’, ORACLE) Vai procurar um 2°string dentro da 1° devolve a posição = 12 
LPAD    -> (‘Introdução ORACLE 19c’, 30, '*') Vai alinha tuda a direito e completar o tamanho de 30 com '*' = *******Introdução ORACLE 19c
RPAD    -> (‘Introdução ORACLE 19c’, 30, '*') Vai alinha tuda a esquerda e completar o tamanho de 30 com '*' = Introdução ORACLE 19c*******
REPLACE -> (‘Introdução ORACLE 12c', '12c', '19c’) Vai procurar e substituir o 2° argumento pelo 3° =  Introdução ORACLE 19c 
TRIM    -> (';' FROM ';nome@gmail.com;') Vai procurar o primeiro argumento e excluir do segundo = nome@gmail.com
RTRIM   -> (';nome@gmail.com;', ';') Vai excluir do 1° o que tiver no 2° do lado direito = ;nome@gmail.com
LTRIM   -> (';nome@gmail.com;', ';') Vai excluir do 1° o que tiver no 2° do lado esquedo = nome@gmail.com;
*/

--UPPER
SELECT last_name, department_id, salary, job_id
FROM employees
WHERE UPPER (last_name) = 'KING';

--CONCAT
SELECT CONCAT(' Curso: ','IntroduÃ§Ã£o ORACLE 19c'), SUBSTR('IntroduÃ§Ã£o ORACLE 19c',1,11),
       LENGTH('IntroduÃ§Ã£o ORACLE 19c'), INSTR('IntroduÃ§Ã£o ORACLE 19c','ORACLE')
FROM dual;

--LPAD / RPAD
SELECT first_name "Nome", LPAD(first_name, 20, ' ') "Nome alinhado a direita", RPAD(first_name, 20, ' ') "Nome alinhado a esquerda"
FROM   employees;

--REPLACE
SELECT job_title, REPLACE(job_title, 'President', 'Presidente') CARGO
FROM jobs
WHERE  job_title = 'President';

-- Funçoes tipo NUMBER
--ROUND(numero, precisão) +6 ARREDONDA PARA CIMA
SELECT ROUND(45.923,2), ROUND(45.923,0)
FROM dual;

--TRUNC (numero, precisão) CORTA SEM ARRENDONDAR
SELECT TRUNC(45.923,2), TRUNC(45.923,0)
FROM dual;

--RESTO
SELECT MOD(1300,600) RESTO
FROM dual;

--Numero Absoluto e RAIZ
SELECT ABS(-9), SQRT(9)
FROM dual;


-- Utilizando a Funções TO_CHAR com Datas
SELECT last_name,TO_CHAR(hire_date, 'DD/MM/YYYY  HH24:MI:SS') DT_ADMISSÃ‚O
FROM employees;

SELECT sysdate,TO_CHAR(sysdate, 'DD/MM/YYYY  HH24:MI:SS') DATA
FROM   dual;

--Vai imprimir 03 de   junho    de     2023 
SELECT last_name, TO_CHAR(hire_date, 'DD, "de" Month "de" YYYY') DT_ADMISSÃ‚O
FROM employees;

--FMDD vai Eliminar os espaços e zeros que vem por padrão imprimir 3 de junho de 2023 
SELECT last_name, TO_CHAR(hire_date, 'FMDD, "de" Month "de" YYYY') DT_ADMISSÃ‚O
FROM employees;


-- Utilizando a Funções TO_CHAR com Numeros
--Pode Ser usado como Modelo Padrão para converção de dinheiro 'L99G999G999D99' "L moeda local" "G virgula" "D decimal ponto"
SELECT first_name, last_name, TO_CHAR(salary, 'L99G999G999D99') SALARIO
FROM employees;


-- Utilizando a Funções TO_DATE
SELECT TO_DATE('06/02/2020','DD/MM/YYYY') DATA
FROM  dual;

SELECT first_name, last_name, hire_date
FROM   employees
WHERE  hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');

-- Utilizando Funções Aninhadas
-- Vai retorna o numero de meses entre a data atual e a data de entrada "hire_date"
SELECT first_name, last_name, ROUND(MONTHS_BETWEEN(SYSDATE, hire_date),0) NUMERO_MESES
FROM   employees
WHERE  hire_date = TO_DATE('17/06/2003','DD/MM/YYYY');


-- Utilizando a Funções COALESCE
SELECT COALESCE(NULL, NULL, 'ExpresssÃ£o 3'), COALESCE(NULL, 'ExpressÃ£o 2', 'ExpresssÃ£o 3'),
       COALESCE('ExpressÃ£o 1', 'ExpressÃ£o 2', 'ExpresssÃ£o 3')
FROM dual;

SELECT last_name, employee_id, commission_pct, manager_id, 
       COALESCE(TO_CHAR(commission_pct),TO_CHAR(manager_id),
       'Sem percentual de comissÃ£o e sem gerente')
FROM employees;


-- Utilizando a Funções NVL
SELECT last_name, salary, NVL(commission_pct, 0), salary*12 SALARIO_ANUAL, 
       (salary*12) + (salary*12*NVL(commission_pct, 0)) REMUNERACAO_ANUAL
FROM employees;

-- Utilizando a Função NVL2
SELECT last_name, salary, commission_pct, 
       NVL2(commission_pct, 10, 0) PERCENTUAL_ATERADO
FROM employees;

-- Utilizando a Função NULLIF
SELECT NULLIF(1000,1000), NULLIF(1000,2000)
FROM dual;

SELECT first_name, last_name, LENGTH(first_name) "Expressão 1",
       LENGTH(last_name) "Expressão 2", NULLIF(LENGTH(first_name), LENGTH(last_name)) RESULTADO
FROM employees;


-- Expressão CASE
SELECT last_name, job_id, salary,
                          CASE job_id
                             WHEN 'IT_PROG'   
                               THEN 1.10*salary
                             WHEN 'ST_CLERK' 
                               THEN 1.15*salary
                             WHEN 'SA_REP' 
                               THEN 1.20*salary
                             ELSE salary 
                           END "NOVO SALARIO"
FROM employees;

-- Utilizando a Funções DECODE
SELECT last_name, job_id, salary,
DECODE(job_id, 'IT_PROG' , 1.10*salary,
               'ST_CLERK', 1.15*salary,
               'SA_REP'  , 1.20*salary
                         , salary) "NOVO SALARIO"
FROM employees

-- Utilizando as Funções AVG e SUM
SELECT round(AVG(salary),2), SUM(salary)
FROM   employees;

-- Utilizando as Funções MIN e MAX
SELECT MIN(hire_date), MAX(hire_date)
FROM   employees;

SELECT MIN(salary), MAX(salary)
FROM   employees;

-- Utilizando a Função COUNT
SELECT COUNT(*)
FROM   employees;

SELECT COUNT(commission_pct)
FROM   employees;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

SELECT COUNT(NVL(commission_pct,0))
FROM employees;

-- Utilizando a Função COUNT com DISTINCT
SELECT COUNT(DISTINCT department_id)
FROM   employees;

SELECT COUNT(department_id)
FROM   employees;

--Funções de Grupo e valores NULOS
--Ignora os valores nulos
SELECT AVG(commission_pct)
FROM   employees;

-- Tratamento de NULOS em Funções de Grupo 
-- Jeito certo para calcular media
SELECT AVG(NVL(commission_pct, 0))
FROM   employees;

SELECT round(AVG(NVL(salary, 0)),2)
FROM   employees;

--Desvio padrão
/*
O desvio padrão é uma medida que expressa o grau de dispersão de um conjunto de dados. 
Ou seja, o desvio padrão indica o quanto um conjunto de dados é uniforme. 
Quanto mais próximo de 0 for o desvio padrão, mais homogêneo são os dados
*/
SELECT STDDEV(commission_pct)
FROM   employees;

--Variance
/*
Dado um conjunto de dados, a variância é uma medida de dispersão que mostra o 
quão distante cada valor desse conjunto está do valor central (médio). 
Quanto menor é a variância, mais próximos os valores estão da média; 
mas quanto maior ela é, mais os valores estão distantes da média.
*/
SELECT VARIANCE (commission_pct)
FROM   employees;


-- Criado Grupos utilizando a Cláusula GROUP BY
--"Media salario por departamento"
SELECT department_id, ROUND(AVG(salary),2) 
FROM   employees
GROUP BY department_id 
ORDER BY department_id;


-- Utilizando a cláusula Group by com mais de uma Coluna ou ExpressÃ£o
SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id DESC;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas INCORRETAS utilizando Funções de Grupo
SELECT department_id, AVG(salary)
FROM   employees;

-- Corrigindo consultas INCORRETAS utilizando Funções de Grupo
SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas INCORRETAS utilizando Funções de Grupo
SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;

-- Corrigindo consultas incorretas utilizando Funções de Grupo

-- Restringindo Grupos utilizando a clausula HAVING

/*
WHERE Seleciona as linhas a serem recuperadas
GROUP BY  Formar os grupos
HAVING  Selecionar os grupos a serem RECUPERADOS
SELECT Exibir colunas ou expressÕes  
ORDER BY ordenando pelo critério definido
*/

SELECT department_id, MAX(salary)
FROM   employees
GROUP BY department_id;
HAVING MAX(salary)>=10000;

SELECT job_id, SUM(salary) TOTAL
FROM   employees
WHERE  job_id <> 'SA_REP'
GROUP BY job_id
HAVING   SUM(salary) > 15000
ORDER BY SUM(salary);

-- Aninhando Funções de Grupo
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id
ORDER BY AVG(SALARY) DESC;


SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id;



-- Exibindo dados a partir de multiplas TABELAS JOINS 

---- Prefixando Nomes de Coluna de Tabela 
SELECT employees.employee_id, employees.last_name, 
       employees.department_id, departments.department_name
FROM   employees JOIN departments 
       ON (employees.department_id = departments.department_id);

-- Utilizando Alias de Tabela
SELECT e.employee_id, e.last_name, e.department_id, d.department_name
FROM   employees e JOIN departments d
ON     (e.department_id = d.department_id); -- IMPORTANTE ON FAZ A LIGAÇÃO ENTRE AS TABELAS PELO id DE REFERENCIAS 

/*
-- Utilizando Natural Joins  POUCO USADA PELOS DESENVOLVEDORES
SELECT  department_id, department_name, location_id, city
FROM    departments
NATURAL JOIN locations;

-- JOIN com a Cláusula USING POUCO USADA PELOS DESENVOLVEDORES 
SELECT e.employee_id, e.last_name, d.location_id, department_id, d.department_name
FROM employees e
JOIN departments d USING (department_id);

-- Join com a Cláusula ON   MAIS USADA NA PRATICA
SELECT e.employee_id, e.last_name, e.department_id, d.location_id
FROM employees e JOIN departments d
ON (e.department_id = d.department_id);
*/

-- Joins utilizando várias tabelas com a Cláusula ON
SELECT e.employee_id, j.job_title, d.department_name, l.city, l.state_province, l.country_id
FROM employees e
  JOIN jobs        j ON (e.job_id = j.job_id)
  JOIN departments d ON (e.department_id = d.department_id)
  JOIN locations   l ON (d.location_id = l.location_id)
ORDER BY e.employee_id;
  
-- Incluindo condições adicionais a condição de Join na cláusula WHERE
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON  (e.department_id = d.department_id)
WHERE (e.salary BETWEEN 10000 AND 15000);

-- Incluindo condições adicionais a condição de Join utilizando AND  -- MENOS USADA E ELEGANTE
SELECT e.employee_id, e.last_name, e.salary, e.department_id, d.department_name
FROM employees e JOIN departments d
ON (e.department_id = d.department_id) AND
   (e.salary BETWEEN 10000 AND 15000);
   
-- Self Join Utilizando a Cláusula ON
SELECT empregado.employee_id "Id empregado", 
       empregado.last_name "Sobrenome empregado",
       gerente.employee_id "Id gerente", 
       gerente.last_name "Sobrenome gerente"
FROM employees empregado JOIN employees gerente
ON (empregado.manager_id = gerente.employee_id)
ORDER BY empregado.employee_id;