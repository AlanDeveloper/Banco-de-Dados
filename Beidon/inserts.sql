SELECT * FROM "Estudio";

INSERT INTO "Estudio" (nome,cnpj,endereco,email,generoespecialidade)
VALUES ('Wit Studio', '44.130.690/0001-79', 'Avenida Primeiro de Maio - Vila Hidraulica, Rio Grande - RS', 'wit.studio@gmail.com', 'Ação');

INSERT INTO "Estudio" (nome,cnpj,endereco,email,generoespecialidade)
VALUES ('A-1 Pictures', '62.022.913/0001-66', 'Avenida Gen. Valdomiro de Lima, 144-180 - Jabaquara
São Paulo - SP', 'pictures.a1@gmail.com', 'Aventura');

SELECT * FROM "Distribuidora";

INSERT INTO "Distribuidora" (nome,cnpj,endereco,email)
VALUES ('Conrad Editora', '77.817.371/0001-95', 'Rua Simão Dias da Fonseca, 93 - Cambuci
São Paulo - SP', 'conrad.communication@gmail.com');

INSERT INTO "Distribuidora" (nome,cnpj,endereco,email)
VALUES ('Editora JBC', '13.265.195/0001-43', 'Rua Loefgreen, 1291 - 1º andar
Vila Mariana - São Paulo - SP', 'jbc@gmail.com');

INSERT INTO "Distribuidora" (nome,cnpj,endereco,email)
VALUES ('Panini Comics', '84.733.045/0001-65', 'Alameda Juari, 560 - Centro Empresarial Tambore
Barueri - São Paulo - SP', 'paninicomics@gmail.com');

SELECT * FROM "EstudioDistribuidora";

INSERT INTO "EstudioDistribuidora" (codestudio,coddistribuidora)
VALUES ('62.022.913/0001-66','13.265.195/0001-43');

INSERT INTO "EstudioDistribuidora" (codestudio,coddistribuidora)
VALUES ('44.130.690/0001-79','84.733.045/0001-65');

SELECT * FROM "Anime";

INSERT INTO "Anime" (nome,codigo,genero,datalancamento,publico,codestudio,coddistribuidora)
VALUES ('Nanatsu No Taizai', 71360959, 'Ação , Aventura , Fantasia , Shounen , Sobrenatural', '05/10/2014', 'Adolescente','62.022.913/0001-66','13.265.195/0001-43');

INSERT INTO "Anime" (nome,codigo,genero,datalancamento,publico,codestudio,coddistribuidora)
VALUES ('Koutetsujou no Karabeni', 84667969, 'Ação , Drama , Fantasia , Shounen , Terror', '08/04/2016', 'Adolescente','44.130.690/0001-79','84.733.045/0001-65');

SELECT * FROM "Adaptacao";

INSERT INTO "Adaptacao" (idioma,codigo,datalancamento,codanime)
VALUES ('Português', 4141, '09/01/2015', 71360959);

INSERT INTO "Adaptacao" (idioma,codigo,datalancamento,codanime)
VALUES ('Português', 6231, '15/05/2016', 84667969);

INSERT INTO "Adaptacao" (idioma,codigo,datalancamento,codanime)
VALUES ('Inglês', 6171, '01/05/2016', 84667969);

SELECT * FROM "Audio";

INSERT INTO "Audio" (codigo,codadaptacao)
VALUES (664, 4141);

SELECT * FROM "Legenda";

INSERT INTO "Legenda" (codigo,codadaptacao)
VALUES (1559, 6231);

INSERT INTO "Legenda" (codigo,codadaptacao)
VALUES (2934, 6171);

SELECT * FROM "Consumidor";

INSERT INTO "Consumidor" (nome,cpf,telefone,email)
VALUES ('Alan Souza dos Santos', '788.484.650-04','5553984360580','alanssantos32@gmail.com');

INSERT INTO "Consumidor" (nome,cpf,telefone,email)
VALUES ('Davi Tavares Ferreira','856.235.499-30','5553984560243','tavares.ferreira.davi@gmail.com');

SELECT * FROM "AnimeConsumidor";

INSERT INTO "AnimeConsumidor" (codconsumidor, codanime, codadaptacao)
VALUES ('788.484.650-04', 71360959, 4141);

INSERT INTO "AnimeConsumidor" (codconsumidor, codanime, codadaptacao)
VALUES ('856.235.499-30', 84667969, 6231);