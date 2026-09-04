Pergunta de negócio que responde

Faturamento bruto das vendas concluidas 
Fórmula para determinar o faturamento (quantidade * preco_unitario)

SELECT v.id_venda,
        SUM(i.quantidade * i.preco_unitario) AS faturamento_bruto

    FROM itens_venda i

JOIN vendas v
    ON i.id_venda = v.id_venda

    WHERE v.status LIKE 'Concluída'

    GROUP BY  v.id_venda;