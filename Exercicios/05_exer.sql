/*Crie uma consulta que mostre todos os professores que não moram em Palmas e que 
ministram alguma disciplina no curso de CST Sistemas para Internet.*/

--MINHA RESPOSTA
select 
    p.prof_nome,
    p.prof_cidade,
    d.curso_nome
from
    professor p,
    disciplina d,
    professor_disciplina pd
where prof_cidade not in ('Palmas')
and (p.prof_numero = pd.prof_numero)
and (d.disc_codigo = pd.disc_codigo)
and (d.curso_nome = 'CST Sistemas para Internet');