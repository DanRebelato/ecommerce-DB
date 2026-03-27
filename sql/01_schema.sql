CREATE DATABASE ecommerce_db;
GO

USE ecommerce_db;
GO

SET NOCOUNT ON;

CREATE TABLE categorias (
    categoria_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    descricao NVARCHAR(MAX)
);

CREATE TABLE produtos (
    produto_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL DEFAULT 0,
    categoria_id INT NOT NULL,

    CONSTRAINT CK_produtos_preco CHECK (preco > 0),
    CONSTRAINT FK_produtos_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categorias (categoria_id)
);

CREATE TABLE clientes (
    cliente_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(150) NOT NULL,
    email NVARCHAR(150) NOT NULL,
    data_cadastro DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT UQ_clientes_email UNIQUE (email)
);

CREATE TABLE status_pedido (
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
    pedido_id INT IDENTITY(1,1) PRIMARY KEY,
    cliente_id INT NOT NULL,
    status_id INT NOT NULL,
    data_pedido DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_pedidos_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes (cliente_id),

    CONSTRAINT FK_pedidos_status
        FOREIGN KEY (status_id)
        REFERENCES status_pedido (status_id)
);

CREATE TABLE itens_pedido (
    item_id INT IDENTITY(1,1) PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,

    CONSTRAINT CK_itens_quantidade CHECK (quantidade > 0),

    CONSTRAINT FK_itens_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos (pedido_id)
        ON DELETE CASCADE,

    CONSTRAINT FK_itens_produto
        FOREIGN KEY (produto_id)
        REFERENCES produtos (produto_id)
);

CREATE TABLE historico_precos (
    historico_id INT IDENTITY(1,1) PRIMARY KEY,
    produto_id INT NOT NULL,
    preco_antigo DECIMAL(10,2),
    preco_novo DECIMAL(10,2),
    data_alteracao DATETIME2 DEFAULT SYSDATETIME(),

    CONSTRAINT FK_historico_precos_produto
        FOREIGN KEY (produto_id)
        REFERENCES produtos (produto_id)
);
