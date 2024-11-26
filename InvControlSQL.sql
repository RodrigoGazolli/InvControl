create database invcontrol;
use invcontrol;

CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    categoria VARCHAR(50),
    fornecedor VARCHAR(50)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL unique,
	senha VARCHAR(50) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    rg VARCHAR(9) NOT NULL unique,
    cpf VARCHAR(11) NOT NULL unique,
    estado VARCHAR(2) not null,
    aceite boolean not null
);

