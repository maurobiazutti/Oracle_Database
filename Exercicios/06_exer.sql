/*Crie uma consulta que mostre o nome dos professores e a média de aulas que ministram.*/


-- Professores e suas diciplinas
SELECT * FROM professor;
SELECT * FROM professor_disciplina;
SELECT * FROM disciplina;
SELECT * FROM matricula;

select 
    p.prof_numero,
    p.prof_nome,
    d.disc_codigo,
    d.disc_nome,
    d.qtd_aulas
from
    professor p,
    disciplina d,
    professor_disciplina pd
where
    (p.prof_numero = pd.prof_numero)
    and (d.disc_codigo = pd.disc_codigo);