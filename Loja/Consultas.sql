-- a. Os funcionários (nome, sexo e salário) com salário maior que R$2.000.

SELECT (nome, sexo, salario) FROM "funcionario" WHERE salario > 2000;

-- b. Os funcionários (nome, cpf) com "cadu" ou "carla" no nome ou no login (desconsiderar maiúsculas e minúsculas.

SELECT (nome, cpf) FROM "funcionario" 
WHERE Lower(nome) like '%cadu%' or Lower(nome) like '%carla%' or Lower(login) like '%cadu%' or Lower(login) like '%carla%';

-- c. Fazer o item b para os clientes comparando apenas o nome

SELECT (nome, cpf) FROM "cliente"
WHERE Lower(nome) like '%cadu%' or Lower(nome) like '%carla%';

-- d. Unir as consultas do item b e c em uma única consulta.

SELECT (nome, cpf) FROM "cliente"
WHERE Lower(nome) like '%cadu%' or Lower(nome) like '%carla%'
UNION
SELECT (nome, cpf) FROM "funcionario" 
WHERE Lower(nome) like '%cadu%' or Lower(nome) like '%carla%' or Lower(login) like '%cadu%' or Lower(login) like '%carla%';

-- e. Mostrar os diferentes codDepartamento existentes na tabela Funcionario.

SELECT DISTINCT (codDepartamento) FROM "funcionario";

-- f. Mostrar todas as informações para cliente que possuem email no Hotmail ou gmail.

SELECT (codCliente, nome, email, cpf) FROM "cliente"
WHERE email ilike '%gmail%' or email ilike '%hotmail%';

-- g. Mostrar todas as informações para funcionários com salário entre 2000 e 6000 e idade entre 20 anos e 40 anos.

SELECT * FROM "funcionario" WHERE salario BETWEEN 2000 and 6000 and extract(year FROM age(dataNascimento)) BETWEEN 20 and 40;

-- h. Ordene os funcionários pelo sexo (crescente) caso de empate pelo salário (decrescente)

SELECT nome, sexo, salario FROM funcionario
ORDER BY sexo, salario;

-- i. Os clientes ordenados pelo nome.

SELECT nome FROM cliente
ORDER BY nome;

-- j. A média salarial e o maior e menor salário dos funcionários.

SELECT AVG(salario) as media, MAX(salario), MIN(salario) FROM funcionario;

-- k. O item j por sexo.

SELECT AVG(salario) as media, MAX(salario), MIN(salario), sexo FROM funcionario
GROUP BY sexo;

-- l. Os funcionários que também são clientes e que possuem salário menor que 4500. Ordene a resposta pela data de nascimento, do mais velho para o mais novo.

SELECT f.nome as funcionario_cliente, (f.nome = c.nome) AS correspondencia
FROM funcionario f LEFT JOIN cliente c ON f.nome=c.nome
ORDER BY f.nome;

-- m. Os funcionários que não são clientes.

SELECT distinct c.nome as cliente, (f.nome != c.nome) AS correspondencia
FROM funcionario f INNER JOIN cliente c ON f.nome!=c.nome
-- WHERE c.codcliente IS NULL
ORDER BY c.nome;

SELECT nome FROM funcionario
EXCEPT
SELECT nome FROM cliente;

SELECT * FROM funcionario WHERE cpf NOT IN ( SELECT cpf FROM cliente);

-- n. As vendas ordenadas por data

SELECT * FROM notafiscal
ORDER BY datavenda;

-- o. Quantas vendas por ano.

SELECT COUNT(datavenda) FROM notafiscal;

-- p. CodProduto e total de itens vendidos ordenados pelo total vendido decrescente

SELECT codproduto FROM produto;
SELECT * FROM notafiscal;

coalesce(par1, par2) -- retorna par1 caso não seja nulo, caso seja retorna par2

-- Exercício 2

-- a. O nome dos funcionários e de seus respectivos departamentos.

SELECT f.nome as funcionario, d.nome as departamento FROM funcionario f FULL OUTER JOIN departamento d 
    ON f.coddepartamento = d.coddepartamento
ORDER BY f.nome, d.nome;

-- b. Quantas diferentes pessoas (todos seus dados) existem no banco de dados (clientes e funcionários).

SELECT * FROM funcionario f FULL OUTER JOIN cliente c
USING(nome)
ORDER BY nome;

-- c. A média salarial por sexo dos funcionários que não são clientes e têm mais de 30 anos.

SELECT AVG(salario) AS media, sexo FROM funcionario
WHERE extract(year FROM age(dataNascimento)) > 30
GROUP BY sexo;

-- d. O item 1.j agrupado por nome do departamento e ordenado pelo nome do departamento para funcionários do sexo masculino com salário maior que 2000

SELECT AVG(salario) as media, MAX(salario), MIN(salario) FROM funcionario f;
GROUP BY nome
ORDER BY f.nome;