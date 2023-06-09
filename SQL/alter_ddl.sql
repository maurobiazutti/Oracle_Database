-- Comandos DDL 

-- Aula 2 - Alterando a Estrutura da Tabela


-- ALTER TABLE â€“ Adicionando uma coluna
ALTER TABLE projects
ADD (department_id NUMBER(3)); 

DESC projects

-- ALTER TABLE â€“ Removendo uma coluna
ALTER TABLE projects
DROP COLUMN department_id; 

DESC projects

-- ALTER TABLE â€“ Adicionando uma coluna
ALTER TABLE projects
ADD (department_id NUMBER(4) NOT NULL); 

DESC projects

-- ALTER TABLE â€“ Adicionando uma coluna
ALTER TABLE projects
MODIFY (project_code VARCHAR2(6));
                             
DESC PROJECTS
               
-- ALTER TABLE â€“ Renomeando uma coluna
ALTER TABLE projects
RENAME COLUMN project_name TO name;

DESC projects

-- ALTER TABLE â€“ READ ONLY
ALTER TABLE employees READ ONLY;

-- ALTER TABLE â€“ READ WRITE
ALTER TABLE employees READ WRITE;