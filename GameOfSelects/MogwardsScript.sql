CREATE DATABASE Mogwards;

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
idAula int auto_increment,
dtAula DATETIME,
	primary key(fkBruxo, fkProfessor, idAula),
	constraint fkBruxo foreign key (fkBruxo)
		REFERENCES bruxo(idBruxo),
	constraint fkProfessor foreign key (fkProfessor)
		REFERENCES professor(idProfessor)
);

CREATE TABLE casa(

);

INSERT INTO bruxo VALUES