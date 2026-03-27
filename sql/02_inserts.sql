INSERT INTO categorias (nome, descricao)
VALUES
    ('Eletrônicos', NULL),
    ('Acessórios', NULL);

INSERT INTO produtos (nome, preco, estoque, categoria_id)
VALUES
    ('Mouse Gamer', 150.00, 50, 2),
    ('Teclado Mecânico', 300.00, 30, 2),
    ('Notebook', 3500.00, 10, 1);

INSERT INTO clientes (nome, email)
VALUES
    ('João Silva', 'joao@email.com'),
    ('Maria Souza', 'maria@email.com');

INSERT INTO status_pedido (nome)
VALUES
    ('Pendente'),
    ('Pago'),
    ('Enviado'),
    ('Entregue');

INSERT INTO pedidos (cliente_id, status_id)
VALUES
    (1, 1),
    (2, 2);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES
    (1, 1, 2, 150.00),
    (1, 2, 1, 300.00),
    (2, 3, 1, 3500.00);
