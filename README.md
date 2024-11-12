# InvControl

---

# Sistema de Controle de Estoque

Este projeto é um **Sistema de Controle de Estoque** desenvolvido para gerenciar de forma eficiente o estoque de produtos em empresas e pequenos negócios. O objetivo é fornecer uma ferramenta prática para que administradores e gerentes possam adicionar, editar, remover produtos, registrar entradas e saídas, além de gerar relatórios e controlar o status do estoque.

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
  - Quantidade disponível
  - Categoria (opcional)
  - Fornecedor (opcional)

### 2. Controle de Entradas e Saídas
Registra as movimentações de estoque, como entradas (compra de produtos) e saídas (vendas ou consumo). A cada movimentação, o sistema atualiza automaticamente a quantidade disponível no banco de dados.

- **Campos principais**:
  - Data da movimentação
  - Produto
  - Quantidade movimentada
  - Tipo de operação (entrada ou saída)

### 3. Controle de Estoque e Alertas
Exibe a quantidade atual de cada produto no estoque e envia alertas quando a quantidade de um produto ficar abaixo de um valor mínimo preestabelecido.

### 4. Relatórios de Inventário
Permite gerar relatórios sobre o status atual do estoque, movimentações de entradas e saídas, e produtos com baixo estoque.

- **Relatórios podem incluir**:
  - Quantidade disponível de cada produto
  - Histórico de entradas e saídas
  - Produtos com estoque baixo

### 5. Interface de Usuário (Front-end)
Uma interface simples e intuitiva, com funcionalidades para cadastro de produtos, registro de entradas e saídas, exibição de alertas de estoque baixo e visualização de relatórios.

## Estrutura do Banco de Dados (MySQL)

O banco de dados é composto por três tabelas principais:

### 1. Tabela `produtos`
Armazena informações sobre cada produto no estoque.

```sql
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    categoria VARCHAR(50),
    fornecedor VARCHAR(100)
);
```

### 2. Tabela `movimentacoes`
Armazena as entradas e saídas de produtos do estoque.

```sql
CREATE TABLE movimentacoes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    tipo VARCHAR(10) NOT NULL, -- 'entrada' ou 'saida'
    quantidade INT NOT NULL,
    data DATETIME NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
```

### 3. Tabela `relatorios` (opcional)
Armazena dados agregados para relatórios rápidos, como totais de vendas ou produtos com baixo estoque.

```sql
CREATE TABLE relatorios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT,
    total_entradas INT,
    total_saidas INT,
    estoque_final INT,
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);
```

## Estrutura do Sistema

### 1. Camada de Apresentação (Front-end)
- **HTML/CSS** para formular os layouts e estruturar as páginas de cadastro, movimentação e relatórios.
- **JavaScript** para validação de formulários e interação dinâmica com o back-end, como chamadas AJAX para adicionar ou atualizar produtos sem recarregar a página.

### 2. Camada de Lógica de Negócio (Back-end - Java)
- Utilização de **Servlets** ou **Spring Boot** para criar a lógica de backend.
- Implementação de controle de movimentações de estoque e a atualização automática das quantidades no banco de dados.

### 3. Camada de Banco de Dados (MySQL)
- **JDBC** ou **Spring Data JPA** para interagir com o banco de dados, realizando operações CRUD (Criar, Ler, Atualizar, Excluir) para produtos e movimentações.

## Fluxo de Operação

1. **Cadastro de Produtos**: O administrador pode cadastrar novos produtos, informando nome, descrição, preço e quantidade inicial.
2. **Entrada e Saída de Produtos**: O administrador pode registrar entradas e saídas de produtos, atualizando automaticamente o estoque.
3. **Alertas de Estoque Baixo**: O sistema verifica o estoque de cada produto e exibe alertas quando o estoque de um produto fica abaixo do valor mínimo.
4. **Relatórios**: O administrador pode gerar relatórios sobre o status do estoque, entradas e saídas de produtos.

## Possíveis Extensões para o Projeto

- **Sistema de login**: Implementação de usuários com permissões diferenciadas (admin, gerente, etc.).
- **Exportação de Relatórios**: Geração de relatórios em formatos como PDF ou Excel.
- **Dashboard**: Painel de controle para métricas do estoque, como quantidade total de produtos ou produtos mais vendidos.
- **Notificações por e-mail**: Envio de notificações automáticas quando o estoque de algum produto estiver baixo.

## Tecnologias Utilizadas

- **Back-end**: Java (Servlets ou Spring Boot)
- **Banco de Dados**: MySQL
- **Front-end**: HTML, CSS, JavaScript
- **Ferramentas**: IDEs como Eclipse, IntelliJ ou VS Code; MySQL Workbench ou phpMyAdmin

## Passos para Começar

1. **Planejamento**: Defina o escopo do projeto e a estrutura do banco de dados.
2. **Configuração do Banco de Dados**: Crie as tabelas no MySQL conforme descrito acima.
3. **Desenvolvimento do Back-end**: Implemente os endpoints para cadastro de produtos e movimentações de estoque.
4. **Desenvolvimento do Front-end**: Crie as interfaces de usuário utilizando HTML, CSS e JavaScript.
5. **Testes e Melhorias**: Teste o sistema e adicione melhorias, como alertas de estoque baixo, geração de relatórios e mais.

---


---
