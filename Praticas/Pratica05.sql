CREATE DATABASE PRATICA05;

USE PRATICA05;

DROP DATABASE PRATICA05;

CREATE TABLE cliente(
idcliente int primary key auto_increment,
nome VARCHAR(45),
telefone char(10),
celular char(9),
endereço varchar(45)
)auto_increment = 101;

CREATE TABLE pet(
idpet int primary key auto_increment,
tipo varchar(45),
nome varchar(45),
raça varchar(45),
nascimento date,
fkcliente int,
	constraint fkcliente foreign key (fkcliente) references cliente(idcliente)
);


INSERT INTO cliente VALUES
(null, 'mario', 35280906, 923256682, 'são paulo'),
(null, 'rogeriu', 27872981, 961699875, 'são paulo'),
(null, 'magali', 31413685, 997628645, 'Minas Gerais'),
(null, 'Juliana', 22788665, 996764166, 'São caetano'),
(null, 'Anna', '28444815', '943702273', 'Osasco');

SELECT * FROM cliente;

INSERT INTO pet VALUES
(null, 'cachorro', 'thor', 'golden','2023-10-10', 102), 
(null, 'gato', 'roni', 'mestiço', '2015-02-12', 105),
(null, 'cachorro', 'biju', 'buggy', '2018-03-01', 105),
(null, 'cachorro', 'luke', 'boxer', '2020-03-17', 101),
(null, 'gato', 'lola', 'ciames','2022-12-24', 103),
(null, 'cachorro', 'max', 'dalmata', '2021-10-18', 104);

SELECT * FROM pet;

SELECT * FROM pet WHERE tipo LIKE 'cachorro';

SELECT nome, nascimento FROM pet;

SELECT * FROM pet order by nome;

SELECT * FROM cliente order by endereço DESC;

SELECT * FROM pet WHERE nome LIKE 'r%';

SELECT * FROM cliente WHERE nome LIKE 'rogeriu';

UPDATE cliente SET telefone = 25278272 WHERE idcliente = 103;

SELECT * FROM cliente;

SELECT * FROM cliente
	JOIN pet ON idcliente = fkcliente;
    
SELECT * FROM pet
	JOIN cliente  ON idcliente = fkcliente  WHERE cliente.nome LIKE 'anna';
    
DELETE FROM pet WHERE idpet = 3;

SELECT * FROM pet;

DROP TABLE pet;
DROP TABLE cliente;

