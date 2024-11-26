# InvControl

---

# Sistema de Controle de Estoque

Este projeto é um **Sistema de Controle de Estoque** desenvolvido para gerenciar de forma eficiente o estoque de produtos em empresas e pequenos negócios. O objetivo é fornecer uma ferramenta prática para que administradores e gerentes possam adicionar, editar, remover produtos, registrar entradas e saídas.

A aplicação foi construída utilizando as tecnologias:

- **Java** (para o back-end).
- **MySQL** (para o banco de dados).
- **HTML** e **CSS** (para o front-end).

## Funcionalidades

### 1. Cadastro de Produtos
Permite adicionar novos produtos ao estoque com informações detalhadas, como nome, descrição, preço, quantidade, categoria e fornecedor.

- **Campos principais**:
  - Nome do produto
  - Descrição
  - Preço
  - Quantidade 
  - Categoria 
  - Fornecedor 

### 2. Controle de Estoque
Exibe tabelas com os produtos cadastrados no estoque.

### 3. Interface de Usuário (Front-end)
Uma interface simples e intuitiva, com funcionalidades para cadastro, alteração, exclusão e consulta de produtos.

## Estrutura do Banco de Dados (MySQL)

O banco de dados é composto por duas tabelas principais:

### 1. Tabela `produtos`
Armazena informações sobre cada produto no estoque.

```sql
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    categoria VARCHAR(50),
    fornecedor VARCHAR(50)
);
```

### 2. Tabela `usuarios`
Armazena os usuarios.

```sql
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
```

