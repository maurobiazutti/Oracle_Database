/*Crie uma consulta que mostre todos os alunos de Palmas que cursam alguma 
disciplina de Programação de Banco de dados no ano de 2018.*/

--Minha Solução
select
    a.aluno_nome,
    a.aluno_cidade,
    d.disc_nome,
    m.ano
from
    aluno a,
    disciplina d,
    matricula m
where
     (a.aluno_numero = m.aluno_numero)
     and (d.disc_codigo = m.disc_codigo)
     and (a.aluno_cidade = 'Palmas') 
     and (d.disc_nome = 'Banco de dados')
     and (m.ano = '2018');
     
--Exercicio não tem solução proposta