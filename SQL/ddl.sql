-- CREATE TABLE: Cria uma nova tabela no banco de dados.
CREATE TABLE minha_tabela (
  id NUMBER,
  nome VARCHAR2(50),
  sobrenome VARCHAR2(50)
  );

-- ALTER TABLE: Modifica a estrutura de uma tabela

--ADD coluna na tabela
ALTER TABLE minha_tabela 
ADD (
    nu VARCHAR2(50),
    sexo VARCHAR2(10),
    endereço VARCHAR(100)
);

--Remove coluna da tabela
ALTER TABLE minha_tabela 
DROP COLUMN idade;

--Modifica coluna da tabela
ALTER TABLE minha_tabela
MODIFY (nu NUMBER(3));

--Renomear uma COLUNA TABELA
ALTER TABLE minha_tabela1
RENAME COLUMN nu TO numero;

--Renomear uma TABELA
ALTER TABLE minha_tabela
RENAME TO minha_tabela1;

--Apaga todos os dados da tabela. OBS não pode ser revertido
TRUNCATE TABLE nome_da_tabela;

DESC minha_tabela1;















--DESC minha_tabela;