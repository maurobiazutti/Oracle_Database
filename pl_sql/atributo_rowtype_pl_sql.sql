-- Criado Grupos utilizando a ClÃ¡usula GROUP BY

SELECT department_id, AVG(salary)
FROM   employees
GROUP BY department_id 
ORDER BY department_id;

-- Utilizando a clÃ¡sula Group by com mais de uma Coluna ou ExpressÃ£o

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id, job_id;

-- Consultas incorretas utilizando FunÃ§Ãµes de Grupo

SELECT department_id, AVG(salary)
FROM   employees;

-- Corrigindo consultas incorretas utilizando FunÃ§Ãµes de Grupo

SELECT department_id,  AVG(salary)
FROM employees
GROUP BY department_id;

-- Consultas incorretas utilizando FunÃ§Ãµes de Grupo

SELECT department_id, MAX(salary)
FROM   employees
WHERE  MAX(salary) > 10000
GROUP BY department_id;

-- Corrigindo consultas incorretas utilizando FunÃ§Ãµes de Grupo

-- Restringindo Grupos utilizando a clÃ¡usula HAVING

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

-- Aninhando FunÃ§Ãµes de Grupo

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT AVG(salary)
FROM   employees
GROUP BY department_id;