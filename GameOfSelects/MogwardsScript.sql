CREATE DATABASE Mogwards;
DROP DATABASE Mogwards;
USE Mogwards;

CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome VARCHAR(45),
materia VARCHAR(45),
idade int,
salario DECIMAL(6,2)
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
	();
    
describe bruxo