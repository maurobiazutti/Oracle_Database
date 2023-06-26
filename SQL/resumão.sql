--Exibe todas as colunas e dados da tabela employees
SELECT
       *
FROM
       EMPLOYEES;

--Exibe as colunas first_name concatenada com last_name com Alias "Nome Completo" da tabela employees
SELECT
       FIRST_NAME || ' ' || LAST_NAME "Nome Completo",
       JOB_ID                         "Cargo",
       COMMISSION_PCT                 "Comissão"
FROM
       EMPLOYEES;

/*Retornar apenas valores únicos de uma coluna ou conjunto de colunas. 
Ele remove as duplicatas dos resultados da consulta, 
exibindo apenas um registro para cada valor único encontrado*/
SELECT
       DISTINCT DEPARTMENT_ID
FROM
       EMPLOYEES;

--WHERE
--Vai trazer todos os department_id = 90
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       JOB_ID,
       DEPARTMENT_ID
FROM
       EMPLOYEES
WHERE
       DEPARTMENT_ID = 90;

--Vai buscar os salarios entre 8000 e 15000
SELECT
       FIRST_NAME,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY BETWEEN 8000
       AND 15000;

--Busca uma lista de valores utilizando o operador IN
SELECT
       FIRST_NAME,
       SALARY,
       JOB_ID
FROM
       EMPLOYEES
WHERE
       JOB_ID IN ('IT_PROG',
       'FI_ACCOUNT',
       'SA_REP');

--Busca com WHERE LIKE
SELECT
       FIRST_NAME,
       LAST_NAME
FROM
       EMPLOYEES
WHERE
       FIRST_NAME LIKE '%ha%' --Busca todas as palavras que tenha "ha"
       AND LAST_NAME LIKE '%ll%';

--"AND -> E" Todos q contenha "ll" no last_name

WHERE FIRST_NAME LIKE 'I%'; --Começa com "I"


WHERE FIRST_NAME LIKE 'ar%'; --Termina com "ar"


WHERE FIRST_NAME LIKE 'I%l'; --Começa com "I" e termina com "l"


--WHERE NULL
WHERE MANAGER_ID IS NULL; -- Para busca "NULL" na coluna


--WHERE AND EXIBE QUANDO AS DUAS CONDIÇÕES FOREM TRUE
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       JOB_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY >= 5000
       AND JOB_ID = 'IT_PROG';

--Busca pelos salarios MAIOR OU IGUAL A 5000 E que sejam IT_PROG

--WHERE OR Vai trazer todos que atenda pelo menos UM dos requisitos
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       JOB_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY >= 5000
       OR JOB_ID = 'IT_PROG';

--WHERE NOT
--Vai Trazer todos que não estão na lista.
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       SALARY,
       JOB_ID
FROM
       EMPLOYEES
WHERE
       JOB_ID NOT IN ('IT_PROG',
       'FI_ACCOUNT',
       'SA_REP');

--ORDER BY
--Ordem Crescente
SELECT
       LAST_NAME,
       HIRE_DATE
FROM
       EMPLOYEES
ORDER BY
       HIRE_DATE;

-- Ordem Descendente
SELECT
       LAST_NAME,
       HIRE_DATE
FROM
       EMPLOYEES
ORDER BY
       HIRE_DATE DESC;

--TBM pode ser referenciado por ALIAS
SELECT
       LAST_NAME,
       SALARY*12 SALARIO_ANUAL
FROM
       EMPLOYEES
ORDER BY
       SALARIO_ANUAL;

--Pode ser ordenado por duas colunas
SELECT
       LAST_NAME,
       DEPARTMENT_ID,
       SALARY
FROM
       EMPLOYEES
ORDER BY
       DEPARTMENT_ID,
       SALARY DESC;

--Variavel de Substituição
--Se for string ou data tem q esta entre ' '
SELECT
       LAST_NAME,
       DEPARTMENT_ID,
       SALARY,
       JOB_ID
FROM
       EMPLOYEES
WHERE
       JOB_ID = '&job_id';

-- Para Numero
SELECT
       LAST_NAME,
       DEPARTMENT_ID,
       SALARY,
       JOB_ID
FROM
       EMPLOYEES
WHERE
       DEPARTMENT_ID = &DEPARTMENT_ID;

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
SELECT
       LAST_NAME,
       DEPARTMENT_ID,
       SALARY,
       JOB_ID
FROM
       EMPLOYEES
WHERE
       UPPER (LAST_NAME) = 'KING';

