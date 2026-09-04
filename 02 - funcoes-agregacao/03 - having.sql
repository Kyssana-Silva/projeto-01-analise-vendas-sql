Pergunta de negócio que responde

Quais categorias tem o faturamento concluido superior a R$500.000,00

SELECT p.categoria,
        sum(i.quantidade * i.preco_unitario) AS faturamento_bruto,
        sum (i.quantidade ) AS quantidade_vendida

    FROM produtos p

JOIN itens_venda i
    ON i.id_produto = p.id_produto

    GROUP BY  categoria


HAVING sum(i.quantidade * i.preco_unitario) >= 500000