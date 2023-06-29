/*Crie uma consulta que mostre todos os nomes dos professores do curso de 
CST Sistemas para Internet, no ano de 2018, e os nomes das 
disciplinas pelas quais são responsáveis.*/

-- Minha Resposta 
select
    p.prof_nome,
    d.curso_nome,
    d.disc_nome,
    pd.ano
from
    professor p,
    disciplina d,
    professor_disciplina pd
    where
    (p.prof_numero = pd.prof_numero)
    and (d.disc_codigo = pd.disc_codigo)
    and (d.curso_nome = 'CST Sistemas para Internet')
    and (pd.ano = '2018');
    

--Resposta proposta pelo exercicio   
SELECT 
    p.prof_nome, 
    d.disc_nome, 
    d.curso_nome
FROM 
    professor p, 
    matricula m, 
    disciplina d, 
    professor_disciplina pd
WHERE 
    p.prof_numero = pd.prof_numero 
    AND d.disc_codigo = pd.disc_codigo
    AND d.disc_codigo = m.disc_codigo
    AND d.curso_nome = 'CST Sistemas para Internet'
    AND m.ano = '2018';