--CONCAT
SELECT
       CONCAT(' Curso: ',
       'IntroduÃ§Ã£o ORACLE 19c'),
       SUBSTR('IntroduÃ§Ã£o ORACLE 19c',
       1,
       11),
       LENGTH('IntroduÃ§Ã£o ORACLE 19c'),
       INSTR('IntroduÃ§Ã£o ORACLE 19c',
       'ORACLE')
FROM
       DUAL;

--LPAD / RPAD
SELECT
       FIRST_NAME "Nome",
       LPAD(FIRST_NAME,
       20,
       ' ')       "Nome alinhado a direita",
       RPAD(FIRST_NAME,
       20,
       ' ')       "Nome alinhado a esquerda"
FROM
       EMPLOYEES;

--REPLACE
SELECT
       JOB_TITLE,
       REPLACE(JOB_TITLE,
       'President',
       'Presidente') CARGO
FROM
       JOBS
WHERE
       JOB_TITLE = 'President';

-- Funçoes tipo NUMBER
--ROUND(numero, precisão) +6 ARREDONDA PARA CIMA
SELECT
       ROUND(45.923,
       2),
       ROUND(45.923,
       0)
FROM
       DUAL;

--TRUNC (numero, precisão) CORTA SEM ARRENDONDAR
SELECT
       TRUNC(45.923,
       2),
       TRUNC(45.923,
       0)
FROM
       DUAL;

--RESTO
SELECT
       MOD(1300,
       600) RESTO
FROM
       DUAL;

--Numero Absoluto e RAIZ
SELECT
       ABS(-9),
       SQRT(9)
FROM
       DUAL;

-- Utilizando a Funções TO_CHAR com Datas
SELECT
       LAST_NAME,
       TO_CHAR(HIRE_DATE,
       'DD/MM/YYYY  HH24:MI:SS') DT_ADMISSÃ‚O
FROM
       EMPLOYEES;

SELECT
       SYSDATE,
       TO_CHAR(SYSDATE,
       'DD/MM/YYYY  HH24:MI:SS') DATA
FROM
       DUAL;

--Vai imprimir 03 de   junho    de     2023
SELECT
       LAST_NAME,
       TO_CHAR(HIRE_DATE,
       'DD, "de" Month "de" YYYY') DT_ADMISSÃ‚O
FROM
       EMPLOYEES;

--FMDD vai Eliminar os espaços e zeros que vem por padrão imprimir 3 de junho de 2023
SELECT
       LAST_NAME,
       TO_CHAR(HIRE_DATE,
       'FMDD, "de" Month "de" YYYY') DT_ADMISSÃ‚O
FROM
       EMPLOYEES;

-- Utilizando a Funções TO_CHAR com Numeros
--Pode Ser usado como Modelo Padrão para converção de dinheiro 'L99G999G999D99' "L moeda local" "G virgula" "D decimal ponto"
SELECT
       FIRST_NAME,
       LAST_NAME,
       TO_CHAR(SALARY,
       'L99G999G999D99') SALARIO
FROM
       EMPLOYEES;

-- Utilizando a Funções TO_DATE
SELECT
       TO_DATE('06/02/2020',
       'DD/MM/YYYY') DATA
FROM
       DUAL;

SELECT
       FIRST_NAME,
       LAST_NAME,
       HIRE_DATE
FROM
       EMPLOYEES
WHERE
       HIRE_DATE = TO_DATE('17/06/2003',
       'DD/MM/YYYY');

-- Utilizando Funções Aninhadas
-- Vai retorna o numero de meses entre a data atual e a data de entrada "hire_date"
SELECT
       FIRST_NAME,
       LAST_NAME,
       ROUND(MONTHS_BETWEEN(SYSDATE,
       HIRE_DATE),
       0) NUMERO_MESES
FROM
       EMPLOYEES
WHERE
       HIRE_DATE = TO_DATE('17/06/2003',
       'DD/MM/YYYY');

-- Utilizando a Funções COALESCE
SELECT
       COALESCE(NULL,
       NULL,
       'ExpresssÃ£o 3'),
       COALESCE(NULL,
       'ExpressÃ£o 2',
       'ExpresssÃ£o 3'),
       COALESCE('ExpressÃ£o 1',
       'ExpressÃ£o 2',
       'ExpresssÃ£o 3')
FROM
       DUAL;

SELECT
       LAST_NAME,
       EMPLOYEE_ID,
       COMMISSION_PCT,
       MANAGER_ID,
       COALESCE(TO_CHAR(COMMISSION_PCT),
       TO_CHAR(MANAGER_ID),
       'Sem percentual de comissÃ£o e sem gerente')
