Pergunta de negócio que responde

Lista das vendas concluidas dentro do segundo semestre de 2025

SELECT *
    FROM VENDAS
    WHERE DATA_VENDA > '2025-05-31'
        AND STATUS LIKE 'Concluída';

