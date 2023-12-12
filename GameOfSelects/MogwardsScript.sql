CREATE DATABASE Mogwards;
DROP DATABASE Mogwards;
USE Mogwards;

CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome VARCHAR(45),
materia VARCHAR(45),
idade int,
salario DECIMAL(7,2)
);

CREATE TABLE bruxo(
idBruxo int primary key auto_increment,
nome VARCHAR(45),
idade int
);

CREATE TABLE aula(
fkBruxo int,
fkProfessor int,
idAula int,
dtAula DATETIME,
	constraint pkAssociativa primary key(fkBruxo, fkProfessor, idAula),
	constraint fkBruxo foreign key (fkBruxo)
		REFERENCES bruxo(idBruxo),
	constraint fkProfessor foreign key (fkProfessor)
		REFERENCES professor(idProfessor)
);

CREATE TABLE casa(
idCasa int primary key,
nome VARCHAR(45),
trofeu int,
ponto int,
fkRepresentante int,
	constraint fkRepresentante foreign key (fkRepresentante)
		REFERENCES bruxo(idBruxo)
);

ALTER TABLE bruxo ADD COLUMN fkCasa int;
ALTER TABLE bruxo ADD constraint fkCasa foreign key (fkCasa)
	REFERENCES casa(idCasa);
    
describe professor;
INSERT INTO professor VALUES
	(null, 'Francisco Lachowski', 'Defesa Contra Artes das Trevas', 37, 8700.00),
    (null, 'Jordan Barrett', 'Transfiguração', 33, 11500.00),
    (null, 'Marlon Teixeira', 'Herbologia', 39, 6200.00),
    (null, "Sean O'Pry", 'Feitiços', 45, 15900.80);
    
describe casa;
INSERT INTO casa VALUES
	();
    
describe bruxo;
INSERT INTO bruxo VALUES
	();
    
describe aula;
INSERT INTO aula VALUES
	();