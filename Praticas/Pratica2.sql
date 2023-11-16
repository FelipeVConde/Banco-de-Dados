CREATE DATABASE sprint1;

USE sprint1;

CREATE TABLE Atleta(
idAtleta int primary key,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

INSERT INTO Atleta VALUES
	(1, 'Midori', 'Volêi', 5),
    (2, 'Natally', 'Volêi', 3),
	(3, 'Guilherme', 'Futebol', 5),
    (4, 'Wonts', 'Futebol', 7),
    (5, 'Zoba', 'Futebol', 4);

-- Exibir todos os dados da tabela.
SELECT * FROM Atleta;
DESC Atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1;
UPDATE Atleta SET qtdMedalha = 8
	WHERE idAtleta = 1;
    
-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;
UPDATE Atleta SET qtdMedalha = 6
	WHERE idAtleta = 2 OR idAtleta = 3;
    
-- Atualizar o nome do atleta com o id=4;
UPDATE Atleta SET nome = 'Mat'
	WHERE idAtleta = 4;
    
-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
ALTER TABLE Atleta ADD COLUMN dtNasc date;

-- Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta SET dtNasc = '2004-05-26'
	WHERE idAtleta = 1;
UPDATE Atleta SET dtNasc = '2002-04-03'
	WHERE idAtleta = 2;
UPDATE Atleta SET dtNasc = '2004-12-04'
	WHERE idAtleta = 3;
UPDATE Atleta SET dtNasc = '2004-07-28'
	WHERE idAtleta = 4;
UPDATE Atleta SET dtNasc = '2004-10-09'
	WHERE idAtleta = 5;

-- Excluir o atleta com o id=5;
DELETE FROM Atleta WHERE idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação;
SELECT nome FROM Atleta
	WHERE modalidade <> 'natação';
    
-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;
SELECT * FROM Atleta
	WHERE qtdMedalha >= 3;
    
-- Modificar o campo modalidade do tamanho 40 para o tamanho 60;
ALTER TABLE Atleta MODIFY COLUMN modalidade varchar(60);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade;
DESC Atleta;

-- Limpar os dados da tabela;
TRUNCATE TABLE Atleta;

CREATE TABLE Musica(
idMusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40)
);

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

-- Adicionar o campo curtidas do tipo int na tabela;
ALTER TABLE Musica ADD COLUMN curtidas int;

-- Atualizar o campo curtidas de todas as músicas inseridas;
UPDATE Musica SET curtidas = '50'
	WHERE idMusica IN (1,2,3,4,5,6,7);
    
-- Modificar o campo artista do tamanho 40 para o tamanho 80;
ALTER TABLE Musica MODIFY COLUMN artista varchar(60);

-- Atualizar a quantidade de curtidas da música com id=1;
UPDATE Musica SET curtidas = '60000'
	WHERE idMusica = 1;
    
-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;
UPDATE Musica SET curtidas = '150000'
	WHERE idMusica = 2 OR idMusica = 3;
    
-- Atualizar o nome da música com o id=5;
UPDATE Musica SET titulo = 'THROAT GOAT'
	WHERE idMusica = 5;
    
-- Excluir a música com o id=4;
DELETE FROM Musica WHERE idMusica = 4;

-- Exibir as músicas onde o gênero é diferente de funk;
SELECT titulo FROM Musica
	WHERE genero <> 'funk';
    
-- Exibir os dados das músicas que tem curtidas maior ou igual a 20;
SELECT * FROM Musica
	WHERE curtidas >= 20;
    
-- Descrever os campos da tabela mostrando a atualização do campo artista;
DESC Musica;

-- Limpar os dados da tabela;
TRUNCATE TABLE Musica;

