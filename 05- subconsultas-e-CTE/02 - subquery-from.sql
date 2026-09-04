Pergunta de negócio que responde

Listagem de clientes que tem pelo menos uma venda acima do ticket médio geral

SELECT
    c.id_cliente,
    c.nome,
    v.id_venda,
    ROUND(t.total_venda, 2) AS valor_venda
FROM clientes c
JOIN vendas v
    ON c.id_cliente = v.id_cliente
JOIN (
    SELECT
        id_venda,
        SUM((quantidade * preco_unitario) - desconto) AS total_venda
    FROM itens_venda
    GROUP BY id_venda
) AS t
    ON t.id_venda = v.id_venda
WHERE t.total_venda > (
    SELECT AVG(total_venda)
    FROM (
        SELECT
            id_venda,
            SUM((quantidade * preco_unitario) - desconto) AS total_venda
        FROM itens_venda
        GROUP BY id_venda
    ) AS ticket
)
ORDER BY c.id_cliente, t.total_venda DESC;
	