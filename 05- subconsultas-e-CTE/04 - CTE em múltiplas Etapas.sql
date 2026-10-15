Pergunta de Negócio:

Qual o faturamento das vendas por cliente?

WITH vendas_concluidas AS (
    SELECT
        v.id_venda,
        SUM(
            (i.quantidade * i.preco_unitario) - i.desconto
        ) AS total_venda
    FROM vendas AS v
    INNER JOIN itens_venda AS i
        ON v.id_venda = i.id_venda
    WHERE v.status = 'Concluída'
    GROUP BY v.id_venda
),

total_por_cliente AS (
    SELECT
        v.id_cliente,
        SUM(vc.total_venda) AS total
    FROM vendas AS v
    INNER JOIN vendas_concluidas AS vc
        ON v.id_venda = vc.id_venda
    GROUP BY v.id_cliente
)

SELECT
    c.nome,
    tc.total
FROM total_por_cliente AS tc
INNER JOIN clientes AS c
    ON c.id_cliente = tc.id_cliente
ORDER BY tc.total DESC;