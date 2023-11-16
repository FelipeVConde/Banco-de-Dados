CREATE DATABASE Venda;

USE Venda;

CREATE TABLE Cliente(
idCliente int primary key,
nome VARCHAR(45),
email VARCHAR(45),
endereco VARCHAR(45),
ClienteIndicador int,
constraint fkClieIndic foreign key (ClienteIndicador)
	references Cliente (idCliente)
);

INSERT INTO Cliente VALUES
	(1, 'Midori Abel', 'midori@gmail.com', 'São Paulo', null),
    (2, 'Felipe Conde', 'conde@hotmail.com', 'São Paulo', 1),
    (3, 'Anna Beatriz', 'annab@hotmail.com', 'São Caetano', 2),
	(4, 'Vivian Tripodo', 'vivian@gmail.com', 'São Paulo', 2);
    
CREATE TABLE Venda(
idVenda int primary key,
total DECIMAL(10,2),
dtVenda DATETIME,
fkCliente int,
constraint fkVendClien foreign key (fkCliente)
	references Cliente(idCliente)
);

INSERT INTO Venda VALUES
	(1, 1980.90, '2023-10-31 20:20:20', 3),
    (2, 110739.06, '2023-09-30 20:16:00', 3),
    (3, 110739.06, '2023-09-30 18:50:00', 2),
    (4, 100.90, '2023-10-27 18:30:00', 4),
    (5, 50.00, '2023-10-14 15:20:00', 1),
    (6, 22.22, '2023-10-22 22:22:22', 2);
    
CREATE TABLE Produto(
idProduto int primary key,
nome VARCHAR(45),
descricao VARCHAR(45),
preco DECIMAL(10,2)
);

INSERT INTO Produto VALUES
	(1, 'chaveiro', 'chaveiros de personagens de genshin impact', 25.90),
    (2, 'card', 'cards de personagens de genshin impact', 5.00);

CREATE TABLE Quantidade(
idQuantidade int,
fkProduto int,
fkVenda int,
primary key(idQuantidade, fkProduto, fkVenda),
quantidade int,
constraint fkProdQuant foreign key (fkProduto)
	references Produto(idProduto),
constraint fkVendQuant foreign key (fkVenda)
	references Venda(idVenda)
);

INSERT INTO Quantidade VALUES
	(1, 1, 2, 50),
    (2, 1, 3, 50),
    (3, 2, 1, 33),
    (4, 2, 4, 21),
    (5, 2, 6, 4),
    (6, 1, 5, 2);
    
SELECT * FROM Cliente;

SELECT * FROM Venda;

SELECT * FROM Produto;

SELECT * FROM Quantidade;

--  Exibir os dados dos clientes e os dados de suas respectivas vendas.
SELECT * FROM Cliente JOIN Venda
	ON idCliente = fkCliente;
    
-- Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)e os dados de suas respectivas vendas.
SELECT * FROM Cliente JOIN Venda
	ON idCliente = fkCliente
    WHERE Cliente.nome LIKE 'Anna Beatriz';
    
-- Exibir os dados dos clientes e de suas respectivas indicações de clientes.
SELECT * FROM Cliente as Indicador JOIN Cliente as Indicado
	on Indicador.idCliente = Indicado.ClienteIndicador;
    
-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes indicadores, porém somente de um determinado cliente indicador (informar o nome do cliente que indicou na consulta).
SELECT * FROM Cliente as Indicador JOIN Cliente as Indicado
	on Indicador.idCliente = Indicado.ClienteIndicador
	WHERE Indicador.nome LIKE 'Felipe Conde';
    
-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
SELECT * FROM Cliente
JOIN Venda
	ON idCliente = fkCliente
JOIN Quantidade
	ON idVenda = fkVenda
JOIN Produto
	ON idProduto = fkProduto;
    
-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
SELECT Venda.dtVenda, Produto.nome, Quantidade.quantidade 
FROM Venda
JOIN Quantidade
	ON idVenda = fkVenda
JOIN Produto
	ON idProduto = fkProduto;
    
-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto.
SELECT Produto.nome, Produto.preco, 
	SUM(quantidade) as quantidade
FROM Produto
JOIN Quantidade
	ON idProduto = fkProduto
group by Produto.nome, Produto.preco;

-- Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
INSERT INTO Cliente VALUES
	(5, 'Mateus Wonts', 'mateus@hotmail.com', 'São Paulo', 1);

INSERT INTO Venda VALUES
	(7, null, '2023-11-02 17:30:00', 5);
    
SELECT * FROM Cliente
	JOIN Venda ON fkCliente = idCliente;
    
-- Exibir o valor mínimo e o valor máximo dos preços dos produtos;
SELECT MAX(preco) FROM Produto;

SELECT MIN(preco) FROM Produto;

-- Exibir a soma e a média dos preços dos produtos;
SELECT SUM(preco) FROM Produto;

SELECT SUM(preco)/COUNT(preco) FROM Produto;
SELECT AVG(preco) FROM Produto;

-- Exibir a quantidade de preços acima da média entre todos os produtos
SELECT COUNT(preco) FROM Produto where preco > 15.45;

-- Exibir a soma dos preços distintos dos produtos;
SELECT SUM(preco) FROM Produto;

--  Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
SELECT SUM(preco) FROM Produto
	JOIN Venda
    JOIN Quantidade ON fkVenda = idVenda;