FROM
       EMPLOYEES;

-- Utilizando a Funções NVL
SELECT
       LAST_NAME,
       SALARY,
       NVL(COMMISSION_PCT,
       0),
       SALARY*12 SALARIO_ANUAL,
       (SALARY*12) + (SALARY*12*NVL(COMMISSION_PCT,
       0))       REMUNERACAO_ANUAL
FROM
       EMPLOYEES;

-- Utilizando a Função NVL2
SELECT
       LAST_NAME,
       SALARY,
       COMMISSION_PCT,
       NVL2(COMMISSION_PCT,
       10,
       0) PERCENTUAL_ATERADO
FROM
       EMPLOYEES;

-- Utilizando a Função NULLIF
SELECT
       NULLIF(1000,
       1000),
       NULLIF(1000,
       2000)
FROM
       DUAL;

SELECT
       FIRST_NAME,
       LAST_NAME,
       LENGTH(FIRST_NAME) "Expressão 1",
       LENGTH(LAST_NAME)  "Expressão 2",
       NULLIF(LENGTH(FIRST_NAME),
       LENGTH(LAST_NAME)) RESULTADO
FROM
       EMPLOYEES;

-- Expressão CASE
SELECT
       LAST_NAME,
       JOB_ID,
       SALARY,
       CASE JOB_ID
              WHEN 'IT_PROG' THEN
                     1.10*SALARY
              WHEN 'ST_CLERK' THEN
                     1.15*SALARY
              WHEN 'SA_REP' THEN
                     1.20*SALARY
              ELSE
                     SALARY
       END "NOVO SALARIO"
FROM
       EMPLOYEES;

-- Utilizando a Funções DECODE
SELECT
       LAST_NAME,
       JOB_ID,
       SALARY,
       DECODE(JOB_ID,
       'IT_PROG',
       1.10*SALARY,
       'ST_CLERK',
       1.15*SALARY,
       'SA_REP',
       1.20*SALARY,
       SALARY) "NOVO SALARIO"
FROM
       EMPLOYEES
 -- Utilizando as Funções AVG e SUM
       SELECT
              ROUND(AVG(SALARY),
              2),
              SUM(SALARY)
       FROM
              EMPLOYEES;

-- Utilizando as Funções MIN e MAX
SELECT
       MIN(HIRE_DATE),
       MAX(HIRE_DATE)
FROM
       EMPLOYEES;

SELECT
       MIN(SALARY),
       MAX(SALARY)
FROM
       EMPLOYEES;

-- Utilizando a Função COUNT
SELECT
       COUNT(*)
FROM
       EMPLOYEES;

SELECT
       COUNT(COMMISSION_PCT)
FROM
       EMPLOYEES;

SELECT
       COUNT(COMMISSION_PCT),
       COUNT(*)
FROM
       EMPLOYEES;

SELECT
       COUNT(NVL(COMMISSION_PCT,
       0))
FROM
       EMPLOYEES;

-- Utilizando a Função COUNT com DISTINCT
SELECT
       COUNT(DISTINCT DEPARTMENT_ID)
FROM
       EMPLOYEES;

SELECT
       COUNT(DEPARTMENT_ID)
FROM
       EMPLOYEES;

--Funções de Grupo e valores NULOS
--Ignora os valores nulos
SELECT
       AVG(COMMISSION_PCT)
FROM
       EMPLOYEES;

-- Tratamento de NULOS em Funções de Grupo
-- Jeito certo para calcular media
SELECT
       AVG(NVL(COMMISSION_PCT,
       0))
FROM
       EMPLOYEES;

SELECT
       ROUND(AVG(NVL(SALARY,
       0)),
       2)
FROM
       EMPLOYEES;

--Desvio padrão
/*
O desvio padrão é uma medida que expressa o grau de dispersão de um conjunto de dados. 
Ou seja, o desvio padrão indica o quanto um conjunto de dados é uniforme. 
Quanto mais próximo de 0 for o desvio padrão, mais homogêneo são os dados
*/
SELECT
       STDDEV(COMMISSION_PCT)
FROM
       EMPLOYEES;

--Variance
/*
Dado um conjunto de dados, a variância é uma medida de dispersão que mostra o 
quão distante cada valor desse conjunto está do valor central (médio). 
Quanto menor é a variância, mais próximos os valores estão da média; 
mas quanto maior ela é, mais os valores estão distantes da média.
*/
SELECT
       VARIANCE (COMMISSION_PCT)
