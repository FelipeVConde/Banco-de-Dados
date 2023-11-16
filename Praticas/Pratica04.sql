USE sprint1;

CREATE TABLE professor(
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
espcialidade1 varchar(40),
especialidade2 varchar(40)
);

INSERT INTO professor VALUES
(null, 'Marjorie', 'rorie', 'geometria', 'função'),
(null, 'Carol', 'Lima', 'estatistica', 'conjuntos'),
(null, 'Midori', 'Abel', 'verbos', 'oração'),
(null, 'Ester', 'Almeida', 'poema', 'romance'),
(null, 'Rodrigues', 'Comedia', 'dinamica', 'eletrica'),
(null, 'Fernando', 'Fefoso', 'magnetismo', 'termodinamica');

DROP TABLE professor;

CREATE TABLE diciplina(
idDisc int primary key auto_increment,
nomeDisc varchar(45)
);

INSERT INTO diciplina VALUES
(null, 'matematica'),
(null, 'português'),
(null, 'fisica');

DROP TABLE diciplina;

ALTER TABLE professor ADD COLUMN fkdiciplina int,
	add constraint fkDiciplinaProfessor foreign key (fkdiciplina) references diciplina(idDisc);

select * from diciplina;
select * from professor;

UPDATE professor SET fkdiciplina = 1 where idprofessor = 1;

UPDATE professor SET fkdiciplina = 2 where idprofessor = 3;

UPDATE professor SET fkdiciplina = 3 where idprofessor = 5;


SELECT * FROM professor
	JOIN diciplina ON idDisc = fkdiciplina;
    
SELECT disc.nomeDisc, prof.nome FROM professor AS prof
	JOIN diciplina AS disc ON fkdiciplina = idDisc;