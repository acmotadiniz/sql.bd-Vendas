-- criar bd Exemplo_Select
CREATE DATABASE Vendas_BD;

-- abrir bd Exemplo_Select
use Vendas_BD;

CREATE TABLE Funcionario (
	cod_func int identity,
	nome_func varchar(50)
	PRIMARY KEY (cod_func)
)

CREATE TABLE Premio(
	cod_func int, 
	valor_premio float,
	FOREIGN KEY (Cod_func) 
	REFERENCES Funcionario(cod_func)
)

CREATE TABLE Dependente(
	cod_dep int identity,
	nome_dep varchar(50),
	data_nasc date,
	cod_func int,
	PRIMARY KEY (cod_dep),
	FOREIGN KEY (cod_func)
	REFERENCES Funcionario(cod_func)
)

CREATE TABLE EstadoCivil (
	cod_est_civ int identity,
	desc_est_civ varchar(100)
	PRIMARY KEY (cod_est_civ)
)
CREATE TABLE TipoFone(
	cod_fone int identity,
	desc_fone varchar(100)
	PRIMARY KEY (cod_fone)
)

CREATE TABLE Cliente
(
    cod_cliente int identity,
    Nome_cliente varchar(50),
    cod_est_civ int,
    salario float,
    PRIMARY KEY (cod_cliente),
	FOREIGN KEY (cod_est_civ)
	REFERENCES EstadoCivil (cod_est_civ)
);

CREATE TABLE Telefone(
	cod_cliente int, 
	cod_fone int, 
	numero_fone int,
	FOREIGN KEY (cod_cliente)
	REFERENCES Cliente(cod_cliente),
	FOREIGN KEY (cod_fone) REFERENCES 
	Tipofone(cod_fone)
)

CREATE TABLE Conjuge (
	cod_conjuge int identity,
	nome_conjuge varchar(50),
	cod_cliente int,
	PRIMARY KEY (cod_conjuge),
	FOREIGN KEY (cod_cliente) 
	REFERENCES Cliente(cod_cliente)
)

CREATE TABLE Produto(
	cod_produto int identity,
	nome_produto varchar(50),
	tipo_produto varchar (20)
	PRIMARY KEY (cod_produto)
)

CREATE TABLE Pedido (
	cod_pedido int identity, 
	cod_cliente int, 
	cod_func int,
	data_pedido date
	PRIMARY KEY (cod_pedido)
	FOREIGN KEY (cod_cliente) REFERENCES Cliente(cod_cliente),
	FOREIGN KEY (cod_func) REFERENCES Funcionario(cod_func)
)

CREATE TABLE ItemPedido(
	cod_pedido int,
	cod_produto int, 
	qtde_produto int,
	FOREIGN KEY (cod_pedido)
	REFERENCES Pedido(cod_pedido),
	FOREIGN KEY (cod_produto) 
	REFERENCES Produto(cod_produto)
)


 insert into "Funcionario" values ('João');
 insert into "Funcionario" values ('Mateus');
 insert into "Funcionario" values  ('Carla');

 INSERT INTO Premio (cod_func, valor_premio)
 VALUES (001, 900.25),
        (002, 600.75),
        (003, 500.75),
        (004, 1100.00),
        (005, 720.50);

INSERT INTO Dependente (nome_dep, data_nasc, cod_func)
VALUES ('Laura', '2005-03-15', 1),
       ('Lucas', '2010-08-22', 2),
       ('Mariana', '2008-11-10', 1),
       ('Rafael', '2013-05-02', 3),
       ('Isabela', '2009-02-18', 4);

 insert into "EstadoCivil" values('Solteiro(a)');
 Insert into "EstadoCivil" values('Casado(a)');
 Insert into "EstadoCivil" values('Separado(a)');
 Insert into "EstadoCivil" values('Viuvo(a)');

INSERT INTO TipoFone (desc_fone)
VALUES
    ('Celular'),
    ('Residencial'),
    ('Trabalho'),
    ('Fax'),
    ('Outro');

INSERT INTO Cliente (Nome_cliente, cod_est_civ, salario)
VALUES
    ('Rafaela Silva', 1, 5000.00),
    ('Gabriel Santos', 2, 6000.00),
    ('Lúcia Oliveira', 1, 4500.00),
    ('Mariana Pereira', 3, 7000.00),
    ('Fernando Almeida', 2, 5500.00);

INSERT INTO Telefone (cod_cliente, cod_fone, numero_fone)
VALUES
    (6, 4, 987123456),
    (7, 2, 555444333),
    (8, 1, 999888777),
    (9, 3, 111222333),
    (10, 2, 444555666);


INSERT INTO Conjuge (nome_conjuge, cod_cliente)
VALUES
    ('Rafael Oliveira', 6),
    ('Gabriela Fernandes', 7),
    ('Luis Silva', 8),
    ('Sofia Costa', 9),
    ('Mateus Alves', 10);

INSERT INTO Produto (nome_produto, tipo_produto)
VALUES
    ('Calça Jeans', 'Vestuário'),
    ('Smartphone', 'Eletrônico'),
    ('Laranja', 'Alimento'),
    ('Caneta', 'Utilidade'),
    ('Raquete de Tênis', 'Esporte');

INSERT INTO ItemPedido (cod_pedido, cod_produto, qtde_produto)
VALUES
    (4, 5, 3),
    (4, 2, 2),
    (5, 1, 1),
    (6, 3, 4),
    (6, 4, 2);