FROM
       EMPLOYEES;

-- Criado Grupos utilizando a Cláusula GROUP BY
--"Media salario por departamento"
SELECT
       DEPARTMENT_ID,
       ROUND(AVG(SALARY),
       2)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID
ORDER BY
       DEPARTMENT_ID;

-- Utilizando a cláusula Group by com mais de uma Coluna ou ExpressÃ£o
SELECT
       DEPARTMENT_ID,
       JOB_ID,
       SUM(SALARY)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID,
       JOB_ID
ORDER BY
       DEPARTMENT_ID,
       JOB_ID DESC;

SELECT
       DEPARTMENT_ID,
       JOB_ID,
       SUM(SALARY)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID,
       JOB_ID
ORDER BY
       DEPARTMENT_ID,
       JOB_ID;

-- Consultas INCORRETAS utilizando Funções de Grupo
SELECT
       DEPARTMENT_ID,
       AVG(SALARY)
FROM
       EMPLOYEES;

-- Corrigindo consultas INCORRETAS utilizando Funções de Grupo
SELECT
       DEPARTMENT_ID,
       AVG(SALARY)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID;

-- Consultas INCORRETAS utilizando Funções de Grupo
SELECT
       DEPARTMENT_ID,
       MAX(SALARY)
FROM
       EMPLOYEES
WHERE
       MAX(SALARY) > 10000
GROUP BY
       DEPARTMENT_ID;

-- Corrigindo consultas incorretas utilizando Funções de Grupo

-- Restringindo Grupos utilizando a clausula HAVING

/*
WHERE Seleciona as linhas a serem recuperadas
GROUP BY  Formar os grupos
HAVING  Selecionar os grupos a serem RECUPERADOS
SELECT Exibir colunas ou expressÕes  
ORDER BY ordenando pelo critério definido
*/

SELECT
       DEPARTMENT_ID,
       MAX(SALARY)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID;

HAVING MAX(SALARY)>=10000;

SELECT
       JOB_ID,
       SUM(SALARY) TOTAL
FROM
       EMPLOYEES
WHERE
       JOB_ID <> 'SA_REP'
GROUP BY
       JOB_ID
HAVING
       SUM(SALARY) > 15000
ORDER BY
       SUM(SALARY);

-- Aninhando Funções de Grupo
SELECT
       MAX(AVG(SALARY))
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID;

SELECT
       DEPARTMENT_ID,
       ROUND(AVG(SALARY),
       2)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID
ORDER BY
       AVG(SALARY) DESC;

SELECT
       DEPARTMENT_ID,
       AVG(SALARY)
FROM
       EMPLOYEES
GROUP BY
       DEPARTMENT_ID;

-- ********* JOIN *********

-- Exibindo dados a partir de multiplas TABELAS JOINS

---- Prefixando Nomes de Coluna de Tabela
SELECT
       EMPLOYEES.EMPLOYEE_ID,
       EMPLOYEES.LAST_NAME,
       EMPLOYEES.DEPARTMENT_ID,
       DEPARTMENTS.DEPARTMENT_NAME
FROM
       EMPLOYEES
       JOIN DEPARTMENTS
       ON (EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID);

-- Utilizando Alias de Tabela
SELECT
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E
       JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- IMPORTANTE ON FAZ A LIGAÇÃO ENTRE AS TABELAS PELO id DE REFERENCIAS

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
SELECT
       E.EMPLOYEE_ID,
       J.JOB_TITLE,
       D.DEPARTMENT_NAME,
       L.CITY,
       L.STATE_PROVINCE,
       L.COUNTRY_ID
FROM
       EMPLOYEES   E
       JOIN JOBS J
       ON (E.JOB_ID = J.JOB_ID) JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
       JOIN LOCATIONS L
       ON (D.LOCATION_ID = L.LOCATION_ID)
ORDER BY
       E.EMPLOYEE_ID;

-- Incluindo condições adicionais a condição de Join na cláusula WHERE
SELECT
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.SALARY,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E
       JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
WHERE
       (E.SALARY BETWEEN 10000
       AND 15000);

-- Incluindo condições adicionais a condição de Join utilizando AND  -- MENOS USADA E ELEGANTE
SELECT
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.SALARY,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E
       JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
       AND (E.SALARY BETWEEN 10000
       AND 15000);

-- Self Join Utilizando a Cláusula ON
SELECT
       EMPREGADO.EMPLOYEE_ID "Id empregado",
       EMPREGADO.LAST_NAME   "Sobrenome empregado",
       GERENTE.EMPLOYEE_ID   "Id gerente",
       GERENTE.LAST_NAME     "Sobrenome gerente"
