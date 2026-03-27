SELECT
    SUM(i.quantidade * i.preco_unitario) AS faturamento_total
FROM itens_pedido AS i;

SELECT
    p.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedido AS i
INNER JOIN produtos AS p
    ON p.produto_id = i.produto_id
GROUP BY p.nome
ORDER BY total_vendido DESC;

SELECT
    c.nome,
    COUNT(p.pedido_id) AS total_pedidos
FROM clientes AS c
INNER JOIN pedidos AS p
    ON p.cliente_id = c.cliente_id
GROUP BY c.nome
ORDER BY total_pedidos DESC;

SELECT
    c.nome,
    SUM(i.quantidade * i.preco_unitario) AS total_gasto
FROM clientes AS c
INNER JOIN pedidos AS p
    ON p.cliente_id = c.cliente_id
INNER JOIN itens_pedido AS i
    ON i.pedido_id = p.pedido_id
GROUP BY c.nome
ORDER BY total_gasto DESC;

SELECT
    nome,
    estoque
FROM produtos;

SELECT
    s.nome AS status,
    COUNT(*) AS total
FROM pedidos AS p
INNER JOIN status_pedido AS s
    ON s.status_id = p.status_id
GROUP BY s.nome
ORDER BY total DESC;
