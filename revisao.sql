-- Crie uma view que liste os dados de fornecedores (nomeFantasia, número de vendas para sua loja, número de produtos já vendidos).


WITH "Vendas" AS (
SELECT f."nomeFantasia", COUNT(cp."codFornecedor") as "Compras", f.cod FROM "Fornecedor" f INNER JOIN "Compra" cp ON f.cod=cp."codFornecedor"
GROUP BY f."nomeFantasia", f.cod
ORDER BY f."nomeFantasia")

SELECT  v."nomeFantasia", v."Compras", COUNT(ic."codCompra") as "Produtos" FROM "Vendas" v INNER JOIN "ItemCompra" ic ON ic."codCompra"=v.cod
GROUP BY v."nomeFantasia", v."Compras"
ORDER BY v."nomeFantasia"



-- Crie uma view que liste os seguintes dados de produtos: codProduto, descrição, último preço unitário pago, preço unitário de venda e percentual de lucro. Ordene pelo percentual de lucro.

CREATE VIEW view_lucro AS
(SELECT ic."precoUnit" as "Fornecedor", p.precounit as "Venda", TRUNC(((p.precounit*100/ic."precoUnit")-100), 2)AS "PercentualdeLucro" FROM "ItemCompra" ic INNER JOIN produto p ON p.codproduto=ic."codProduto"
ORDER BY "PercentualdeLucro");


-- Considerando a tabela Compra, cite uma coluna que é candidata a ter um índice (que ainda não possua). Após crie o índice para a coluna escolhida.


-- A compra de um conjunto de produtos é considerada uma transação única, ou seja, ou a compra dos produtos é realizada ou não. Crie uma transação que realize a compra dos produtos de código 3 (quantidade 50, preço unitário 4.25), 5 (quantidade 50, preço unitário 6.25) e 8 (quantidade 50, preço unitário 2) feita no fornecedor de código 4 na data e hora de agora.
-- Analise se a execução do item 4 mudou os dados da view do exercício 2.
-- Faça uma view de nome “infoProdutos” que liste os dados da tabela produtos mais o número de itens vendidos e comprados de cada produto e os dados da view do exercício 2.