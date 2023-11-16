CREATE DATABASE Apresentação;

USE Apresentação;

DROP DATABASE Apresentação;

CREATE TABLE Grupo(
idGrupo int primary key auto_increment,
nome VARCHAR(45),
DescProj VARCHAR(60)
);

CREATE TABLE Aluno(
idAluno int primary key,
RA CHAR(8),
nome VARCHAR(45),
email VARCHAR(45),
fkGrupo int,
	constraint fkGrupo foreign key(fkGrupo) references Grupo(idGrupo)
);

CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome VARCHAR(45),
diciplina VARCHAR(45)
)auto_increment = 10000;

CREATE TABLE Avaliação(
idAvaliação int,
fkProfessor int,
fkGrupo int,
primary key(idAvaliação, fkProfessor, fkGrupo),
dtAvaliação DATETIME,
nota DECIMAL(3,2),
constraint fkProfessor foreign key (fkProfessor)
	references Professor(idProfessor),
constraint fkGrupoAval foreign key (fkGrupo)
	references Grupo(idGrupo)
);

INSERT INTO Avaliação VALUES
	(1, 10000, 1, '2023-10-31 8:00:00', 8.5),
    (2, 10001, 1, '2023-10-31 8:00:00', 6.5),
    (3, 10002, 2, '2023-10-31 11:00:00', 9.5),
    (4, 10003, 2, '2023-10-31 11:00:00', 4.5);
    
INSERT INTO Grupo VALUES
	(null, "Abobrinhas", "Manejo de humidade em plantação de abobora"),
    (null, "Batatinhas", "Controle de temperatura do solo em plantação de batata");
    
INSERT INTO Aluno VALUES
	(1, '01231010', 'Felipe Conde', 'felipe@gmail.com', 2),
    (2, '01232020', 'Tsuya Takashi', 'tsuya@hotmail.com', 1),
    (3, '01233030', 'Midori Abel', 'midori@hotmail.com', 2),
    (4, '01234040', 'Mateus Wonts', 'mateus@gmail.com', 2),
    (5, '01235050', 'Anna Beatriz', 'anna@hotmail.com', 1),
    (6, '01236060', 'Vivian Tripodo', 'vivian@hotmail.com', 1);
    
INSERT INTO Professor VALUES
	(null, 'Marjorie', 'algoritmo'),
    (null, 'Caio', 'Matematica'),
    (null, 'Marcelo', 'Banco de dados'),
    (null, 'Nicolas', 'Pesquisa e inovação');
    
SELECT * FROM Grupo;

SELECT * FROM Aluno;

SELECT * FROM Professor;

SELECT * FROM Avaliação;

-- Exibir os dados dos grupos e os dados de seus respectivos alunos.
SELECT * FROM Grupo
	JOIN Aluno ON fkGrupo = idGrupo;
    
-- Exibir os dados de um determinado grupo e os dados de seus respectivos alunos.alter
SELECT * FROM Grupo 
	JOIN Aluno ON fkGrupo = idGrupo
    WHERE Grupo.nome = 'Batatinhas';
    
-- Exibir a média das notas atribuidas aos grupos, no geral.
SELECT SUM(nota)/COUNT(nota) as Média FROM Avaliação;
SELECT AVG(nota) as Média FROM Avaliação;

-- Exibir a nota mínima e nota máxima que foi atribuida aos grupos, no geral.
SELECT MAX(nota) as 'Maior nota', MIN(nota) as 'Menor nota' FROM Avaliação;

-- Exibir a soma das notas dadas aos grupos, no geral.
SELECT SUM(nota) as 'Soma das notas' FROM Avaliação;

-- Exibir os dados dos professores que avaliaram cada grupo, os dados dos grupos, a data e o horario da avaliação.
SELECT Avaliação.dtAvaliação, Professor.*, Grupo.* FROM Avaliação 
	JOIN Professor ON fkProfessor = idProfessor
    JOIN Grupo ON fkGrupo = idGrupo;
    
-- Exibir os dados dos professores que avaliaram um determinado grupo, os dados do grupo, a data e o horário da avaliação.
SELECT Avaliação.dtAvaliação, Professor.*, Grupo.* FROM Avaliação
	JOIN Professor ON fkProfessor = idProfessor
    JOIN Grupo ON fkGrupo = idGrupo
WHERE Grupo.nome = 'Abobrinhas';

-- Exibir os nomes dos grupos que foram avaliados por um determinado professor.
SELECT Grupo.nome as 'Grupo avaliado pelo Caio' FROM Grupo
	JOIN Avaliação ON fkGrupo = idGrupo
    JOIN Professor ON fkProfessor = idProfessor
WHERE Professor.nome = 'Caio';

-- Exibir os dados dos grupos, os dados dos alunos correspondentes, os dados dos professores que avaliaram, a dta e o horário da avaliação.
SELECT Grupo.*, Aluno.*, Professor.*, Avaliação.dtAvaliação FROM Avaliação
	JOIN Professor on fkProfessor = idProfessor
    JOIN Grupo on Avaliação.fkGrupo = idGrupo
    JOIN Aluno on Aluno.fkGrupo = idGrupo;
    
-- Exibir a quantidade de notas distintas.    
SELECT COUNT(distinct nota) as 'Notas distintas' FROM Avaliação;

-- Exibir a identificação do professor (pode ser o fk ou o nome), a média das notas e a soma das notas atribuidas, agrupadas por professor.
SELECT Professor.nome, AVG(nota) as 'Média da nota', SUM(nota) as 'Soma das notas' FROM Avaliação
	JOIN Professor ON fkProfessor = idProfessor
group by Professor.nome;

-- Exibir a identificação do grupo (pode ser fk ou o nome), a média das notas e a soma das notas atribuidas, agrupadas por grupo.
SELECT Grupo.nome, AVG(nota) as 'Média da nota', SUM(nota) as 'Soma das notas' FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo
group by Grupo.nome;

-- Exibir identificação do professor (pode ser o fk ou o nome), a menor nota e a maior nota atribuída, agrupada por professor.alter
SELECT Professor.nome, MIN(nota) as 'Menor nota', MAX(nota) as 'Maior nota' FROM Avaliação
	JOIN Professor ON fkProfessor = idProfessor
group by Professor.nome;

-- Exibir a identificação do grupo (pode ser fk ou nome), a menor nota e a maior nota atribuida, agrupada por grupo.
SELECT Grupo.nome, MIN(nota) as 'Menor nota', MAX(nota) as 'Maior nota' FROM Avaliação
	JOIN Grupo ON fkGrupo = idGrupo
group by Grupo.nome;