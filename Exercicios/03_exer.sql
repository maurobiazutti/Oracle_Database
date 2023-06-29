/*Crie uma consulta com todos os nomes de alunos matriculados no ano 
de 2018, os nomes das disciplinas em que estão matriculados, 
a cidade onde moram e os nomes dos cursos das disciplinas.*/

--Minha Resposta
select
    a.aluno_nome,
    a.aluno_cidade,
    d.disc_nome,
    d.curso_nome,
    m.ano
from
    aluno a,
    matricula m,
    disciplina d
where
    (a.aluno_numero = m.aluno_numero)
    and (d.disc_codigo = m.disc_codigo)
    and (m.ano = '2018');
    
--Execicio não apresentou resposta