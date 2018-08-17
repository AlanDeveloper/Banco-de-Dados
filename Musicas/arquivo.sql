-- A composição de uma música deve ser vista como uma operação única (transação única). Informe os comandos que criam uma nova música composta por duas pessoas da base de modo que seja garantido que todas operações sejam executadas de maneira atômica. (2,0)


BEGIN TRANSACTION;

	INSERT INTO "Musica" (titulo, letra, dataComposicao) VALUES
	('Piloto Automatico', 'Eu nunca fiz questão de estar aqui, muito menos participar e ainda acho que o meu cotidiano... vai me largar', '15/08/2018');
    INSERT INTO "CompositorMusica" (codMusica, cpfCompositor) VALUES
	(3, '12345678985'), (3, '78945678985');

COMMIT WORK;

-- Uma consulta que faz uma busca por músicas fazendo um filtro por nome tem apresentado certa demora. O que você faria para melhorar a velocidade desse tipo de consulta. Informe o comando SQL que efetiva o proposto. (2,0)

CREATE INDEX "view_musica" ON "Musica" (titulo)


-- Criaria um índice para fazer a busca, pelo fato de que o índice pode melhorar a perfomance não necessitando, por exemplo, de um select com where que restringe os resultados




-- 3. Faça uma view de nome cantores que contenha o nome da pessoa e quantas gravações realizou. (3,0)

CREATE VIEW "nome_cantores" AS (

    SELECT p.nome "Cantor", coalesce(COUNT(cg.codgravacao), 0) "Gravacoes" FROM "Pessoa" p INNER JOIN "CantorGravacao" cg ON p.cpf=cg.cpfcantor
    GROUP BY p.nome
);

-- Faça uma view que contenha o nome das músicas, letra e nome dos compositores das músicas compostas no último ano. (3,0)


CREATE VIEW "view_musicas" AS (
    
    WITH "Donos" AS (
        SELECT * FROM "Musica" m INNER JOIN "CompositorMusica" cm ON m.codigo=cm.codmusica
    )

    SELECT dn.titulo "Musica", dn.letra, p.nome "Compositores" FROM "Donos" dn INNER JOIN "Pessoa" p ON dn.cpfcompositor=p.cpf
    WHERE extract(year FROM age(datacomposicao)) < 1
);