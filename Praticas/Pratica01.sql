CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

DESCRIBE atleta;

INSERT INTO atleta VALUES
	(1, 'Midori', 'volei', 7),
    (2, 'Guilher', 'futebol', 4),
    (3, 'Natally', 'volei', 5),
    (4, 'Felipe', 'futebol', 3),
    (5, 'Stela', 'natação', 5),
    (6, 'Thiago', 'xadrez', 11);

-- Exibir todos os dados da tabela    
SELECT * FROM atleta;

-- Exibir apenas os nomes e quantidade de medalhas dos atletas
SELECT nome, qtdMedalha FROM atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade
SELECT * FROM atleta WHERE modalidade LIKE 'volei';

-- Exibir os dados da tabela ordenados pela modalidade
SELECT * FROM atleta ORDER BY modalidade;

-- Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente
SELECT * FROM atleta ORDER BY qtdMedalha DESC;

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM atleta WHERE nome LIKE '%S%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra
SELECT * FROM atleta WHERE nome LIKE 'M%';

-- Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT * FROM atleta WHERE nome LIKE '%O';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM atleta WHERE nome LIKE '%R_';

DROP TABLE atleta;

CREATE TABLE Musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

DESCRIBE atleta;

INSERT INTO Musica VALUES
	(1, 'Change', 'Deftones', 'Rock'),
    (2, 'My Own Summer', 'Deftones', 'Rock'),
    (3, 'Look dont touch', 'Odetari', 'SigilKore'),
    (4, 'Narcissistic Personality', 'Odetari', 'SigilKore'),
    (5, 'Good Loyal Thots', 'Odetari', 'SigilKore'),
    (6, '2 baddies', 'NCT 127', 'Kpop'),
    (7, 'Kick It', 'NCT 127', 'Kpop');

-- Exibir todos os dados da tabela.
SELECT * FROM Musica;

-- Exibir apenas os títulos e os artistas das músicas
SELECT titulo, artista FROM Musica;

-- Exibir apenas os dados das músicas de um determinado gênero.
SELECT * FROM Musica WHERE genero LIKE 'SigilKore';

-- Exibir apenas os dados das músicas de um determinado artista.
SELECT * FROM Musica WHERE artista LIKE 'NCT 127';

-- Exibir os dados da tabela ordenados pelo título da música.
SELECT * FROM Musica ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo artista em ordem decrescente
Select * FROM Musica ORDER BY artista DESC;

-- Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra
SELECT * FROM Musica WHERE titulo LIKE 'G%';

-- Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra
SELECT * FROM Musica WHERE artista LIKE '%S';

-- Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
SELECT * FROM Musica WHERE genero LIKE '_P%';

-- Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Musica WHERE titulo LIKE '%E_';

-- Elimine a tabela.
DROP TABLE Musica;

