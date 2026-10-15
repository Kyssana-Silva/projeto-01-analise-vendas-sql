Pergunta de Negócio

Qual o vendedor com maior faturamento por equipe?


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


total_por_vendedor as (
	select v.id_vendedor, sum (vc.total_venda) as total
	from vendas v
	inner join vendas_concluidas vc
	on v.id_venda = vc.id_venda 
	
	group by v.id_vendedor
	
),
total_por_equipe AS (
    SELECT
        vd.equipe,
        vd.nome,
        tv.id_vendedor,
        tv.total,

        ROW_NUMBER() OVER (
            PARTITION BY vd.equipe
            ORDER BY tv.total DESC
        ) AS posicao

    FROM vendedores vd
    JOIN total_por_vendedor tv
    on vd.id_vendedor = tv.id_vendedor
)


SELECT
    equipe,
    nome,
    id_vendedor,
    total AS faturamento
FROM total_por_equipe
WHERE posicao = 1;


