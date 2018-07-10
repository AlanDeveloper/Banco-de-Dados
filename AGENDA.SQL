CREATE DATABASE "Agenda";

CREATE TABLE "Telefone"(
"rotulo" varchar(50) NOT NULL, 
"idtelefone" integer,
CONSTRAINT "telefonePK" PRIMARY KEY (idtelefone));

CREATE TABLE "Grupo"(
"idgrupo" integer,
"nome" varchar (100) NOT NULL,
CONSTRAINT "grupoPK" PRIMARY KEY(idgrupo));

CREATE TABLE "Contato"(
"nome" varchar(100) NOT NULL,
"email" varchar(100) NOT NULL,
"ocupacao" varchar(100) NOT NULL,
"idcontato" integer,
"codgrupo" integer,
CONSTRAINT "contatoPK" PRIMARY KEY(idcontato),
CONSTRAINT "contatoFK" FOREIGN KEY(codgrupo)
REFERENCES "Grupo" ("idgrupo")
ON DELETE NO ACTION
ON UPDATE CASCADE);

CREATE TABLE "ConTel"(
"codcontato" integer,
"codtelefone" integer,
CONSTRAINT "contelPK" PRIMARY KEY (codcontato, codtelefone),
CONSTRAINT "conFK" FOREIGN KEY (codcontato)
REFERENCES "Contato" ("idcontato")
ON DELETE CASCADE
ON UPDATE NO ACTION,
CONSTRAINT "telFK" FOREIGN KEY (codtelefone)
REFERENCES "Telefone" ("idtelefone")
ON DELETE CASCADE
ON UPDATE NO ACTION);
