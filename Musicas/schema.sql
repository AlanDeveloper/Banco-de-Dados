DROP TABLE IF EXISTS "Gravacao";
DROP TABLE IF EXISTS "CompositorMusica";
DROP TABLE IF EXISTS "CantorMusica";
DROP TABLE IF EXISTS "Pessoa";
DROP TABLE IF EXISTS "Musica";

CREATE TABLE "Pessoa"
(	cpf char(11),
	nome varchar(100) NOT NULL,
	dataNascimento date NOT NULL,
	CONSTRAINT "PessoaPK" PRIMARY KEY (cpf)
);

CREATE TABLE "Musica"
(	codigo serial,
  	titulo varchar(50) NOT NULL,
  	letra text NOT NULL,
	dataComposicao date NOT NULL,
  	CONSTRAINT "MusicaPK" PRIMARY KEY (codigo)
);

CREATE TABLE "CompositorMusica"
(	codMusica integer NOT NULL,
  	cpfCompositor character(14) NOT NULL,
  	CONSTRAINT "CompositorMusicaPK" PRIMARY KEY (codMusica, cpfCompositor),
  	CONSTRAINT "CMCompositorFK" FOREIGN KEY (cpfCompositor)
      		REFERENCES "Pessoa" (CPF) 
      		ON UPDATE CASCADE ON DELETE CASCADE,
  	CONSTRAINT "CMMusicaFK" FOREIGN KEY (codMusica)
      		REFERENCES "Musica" (codigo) 
      		ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE "Gravacao"
(
 	codigo serial NOT NULL,
  	codMusica integer NOT NULL,
  	duracao interval NOT NULL,
  	tipo varchar(10) NOT NULL,
  	CONSTRAINT "tipoCheck" CHECK (tipo = 'estúdio' OR tipo = 'acústico' OR tipo = 'ao vivo' OR tipo = 'remix'),
  	CONSTRAINT "GravacaoPK" PRIMARY KEY (codigo),
  	CONSTRAINT "GravacaoMusicaFK" FOREIGN KEY (codMusica)
      		REFERENCES "Musica" (codigo) 
      		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE "CantorGravacao"
(	codGravacao integer NOT NULL,
  	cpfCantor character(14) NOT NULL,
  	CONSTRAINT "CantorMusicaPK" PRIMARY KEY (codGravacao, cpfCantor),
  	CONSTRAINT "CMCantorFK" FOREIGN KEY (cpfCantor)
      		REFERENCES "Pessoa" (CPF) 
      		ON UPDATE CASCADE ON DELETE CASCADE,
  	CONSTRAINT "CMGravacaoFK" FOREIGN KEY (codGravacao)
      		REFERENCES "Gravacao" (codigo) 
      		ON UPDATE CASCADE ON DELETE CASCADE
);


INSERT INTO "Pessoa" (cpf, nome, datanascimento) VALUES 
	('12345678985', 'Tiririca Junior', '05/09/1980'),
	('78945678985', 'MC queh vinho tinto', '09/10/1990'),
	('34573217905', 'Pedrita', '09/10/1995'),
	('05478917905', 'Washinton malvadão', '11/11/1987'),
	('05454612905', 'Carlos Pimenta', '11/02/1983'),
	('00112233665', 'MC sem voz e criatividade', '11/02/1983');

INSERT INTO "Musica" (titulo, letra, dataComposicao) VALUES
	('Funk da aprovação', 'no IF eu quero estar, IF eu estudar, vou a... vou a... vou a a a a APROVAR', '07/08/2016'),
	('Melo do tetahead', 'aula eu não quero, soh joguinho q eu gosto, lol é a minha vida, não me zoa isso é um esporte!! JOGA, JOGA aaa, oq eu quero é JOGAR', '09/09/2017');

INSERT INTO "Gravacao" (codMusica, duracao, tipo) VALUES
	(1,interval '2 min  1 sec', 'estúdio'),
	(1,interval '2 min  6 sec', 'ao vivo'),
	(2,interval '3 min  22 sec', 'estúdio'),
	(2,interval '5 min  27 sec', 'ao vivo'),
	(2,interval '8 min  46 sec', 'remix');

INSERT INTO "CompositorMusica" (codMusica, cpfCompositor) VALUES
	(1,'12345678985'),	(2,'05478917905'),
	(1,'78945678985'),	(2,'78945678985');
	
INSERT INTO "CantorGravacao" (codGravacao,  cpfCantor) VALUES
	(1,'05454612905'),(1,'34573217905'),
	(2,'34573217905'),(2,'78945678985'),(2,'05478917905'),
	(3,'12345678985'),(3,'05478917905'),
	(4,'05478917905'),
	(5,'78945678985');
	
