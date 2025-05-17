CREATE DATABASE eliude_comidacaseira ;
USE eliude_comidacaseira;

CREATE TABLE clientes(
	id_clientes INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL, 
    endereco VARCHAR(150) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_pedidos INT,
	CONSTRAINT fkclientes_pedidos FOREIGN KEY (id_pedidos)
    REFERENCES pedidos(id_pedidos)
);

    
CREATE TABLE funcionarios(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    turno VARCHAR(20) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

CREATE TABLE fornecedores(
	id_fornecedores INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150)NOT NULL,
    produto VARCHAR(100) NOT NULL,
    CNPJ VARCHAR (11) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    
	id_produto INT, 
	CONSTRAINT fkfornecedores_pedidos FOREIGN KEY (id_produto)
    REFERENCES produtos(id_produto)
);

    
CREATE TABLE produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    preco DECIMAL (10,2) NOT NULL
);

CREATE TABLE estoque(
	id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    quantidade INT DEFAULT 0,
    movimentacao VARCHAR(100) NOT NULL,
    validade DATE,
    id_produto INT,
	CONSTRAINT fk_estoque_produtos FOREIGN KEY (id_produto)
	REFERENCES produtos(id_produto)
);

CREATE TABLE pedidos(
	id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    datahorario DATETIME,
    situacao VARCHAR(50) NOT NULL
);

