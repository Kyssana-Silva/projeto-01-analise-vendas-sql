Pergunta de negócio que responde

Classificação dos produtos em 'Baixo', 'Médio' e 'Alto' preço.
A regra usada foi a margem de lucro dos produtos e eles foram separados de maneira similar usando o comando NTILE(3), para simbolizar as 3 categorias diferentes

SELECT
	produto,
    categoria,
    round (margem_lucro,2) as margem_lucro,
    CASE NTILE(3) OVER (ORDER BY margem_lucro)
        WHEN 1 THEN 'Baixo'
        WHEN 2 THEN 'Médio'
        WHEN 3 THEN 'Alto'
    END AS classificacao_lucratividade
FROM (
    select
    	produto,
        categoria,
        avg ((preco-custo)/preco*100) AS margem_lucro
    FROM produtos
    GROUP BY produto, categoria
) AS dados;