CREATE TABLE Filme(
idFilme int primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

DESCRIBE Filme;

INSERT INTO Filme VALUES
	(1, 'fight club', 'ação', 'David Fincher'),
    (2, 'The Social Network', 'ficção histórica', 'David Fincher'),
	(3, 'its a visiting day', 'drama', 'Bang Woo-ri'),
    (4, 'garota do seculo 20', 'drama', 'Bang Woo-ri'),
    (5, 'Oppenheimer', 'ficção histórica', 'Christopher Nolan'),
    (6, 'tenet', 'ação', 'Christopher Nolan'),
    (7, 'interstellar', 'ficção cientifica', 'Christopher Nolan');
    
UPDATE Filme SET diretor = 'Christopher Nolan'
	WHERE idFilme = 7;
    
-- Exibir todos os dados da tabela
SELECT * FROM Filme;

-- Exibir apenas os títulos e os diretores dos filmes.
SELECT titulo, diretor FROM Filme;

-- Exibir apenas os dados dos filmes de um determinado gênero
SELECT * FROM Filme WHERE genero LIKE 'ação';

-- Exibir apenas os dados dos filmes de um determinado diretor
SELECT * FROM Filme WHERE diretor LIKE 'Christopher Nolan';

-- Exibir os dados da tabela ordenados pelo título do filme
SELECT * FROM Filme ORDER BY titulo;

-- Exibir os dados da tabela ordenados pelo diretor em ordem decrescente
SELECT * FROM Filme ORDER BY diretor DESC;

-- Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE 'I%';

-- Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra
SELECT * FROM Filme WHERE diretor LIKE '%N';

-- Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma determinada letra
SELECT * FROM Filme WHERE genero LIKE '_R%';

-- Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma determinada letra.
SELECT * FROM Filme WHERE titulo LIKE '%A_';

-- Elimine a tabela.
DROP TABLE Filme;

CREATE TABLE Professor(
idProfessor int primary key,
nome varchar(50),
especialidade varchar(40),
dtNasc varchar(10)	
);

DESCRIBE Professor;

INSERT INTO Professor VALUES
	(1, 'Marjorie', 'Matemática', '1982-12-12'),
    (2, 'Gae-lee', 'Matemática', '1989-04-16'),
    (3, 'Fatima', 'Português', '1990-06-10'),
    (4, 'Marisa', 'Português', '1968-05-24'),
    (5, 'Vanisse', 'História', '1980-03-04'),
    (6, 'Monica', 'História', '1973-01-19');
    
-- Exibir todos os dados da tabela
SELECT * FROM Professor;

-- Exibir apenas as especialidades dos professores
SELECT especialidade FROM Professor;

-- Exibir apenas os dados dos professores de uma determinada especialidade
SELECT * FROM Professor WHERE especialidade LIKE 'Matemática';

-- Exibir os dados da tabela ordenados pelo nome do professor.
SELECT * FROM Professor ORDER BY nome;

-- Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem decrescente
SELECT * FROM Professor ORDER BY dtNasc;

-- Exibir os dados da tabela, dos professores cujo nome comece com uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE 'M%';

-- Exibir os dados da tabela, dos professores cujo nome termine com uma determinada letra
SELECT * FROM Professor WHERE nome LIKE '%e';

-- Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '_o%';

-- Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Professor WHERE nome LIKE '%s_';

-- Elimine a tabela
DROP TABLE Professor;

CREATE TABLE Curso(
idCurso int primary key,
nome varchar(50),
sigla varchar(3),
coordenador varchar(50)
);

DESCRIBE Curso;

INSERT INTO Curso VALUES
	(1, 'Informatica', 'Inf', 'Rafael'),
    (2, 'Inglês', 'Ing', 'Felipe'),
    (3, 'Matemática', 'Mat', 'Valdinete'),
    (4, 'Japonês', 'Jap', 'Akemi');
    
-- Exibir todos os dados da tabela.
SELECT * FROM Curso;

-- Exibir apenas os coordenadores dos cursos.
SELECT coordenador FROM Curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
SELECT * FROM Curso WHERE sigla LIKE 'inf';

-- Exibir os dados da tabela ordenados pelo nome do curso
SELECT * FROM Curso ORDER BY nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
SELECT * FROM Curso ORDER BY coordenador DESC;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra
SELECT * FROM Curso WHERE nome LIKE 'I%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%a';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '_n%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra.
SELECT * FROM Curso WHERE nome LIKE '%ê_';

-- Elimine a tabela
DROP TABLE Curso;

CREATE TABLE Revista(
idRevista int auto_increment primary key,
nome varchar(40),
categoria varchar(30)
);

INSERT INTO Revista (nome) VALUES
	('Veja'),
    ('Epoca'),
    ('Isto é'),
    ('Folha');

-- Exibir todos os dados da tabela.
SELECT * FROM Revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente
UPDATE Revista SET categoria = 'moda'
	WHERE idRevista = 3;
UPDATE Revista SET categoria = 'diario'
	WHERE idRevista = 4;
UPDATE Revista SET categoria = 'fofoca'
	WHERE idRevista = 2;
    
SELECT * FROM Revista;

-- Insira mais 3 registros completos.
INSERT INTO Revista (nome, categoria) VALUES
	('Quatro Rodas', 'automobilismo'),
    ('Claudia', 'gastronomia'),
    ('Exame', 'noticia');
    
-- Exibir novamente os dados da tabela
SELECT * FROM Revista;

-- Exibir a descrição da estrutura da tabela.
DESCRIBE Revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
ALTER TABLE Revista MODIFY COLUMN categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
DESCRIBE Revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
ALTER TABLE Revista ADD COLUMN periodicidade varchar(15);

-- Exibir os dados da tabela.
SELECT * FROM Revista;

-- Excluir a coluna periodicidade da tabela.
ALTER TABLE Revista DROP COLUMN periodicidade;


-- EXCLUIR O BANCO DE DADOS SPRINT1
DROP DATABASE sprint1;