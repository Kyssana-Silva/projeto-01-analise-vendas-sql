Pergunta de negócio que responde

Faturamento por categoria

SELECT p.categoria,
        sum(i.quantidade * i.preco_unitario) AS faturamento_bruto,
        sum (i.quantidade ) AS quantidade_vendida
FROM produtos p
JOIN itens_venda i
    ON i.id_produto = p.id_produto
GROUP BY categoria;