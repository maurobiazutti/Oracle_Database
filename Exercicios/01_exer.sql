/*Crie uma consulta com todas as disciplinas oferecidas no ano de 2018, 
constando os nomes das disciplinas, nomes e cidades dos professores 
responsáveis e nomes dos cursos das disciplinas.
--TODAS DISCIPLINAS OFERECIDAS EM 2018
--NOMES DISCIPLINAS
--NOMES E CIDADES DOS PROFESSORES
--NOMES DOS CURSOS DAS DISCIPLINAS*/

--MINHA RESPOSTA
SELECT distinct
    d.disc_nome,
    p.prof_nome,
    p.prof_cidade,
    d.curso_nome,
    m.ano
from 
    disciplina d,
    matricula m,
    professor p
where 
    d.disc_codigo = m.disc_codigo
    and d.disc_codigo = p.prof_numero
    and m.ano = 2018;
    
    
--Resposta dada pelo exercicio
SELECT  
    disciplina.disc_nome, 
    professor.prof_nome, 
    professor.prof_cidade, 
    disciplina.curso_nome, 
    matricula.ano
FROM 
    disciplina, 
    professor, 
    matricula, 
    aluno, 
    professor_disciplina
WHERE 
    disciplina.disc_codigo = matricula.disc_codigo 
    AND aluno.aluno_numero = matricula.aluno_numero
    AND professor.prof_numero = professor_disciplina.prof_numero 
    AND disciplina.disc_codigo = professor_disciplina.disc_codigo 
    AND professor_disciplina.ano =  matricula.ano 
    AND matricula.ano = '2018';