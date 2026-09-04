Pergunta de negócio que responde

Identificação dos clientes e das suas respectivas vendas concluidas 
SELECT
    c.id_cliente,
    c.nome,    
    STRING_AGG(v.id_venda::text, '| ' ORDER BY v.id_venda) AS id_vendas,
    count(v.id_venda) as quantidade_vendas
    
  FROM clientes c
  LEFT JOIN vendas v
    ON c.id_cliente = v.id_cliente
    AND v.status = 'Concluída'
  GROUP BY
    c.id_cliente,
    c.nome
  ORDER BY
    quantidade_vendas asc,c.id_cliente ;
