Pergunta de negócio que responde

Qual o faturamento mensal do ano de 2025?
     

WITH vendas_filtradas AS ( 
SELECT v.data_venda,
     i.quantidade,
     i.preco_unitario,
     i.desconto 
FROM vendas v JOIN itens_venda i ON v.id_venda = i.id_venda 
WHERE v.data_venda BETWEEN '2025-01-01' 
    AND '2025-12-31' 
    AND v.status='Concluída')
    
SELECT to_char(data_venda,'MM/YYYY') AS mes,
     SUM ((quantidade*preco_unitario)-desconto) AS faturamento_mensal 
FROM vendas_filtradas 
GROUP BY date_trunc('month', data_venda),
     to_char(data_venda, 'MM/YYYY')