FROM
       EMPLOYEES EMPREGADO
       JOIN EMPLOYEES GERENTE
       ON (EMPREGADO.MANAGER_ID = GERENTE.EMPLOYEE_ID)
ORDER BY
       EMPREGADO.EMPLOYEE_ID;

-- Nonequijoins

-- Removendo a Tabela JOB_GRADES
DROP TABLE JOB_GRADES;

-- Criando a tabela JOB_GRADES
CREATE TABLE JOB_GRADES (
       GRADE_LEVEL VARCHAR2 (2) NOT NULL,
       LOWEST_SAL NUMBER (11, 2),
       HIGHEST_SAL NUMBER (11, 2),
       CONSTRAINT JOB_GRADES_PK PRIMARY KEY (GRADE_LEVEL)
);

-- Inserindo linhas na tabela JOB_GRADES
INSERT INTO JOB_GRADES VALUES (
       'A',
       1000,
       2999
);

INSERT INTO JOB_GRADES VALUES (
       'B',
       3000,
       5999
);

INSERT INTO JOB_GRADES VALUES (
       'C',
       6000,
       9999
);

INSERT INTO JOB_GRADES VALUES (
       'D',
       10000,
       14999
);

INSERT INTO JOB_GRADES VALUES (
       'E',
       15000,
       24999
);

INSERT INTO JOB_GRADES VALUES (
       'F',
       25000,
       40000
);

-- Efetivando a Transação
COMMIT;

SELECT
       *
FROM
       JOB_GRADES;

-- Nonequijoins
/*Realiza um JOIN quando a condição não é uma IGUALDADE*/

SELECT
       E.EMPLOYEE_ID,
       E.SALARY,
       J.GRADE_LEVEL,
       J.LOWEST_SAL,
       J.HIGHEST_SAL
FROM
       EMPLOYEES  E
       JOIN JOB_GRADES J
       ON NVL(E.SALARY, 0) BETWEEN J.LOWEST_SAL
       AND J.HIGHEST_SAL
ORDER BY
       E.SALARY;

SELECT
       E.EMPLOYEE_ID,
       E.SALARY,
       J.GRADE_LEVEL,
       J.LOWEST_SAL,
       J.HIGHEST_SAL
FROM
       EMPLOYEES  E
       JOIN JOB_GRADES J
       ON NVL(E.SALARY, 0) >= J.LOWEST_SAL
       AND NVL(E.SALARY, 0) <= J.HIGHEST_SAL
ORDER BY
       E.SALARY;

--JOIN
--TRAZ DADOS QUE CONTEM NAS DUAS TABELAS
SELECT
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E
       JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY
       D.DEPARTMENT_ID;

--LEFT OUTER JOIN
/*TRAZ OS DADOS QUE SATISFAÇA AS CONDIÇÕES DAS DUAS TABELAS E 
TRAZ TBM OS DADOS DA TABELA DA ESQUERDA, NULL 
OU QUE NÃO TENHA LIGAÇÃO COM A ATABELA DA DIREIRTA*/
SELECT
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E
       LEFT OUTER JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY
       D.DEPARTMENT_ID;

--RIGHT OUTER JOIN
/*TRAZ OS DADOS QUE SATISFAÇA AS CONDIÇÕES DAS
DUAS TABELAS E TRAZ OS DADOS DA TABELA DA DIREITA QUE NÃO 
TEM LIGAÇÃO OU É NULL*/
SELECT
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.FIRST_NAME,
       E.LAST_NAME
FROM
       EMPLOYEES   E
       RIGHT OUTER JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY
       D.DEPARTMENT_ID;

-- FULL OUTER JOIN
/*TRAZ OS DADOS QUE SATISFAÇA A LIGAÇÃO E TRAZ OS DADOS DAS 
DUAS TABELAS DA ESQUERDA E DA DIREITA*/
SELECT
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME,
       E.FIRST_NAME,
       E.LAST_NAME
FROM
       EMPLOYEES   E
       FULL OUTER JOIN DEPARTMENTS D
       ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY
       D.DEPARTMENT_ID;

-- CROSS JOIN
/* Faz ligação de todos os dados de 
uma tabela com outra.
Raramente usada*/
SELECT
       LAST_NAME,
       DEPARTMENT_NAME
FROM
       EMPLOYEES CROSS
       JOIN DEPARTMENTS;

