--criacao do bd
create database exercicioAvaliado
--criacao tabela
create table meta(
codigo int,
nome varchar(100) NOT NULL,
descricao varchar(1000) NOT NULL,
prioridade int NOT NULL,
dataCriacao timestamp NOT NULL,
dataConclusao timestamp,
CONSTRAINT metapk PRIMARY KEY (codigo),
CONSTRAINT prioridadeCheck CHECK (prioridade between 0 and 5))


SELECT * FROM meta

INSERT INTO meta (codigo,nome,descricao,prioridade,datacriacao,dataconclusao)
VALUES ()


-- Exercício 1

INSERT INTO meta (codigo,nome,descricao,prioridade,datacriacao,dataconclusao)
VALUES (1,'IFRS','Ser aceito numa escola conhecida,para ter uma base melhor',5,'12/05/2015','05/12/2015')

INSERT INTO meta (codigo,nome,descricao,prioridade,datacriacao,dataconclusao)
VALUES (2,'IF-1ano','Passar no 1 ano mesmo não tendo fisica',4,'10/03/2016 15:03:00','27/11/2016')


-- Exercício 2

INSERT INTO meta (codigo,nome,descricao,prioridade,datacriacao,dataconclusao)
VALUES (3,'Gato','Comprar um gato para mim',2,'12/03/2018','18/06/2018'),(4,'Cinema','Ir ao cinema para ver um filme',1,'23/03/2018 09:05:50','29/03/2018')

-- Exercício 3


INSERT INTO meta (codigo,nome,descricao,prioridade,datacriacao,dataconclusao)
VALUES (5,'Exercício','Inserir a meta de realizar o exercício 4 desta lista',3,'23/03/2018 14:33:00','23/03/2018 15:50:00')

-- Exercício 4


SELECT now() FROM meta

UPDATE meta SET dataconclusao='2018-03-23 14:38:00'
WHERE datacriacao='2018-03-23 14:33:00'


-- Exercício 5


UPDATE meta SET prioridade=1
WHERE EXTRACT(year FROM age(datacriacao)) > 5

-- Exercício 6

SELECT * FROM meta
WHERE EXTRACT(year FROM age(datacriacao)) > 5

-- Exercício 7

DELETE FROM meta WHERE (prioridade=1 or nome='teste' or nome='Teste' or nome='TESTE')
