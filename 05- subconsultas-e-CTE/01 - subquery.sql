Pergunta de negócio que responde

Listagems de produtos cujo o preço é maior do que o preço médio dos produtos

 SELECT *
    FROM produtos
    WHERE preco > (SELECT round(avg(preco),
        2) AS preco_medio
    FROM produtos)