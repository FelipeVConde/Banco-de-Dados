CREATE DATABASE Sprint2;

USE Sprint2;
DROP DATABASE Sprint2;

CREATE TABLE País(
idPais int primary key,
nome varchar(30),
capital varchar(40)
);

INSERT INTO País VALUES
	(1, 'Japão', 'Tokyo'),
    (2, 'USA', 'Washington'),
    (3, 'Brasil', 'Brasilia'),
    (4, 'Alemanha', 'Berlim');
    
CREATE TABLE Atleta(
idAtleta int primary key,
nome varchar (40),
modalidade varchar(40),
qtdMedalha int,
fkPais int,
constraint fkpais foreign key (fkpais)
	references País(idPais)
);

INSERT INTO Atleta VALUES
	(1, 'Midori', 'volei', 7, 1),
    (2, 'Guilherme', 'futebol', 4, 2),
    (3, 'Natally', 'volei', 5, 3),
    (4, 'Felipe', 'futebol', 3, 4),
    (5, 'Stela', 'natação', 5, 1);
    
SELECT * FROM Atleta
	JOIN País ON idPais = fkPais;

SELECT Atleta.nome, 
País.nome FROM País 
JOIN Atleta
ON idPais = fkPais
WHERE País.nome = 'Japão';

SELECT Atleta.*, 
País.nome FROM País 
JOIN Atleta
ON idPais = fkPais
WHERE País.capital = 'Tokyo';

CREATE TABLE musica(
idmusica int primary key,
titulo varchar(40),
artista varchar(40),
genero varchar(40),
fkalbum int,
constraint fkalbum foreign key (fkalbum)
	references album(idalbum)
);
DROP TABLE musica;

INSERT INTO musica VALUES
	(1, 'Change', 'Deftones', 'Rock', 1),
    (2, 'My Own Summer', 'Deftones', 'Rock', 1),
    (3, 'Look dont touch', 'Odetari', 'SigilKore', 2);
    
CREATE TABLE album(
idalbum int primary key,
nome varchar(40),
tipo varchar(10),
dtlançamento date
);

INSERT INTO album VALUES
	(1, 'white pony', 'digital', '2000-09-28'),
    (2, 'diamond eyes', 'digital', '2010-08-10');
    
SELECT * FROM musica;

SELECT * FROM album;

SELECT musica.*, 
album.* FROM album
JOIN musica
ON idalbum = fkalbum;

SELECT musica.titulo, 
album.nome FROM album
JOIN musica
ON idalbum = fkalbum;

SELECT musica.*, 
album.* FROM album
JOIN musica
ON idalbum = fkalbum
WHERE album.nome = 'white pony';