CREATE TABLE Filme(
idFilme int primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

INSERT INTO Filme VALUES
	(1, 'fight club', 'ação', 'David Fincher'),
    (2, 'The Social Network', 'ficção histórica', 'David Fincher'),
	(3, 'its a visiting day', 'drama', 'Bang Woo-ri'),
    (4, 'garota do seculo 20', 'drama', 'Bang Woo-ri'),
    (5, 'Oppenheimer', 'ficção histórica', 'Christopher Nolan'),
    (6, 'tenet', 'ação', 'Christopher Nolan'),
    (7, 'interstellar', 'ficção cientifica', 'Christopher Nolan');
    
-- Exibir todos os dados da tabela
SELECT * FROM Filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela;
ALTER TABLE Filme ADD COLUMN protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos;
UPDATE Filme SET protagonista = 'Tyler'
	WHERE idFilme = 1;
UPDATE Filme SET protagonista = 'Mark'
	WHERE idFilme = 2;
UPDATE Filme SET protagonista = 'Hye-sook'
	WHERE idFilme = 3;
UPDATE Filme SET protagonista = 'Na Bo-ra'
	WHERE idFilme = 4;
UPDATE Filme SET protagonista = 'Oppenheimer'
	WHERE idFilme = 5;
UPDATE Filme SET protagonista = 'The Protagonist'
	WHERE idFilme = 6;
UPDATE Filme SET protagonista = 'Cooper'
	WHERE idFilme = 7;
    
-- Modificar o campo diretor do tamanho 40 para o tamanho 150;
ALTER TABLE Filme MODIFY COLUMN diretor varchar(150);

-- Atualizar o diretor do filme com id=5;
UPDATE Filme SET diretor = 'Christopher'
	WHERE idFilme = 5;
    
-- Atualizar o diretor dos filmes com id=2 e com o id=7;
UPDATE Filme SET diretor = 'Fincher'
	WHERE idFilme = 2 OR idFilme = 7;

-- Atualizar o título do filme com o id=6;
UPDATE Filme SET titulo = 'Tenet'
	WHERE idFilme = 6;
    
-- Excluir o filme com o id=3;
DELETE FROM Filme WHERE idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama;
SELECT titulo FROM Filme 
	WHERE genero <> 'drama';
    
-- Exibir os dados dos filmes que o gênero é igual ‘suspense’;
SELECT * FROM Filme
	WHERE genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;
DESC Filme;

-- Limpar os dados da tabela;
TRUNCATE Filme;


-- CONSTRAINT
	-- RESTRIÇÃO/CONFIGURAÇÃO/REGRA
		-- PRIMARY KEY
        -- FOREIG KEY
        -- NOT NULL
        -- DEFAULT
        -- AUTO_INCREMENT
CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome varchar(50) NOT NULL,
cpf char(11) UNIQUE, -- CPF NÃO PODE SE REPETIR
email varchar(40) default 'Sem email',
dtAtual DATETIME default current_timestamp
);

DESCRIBE professor;

INSERT INTO professor (nome) VALUES
	('Marjorie'),
    ('Vanisse'),
    ('Vivian'),
    ('Kaline');
    
SELECT * FROM professor;

UPDATE professor SET email = 'marjorie@sptech.school'
	WHERE idProfessor = 1;
    
ALTER TABLE professor ADD COLUMN funcao varchar(40);

ALTER TABLE professor ADD constraint chkFuncao
	CHECK (funcao in ('Titular', 'Monitora'));
    
-- ALIASES - APELIDOS
SELECT funcao AS Função FROM professor;

SELECT concat('O email da professora ', nome, ' é ', email) AS frase FROM professor
	WHERE idProfessor = 1;


INSERT INTO Professor VALUES
	(null, 'Marjorie', 'Matemática', '1982-12-12'),
    (null, 'Gae-lee', 'Matemática', '1989-04-16'),
    (null, 'Fatima', 'Português', '1990-06-10'),
    (null, 'Marisa', 'Português', '1968-05-24'),
    (null, 'Vanisse', 'História', '1980-03-04'),
    (null, 'Monica', 'História', '1973-01-19');

-- Exibir todos os dados da tabela
SELECT * FROM Professor;

-- 

ALTER TABLE Professor ADD COLUMN funcao varchar(50),
	ADD constraint chkFuncao CHECK
		(funcao IN ('Monitor', 'Assistente', 'Titular'));

DROP TABLE Professor;