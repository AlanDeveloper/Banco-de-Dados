// Crie uma view que liste os dados de funcionários (nome, cpf, salario, dataNascimento, sexo e nome do departamento)

CREATE VIEW "DadosFunci" AS 
    (SELECT f.nome, f.cpf, f.salario, f.dataNascimento, f.sexo, dep.nome as "Departamento" FROM funcionario f 
    INNER JOIN departamento dep ON f.coddepartamento=dep.coddepartamento
    ORDER BY f.nome); 


// Crie uma view que liste o número de compras e o total em reais comprado por cada cliente (o nome e cpf do cliente)


WITH compras2 AS(
    WITH compras AS (
        SELECT c.nome, c.cpf, nf.codcliente, COUNT(nf.codcliente) FROM cliente c INNER JOIN notafiscal nf ON c.codcliente=nf.codcliente
        GROUP BY c.nome, c.cpf, nf.codcliente
        ORDER BY c.nome
    )
    SELECT cp.*, nf.codnotafiscal FROM compras cp INNER JOIN notafiscal nf ON cp.codcliente=nf.codcliente)
SELECT cp2.nome, cp2.cpf, SUM(iv.precounitvenda* iv.quantidade) AS "total" FROM compras2 cp2 INNER JOIN itemvenda iv ON cp2.codnotafiscal=iv.codnotafiscal
    GROUP BY cp2.nome, cp2.cpf;



// Faça uma consulta que liste o nome dos funcionários e departamentos. Faça uma view para cada item de llistagem pedido:
// a. Apenas funcionários alocados em um departamento e departamento com funcionários.
// b. Todos funcionários e apenas departamentos com funcionários.
// c. Apenas funcionários alocados em um departamento e todos os departamentos.
// d. Todos funcionários e todos departamentos.
// Após criar as views, insira 2 departamentos sem funcionários e 2 funcionários sem vinculo a um departamento e observe as mudanças nas views

SELECT f.nome as "funcionario", dep.nome as "departamento" FROM funcionario f INNER JOIN departamento dep ON f.coddepartamento=dep.coddepartamento
ORDER BY f.nome;

// a



// b
SELECT f.nome as "funcionario", dep.nome as "departamento" FROM funcionario f RIGHT OUTER JOIN departamento dep ON f.coddepartamento=dep.coddepartamento
ORDER BY f.nome;


// Considerando a tabela Funcionario, cite uma coluna que é candidata a ter um índice e uma que não deve ter um índice. Após crie o índice para a coluna escolhida.


CREATE INDEX "view_funcionario" ON funcionario (cpf)

// Um sistema que utiliza o banco de dados apresentado realiza muitas pesquisas com filtro pela data de emissão de cada nota fiscal, essas consultas têm apresentado uma certa lentidão. Que solução você propõe para solucionar o problema (informe também o comando SQL para efetivar a solução)?

// Como é feito o controle de transações em Banco de dados, com quais comandos? Explique por que isso é útil.

// A venda de um conjunto de produtos é considerada uma transação única, ou seja, ou a venda dos produtos é realizada ou não. Crie uma transação que realize a compra dos produtos de código 3 (quantidade 5), 5 (quantidade 3) e 8 (quantidade 2) feita pelo funcionário de código 3 e cliente de código 2.

BEGIN TRANSACTION;
    INSERT INTO notafiscal (datavenda, codfuncionario, codcliente) VALUES 
(now(), 3, 2);
    INSERT INTO itemVenda (codnotafiscal, codproduto, quantidade, precoUnitVenda) VALUES 
(11,3,5,produto.precounit), (12,5,3,produto.precounit), (13,8,2,produto.precounit);  

// Liste o total de chefes que cada funcionário possui, considere o chefe de seu chefe direto e assim sucessivamente.



// Liste o nome de cada funcionário e o total de vendas (quantidade de vendas) deste funcionário somadas à cadeia de funcionários que chefia.


// Refaça o item anterior listando, ao invés do total de vendas o valor (em reais) total em vendas.