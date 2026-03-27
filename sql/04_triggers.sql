GO
CREATE TRIGGER trg_baixa_estoque
ON itens_pedido
AFTER INSERT
AS
BEGIN
    UPDATE p
    SET p.estoque = p.estoque - i.quantidade
    FROM produtos AS p
    INNER JOIN inserted AS i
        ON i.produto_id = p.produto_id;
END;
GO

CREATE TRIGGER trg_historico_preco
ON produtos
AFTER UPDATE
AS
BEGIN
    IF UPDATE(preco)
    BEGIN
        INSERT INTO historico_precos (
            produto_id,
            preco_antigo,
            preco_novo
        )
        SELECT
            d.produto_id,
            d.preco,
            i.preco
        FROM deleted AS d
        INNER JOIN inserted AS i
            ON i.produto_id = d.produto_id
        WHERE d.preco <> i.preco;
    END
END;
GO