-- *********** JOINS SINTAXE ORACLE *********** --
-- EquiJoin utilizando Sintaxe Oracle
SELECT
       E.EMPLOYEE_ID,
       E.LAST_NAME,
       E.DEPARTMENT_ID,
       D.DEPARTMENT_ID,
       D.LOCATION_ID
FROM
       EMPLOYEES   E,
       DEPARTMENTS D
WHERE
       (E.DEPARTMENT_ID = D.DEPARTMENT_ID)
ORDER BY
       E.DEPARTMENT_ID;

-- Joins entre várias tabelas utilizando Sintaxe Oracle
SELECT
       E.EMPLOYEE_ID,
       J.JOB_TITLE,
       D.DEPARTMENT_NAME,
       L.CITY,
       L.STATE_PROVINCE,
       L.COUNTRY_ID
FROM
       EMPLOYEES   E,
       JOBS        J,
       DEPARTMENTS D,
       LOCATIONS   L
WHERE
       (E.JOB_ID = J.JOB_ID)
       AND (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
       AND (D.LOCATION_ID = L.LOCATION_ID)
ORDER BY
       E.EMPLOYEE_ID;

-- Incluindo condições adicionais a condição de Join utilizando AND
SELECT
       E.EMPLOYEE_ID,
       E.SALARY,
       J.JOB_TITLE,
       D.DEPARTMENT_NAME,
       L.CITY,
       L.STATE_PROVINCE,
       L.COUNTRY_ID
FROM
       EMPLOYEES   E,
       JOBS        J,
       DEPARTMENTS D,
       LOCATIONS   L
WHERE
       (E.JOB_ID = J.JOB_ID)
       AND (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
       AND (D.LOCATION_ID = L.LOCATION_ID)
       AND (E.SALARY >= 1000)
ORDER BY
       E.EMPLOYEE_ID;

-- NonequiJoin Utilizando Sintaxe Oracle
SELECT
       E.EMPLOYEE_ID,
       E.SALARY,
       J.GRADE_LEVEL,
       J.LOWEST_SAL,
       J.HIGHEST_SAL
FROM
       EMPLOYEES  E,
       JOB_GRADES J
WHERE
       NVL(E.SALARY,
       0) BETWEEN J.LOWEST_SAL
       AND J.HIGHEST_SAL
ORDER BY
       E.SALARY;

-- Outer Join Utilizando Sintaxe Oracle
--LEFT OUTER JOIN
SELECT
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E,
       DEPARTMENTS D
WHERE
       E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
ORDER BY
       E.DEPARTMENT_ID;

-- RIGHT OUTER JOIN
SELECT
       E.FIRST_NAME,
       E.LAST_NAME,
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       EMPLOYEES   E,
       DEPARTMENTS D
WHERE
       E.DEPARTMENT_ID(+) = D.DEPARTMENT_ID
ORDER BY
       E.FIRST_NAME;

-- Self-join Utilizando Sintaxe Oracle
SELECT
       EMPREGADO.EMPLOYEE_ID "Id empregado",
       EMPREGADO.LAST_NAME   "Sobrenome empregado",
       GERENTE.EMPLOYEE_ID   "Id gerente",
       GERENTE.LAST_NAME     "Sobrenome gerente"
FROM
       EMPLOYEES EMPREGADO,
       EMPLOYEES GERENTE
WHERE
       (EMPREGADO.MANAGER_ID = GERENTE.EMPLOYEE_ID)
ORDER BY
       EMPREGADO.EMPLOYEE_ID;

DESC EMPLOYEES

-- Outer Join e Self Join Utilizando Sintaxe Oracle
SELECT
       EMPREGADO.EMPLOYEE_ID "Id empregado",
       EMPREGADO.LAST_NAME   "Sobrenome empregado",
       GERENTE.EMPLOYEE_ID   "Id gerente",
       GERENTE.LAST_NAME     "Sobrenome gerente"
FROM
       EMPLOYEES EMPREGADO,
       EMPLOYEES GERENTE
WHERE
       (EMPREGADO.MANAGER_ID = GERENTE.EMPLOYEE_ID(+))
ORDER BY
       EMPREGADO.EMPLOYEE_ID;

/* 
****** POUCO USADO ******
-- Produto Cartesiano ERRADO
SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM   employees e, jobs j;

-- Corrigindo Produto Cartesiano CORRETO
SELECT e.employee_id, e.first_name, e.last_name, j.job_id, j.job_title
FROM   employees e, jobs j
WHERE  e.job_id = j.job_id;
*/


--********** SUB-CONSULTAS **********--

--Sub-Consultas Single-Row

/*Quais empregados possuem o salario maior do
que o a média de salarios?*/
SELECT
       FIRST_NAME,
       LAST_NAME,
       JOB_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY > (
              SELECT
                     AVG(NVL(SALARY,
                     0))
              FROM
                     EMPLOYEES
       );

-- Utilizando Sub-consultas na Cláusula HAVING
-- Qual o id do departamento e o maior salario menor que a media?
SELECT
       E1.DEPARTMENT_ID,
       MAX(E1.SALARY)
FROM
       EMPLOYEES E1
GROUP BY
       E1.DEPARTMENT_ID
HAVING
       MAX(SALARY) < (
              SELECT
                     AVG(E2.SALARY)
              FROM
                     EMPLOYEES E2
       );

-- Erros utilizando Sub-consultas Single-Row
SELECT
       EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME
FROM
       EMPLOYEES
WHERE
       SALARY = (
              SELECT
                     AVG(NVL(SALARY,
                     0))
              FROM
                     EMPLOYEES
              GROUP BY
                     DEPARTMENT_ID
       );

-- O que ocorre quando a Sub-Consulta retorna nenhuma linha? NULL
SELECT
       EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME
FROM
       EMPLOYEES
WHERE
       LAST_NAME = (
              SELECT
                     LAST_NAME
              FROM
                     EMPLOYEES
              WHERE
                     LAST_NAME = 'Suzuki'
       );

-- Sub-Consultas Multiple-row

/*
IN -> Igual a qualquer membro da lista.

ANY -> Deve ser precedido por =, !=, >, <, <=, >=. 
Compara um valor para qualquer valor da lista retorda pela Sub_consulta. 
Retorna FALSE se a Sub consulta retorna nenhuma linha.

ALL -> Deve ser precedido por =, !=, >, <, <=, >=.
Compara um valor para todos os valores na lista retornada pela Sub-consulta.
Retorna TRUE se a Sub-consulta retorna nenhuma linha.
*/

--IN
SELECT
       EMPLOYEE_ID,
       FIRST_NAME,
       DEPARTMENT_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY IN (
              SELECT
                     TRUNC(AVG(NVL(SALARY,
                     0)),
                     2)
              FROM
                     EMPLOYEES
              GROUP BY
                     DEPARTMENT_ID
       );
       

-- Utilizando operador NOT IN em Sub-consultas Multiple-Row
SELECT
       EMPLOYEE_ID,
       FIRST_NAME,
       LAST_NAME,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY NOT IN (
              SELECT
                     AVG(NVL(SALARY,
                     0))
              FROM
                     EMPLOYEES
              GROUP BY
                     DEPARTMENT_ID
       );


-- Utilizando operador ANY em Sub-consultas Multiple-Row
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       JOB_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY < ANY (
              SELECT
                     SALARY
              FROM
                     EMPLOYEES
              WHERE
                     JOB_ID = 'IT_PROG'
       );


-- Utilizando operador ALL em Sub-consultas Multiple-Row
SELECT
       EMPLOYEE_ID,
       LAST_NAME,
       JOB_ID,
       SALARY
FROM
       EMPLOYEES
WHERE
       SALARY < ALL (
              SELECT
                     SALARY
              FROM
                     EMPLOYEES
              WHERE
                     JOB_ID = 'IT_PROG'
       );

-- Cuidados com Valores Nulos em uma Sub-consulta com Operador IN
SELECT
       EMP.EMPLOYEE_ID,
       EMP.LAST_NAME
FROM
       EMPLOYEES EMP
WHERE
       EMP.EMPLOYEE_ID IN (
              SELECT
                     MGR.MANAGER_ID
              FROM
                     EMPLOYEES MGR
       );

-- Cuidados com Valores Nulos em uma Sub-consulta com Operador NOT IN
SELECT
       EMP.EMPLOYEE_ID,
       EMP.LAST_NAME
FROM
       EMPLOYEES EMP
WHERE
       EMP.EMPLOYEE_ID NOT IN (
              SELECT
                     MGR.MANAGER_ID
              FROM
                     EMPLOYEES MGR
       );


-- Utilizando operador EXISTS
SELECT
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       DEPARTMENTS D
WHERE
       EXISTS (
              SELECT
                     E.DEPARTMENT_ID
              FROM
                     EMPLOYEES   E
              WHERE
                     D.DEPARTMENT_ID = E.DEPARTMENT_ID
       );


-- Utilizando operador EXISTS
SELECT
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       DEPARTMENTS D
WHERE
       EXISTS (
              SELECT
                     E.DEPARTMENT_ID
              FROM
                     EMPLOYEES   E
              WHERE
                     D.DEPARTMENT_ID = E.DEPARTMENT_ID
       );



-- Utilizando operador NOT EXISTS
SELECT
       D.DEPARTMENT_ID,
       D.DEPARTMENT_NAME
FROM
       DEPARTMENTS D
WHERE
       NOT EXISTS (
              SELECT
                     E.DEPARTMENT_ID
              FROM
                     EMPLOYEES   E
              WHERE
                     D.DEPARTMENT_ID = E.DEPARTMENT_ID
       );


-- Utilizando Sub-Consultas Correlacionadas
SELECT
       E1.EMPLOYEE_ID,
       E1.FIRST_NAME,
       E1.LAST_NAME,
       E1.DEPARTMENT_ID,
       E1.SALARY
FROM
       EMPLOYEES E1
WHERE
       E1.SALARY >= (
              SELECT
                     TRUNC(AVG(NVL(SALARY,
                     0)),
                     0)
              FROM
                     EMPLOYEES E2
              WHERE
                     E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
       );

SELECT
       TRUNC(AVG(NVL(SALARY,
       0)),
       0)
FROM
       EMPLOYEES E2
WHERE
       E2.DEPARTMENT_ID = 60;



-- Utilizando Sub-consultas Multiple-Column
SELECT
       E1.EMPLOYEE_ID,
       E1.FIRST_NAME,
       E1.JOB_ID,
       E1.SALARY
FROM
       EMPLOYEES E1
WHERE
       (E1.JOB_ID,
       E1.SALARY) IN (
              SELECT
                     E2.JOB_ID,
                     MAX(E2.SALARY)
              FROM
                     EMPLOYEES E2
              GROUP BY
                     E2.JOB_ID
       );


-- Comandos DML - Manipulando dados 

-- Utilizando o Comando INSERT
INSERT INTO departments(department_id,
department_name, manager_id, location_id)
VALUES (280, 'Project Management', 103, 1400);

-- Inserindo Linhas com valores NULOS Método Explícito
INSERT INTO departments
VALUES (290, 'Data Science', NULL, NULL);

-- Inserindo Linhas com valores NULOS Método Implícito
INSERT INTO departments(department_id,
department_name)
VALUES (300, 'Business Intelligence');
desc departments

-- Inserindo Linhas com valores NULOS Método Explícito
INSERT INTO departments
VALUES (301, 'Inovation', NULL, NULL);

-- Inserindo Linhas com valores NULOS Método Implícito
INSERT INTO departments(department_id,
department_name)
VALUES (302, 'IOT');

COMMIT;


-- Inserindo valores especiais retornados de Funções
INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (207, 'Rock', 'Balboa', 'DROCK', 
               '525.342.237', SYSDATE, 'IT_PROG', 7000,
               NULL, 103, 60);

-- Insert utilizando data e hora específicas
INSERT INTO employees 
           (employee_id, first_name, last_name, email, 
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
       VALUES (208, 'Vito', 'Corleone', 'VCORL', 
               '525.342.237', TO_DATE('11/02/2020', 'DD/MM/YYYY'), 'IT_PROG', 20000,
               NULL, 103, 60);
               
SELECT *
FROM   employees
ORDER BY employee_id DESC;

COMMIT;


-- Utilizando variáveis de Substituição
SELECT *
FROM departments
ORDER BY department_id DESC;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (&department_id, '&department_name',&location);

COMMIT;

-- Inserindo linhas a partir de uma Sub-consulta
DROP TABLE sales_reps;

CREATE TABLE sales_reps
(id NUMBER(6,0),
 name VARCHAR2(20),
 salary NUMBER(8,2),
 commission_pct NUMBER(2,2));

INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id = 'SA_REP';

COMMIT;

SELECT *
FROM sales_reps;

-- Utilizando o comando UPDATE
UPDATE employees
SET salary = salary * 1.2;

ROLLBACK;

UPDATE employees
SET salary = salary * 1.2
WHERE last_name = 'King';

COMMIT;

SELECT *
FROM employees
WHERE last_name = 'King';

-- Utilizando o comando UPDATE com Sub-consultas
UPDATE employees
SET job_id = (SELECT job_id
              FROM employees
              WHERE employee_id = 141),
    salary = (SELECT salary
              FROM employees
              WHERE employee_id = 141)
WHERE employee_id = 140;

COMMIT;
