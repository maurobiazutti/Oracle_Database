/*Crie uma consulta que mostre todos os nomes dos professores do curso de 
CST Sistemas para Internet, no ano de 2018, e os nomes das 
disciplinas pelas quais são responsáveis.*/

--nomes dos professores do curso de CST Sistemas para Internet, no ano de 2018
--nomes das disciplinas pelas quais são responsáveis
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
    AND m.ano = 2018;