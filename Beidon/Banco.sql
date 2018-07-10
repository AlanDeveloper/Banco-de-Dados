CREATE DATABASE "Beidon";

CREATE TABLE "Estudio" (
    "nome" varchar(100) NOT NULL,
    "cnpj" varchar(18),
    "endereco" varchar(100) NOT NULL,
    "email" varchar(50) NOT NULL,
    "generoespecialidade" varchar(100) NOT NULL,
    CONSTRAINT "EstudioPK" PRIMARY KEY ("cnpj")
);
CREATE TABLE "Distribuidora" (
    "nome" varchar(100) NOT NULL,
    "cnpj" varchar(18),
    "endereco" varchar(100) NOT NULL,
    "email" varchar(50) NOT NULL,
    CONSTRAINT "DistribuidoraPK" PRIMARY KEY ("cnpj")
);
CREATE TABLE "Anime" (
    "nome" varchar(100) NOT NULL,
    "codigo" int,
    "genero" varchar(100) NOT NULL,
    "datalancamento" DATE NOT NULL,
    "publico" varchar(50) NOT NULL,
    "codestudio" varchar(18) NOT NULL,
    "coddistribuidora" varchar(18) NOT NULL,
    CONSTRAINT "AnimePK" PRIMARY KEY ("codigo"),
    CONSTRAINT "AnimeEstudioFK" FOREIGN KEY ("codestudio") REFERENCES "Estudio" ("cnpj")
            ON DELETE NO ACTION
            ON UPDATE CASCADE,
    CONSTRAINT "AnimeDistribuidoraFK" FOREIGN KEY ("coddistribuidora") REFERENCES "Distribuidora" ("cnpj")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
CREATE TABLE "Adaptacao" (
    "idioma" varchar(50) NOT NULL,
    "codigo" int,
    "codanime" int NOT NULL,
    "datalancamento" DATE NOT NULL,
    CONSTRAINT "AdaptacaoPK" PRIMARY KEY ("codigo"),
    CONSTRAINT "AdaptacaoFK" FOREIGN KEY ("codanime") REFERENCES "Anime" ("codigo")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
CREATE TABLE "Consumidor" (
    "nome" varchar(100) NOT NULL,
    "cpf" varchar(14),
    "telefone" varchar(13),
    "email" varchar(50) NOT NULL,
    CONSTRAINT "ConsumidorPK" PRIMARY KEY ("cpf")
);
CREATE TABLE "Audio" (
    "codigo" int,
    "codadaptacao" int,
    CONSTRAINT "AudioPK" PRIMARY KEY ("codigo"),
    CONSTRAINT "AudioFK" FOREIGN KEY ("codadaptacao") REFERENCES "Adaptacao" ("codigo")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
CREATE TABLE "Legenda" (
    "codigo" int,
    "codadaptacao" int,
    CONSTRAINT "LegendaPK" PRIMARY KEY ("codigo"),
    CONSTRAINT "LegendaFK" FOREIGN KEY ("codadaptacao") REFERENCES "Adaptacao" ("codigo")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
CREATE TABLE "EstudioDistribuidora" (
    "codestudio" varchar(18),
    "coddistribuidora" varchar(18),
    CONSTRAINT "EstudioDistribuidoraPK" PRIMARY KEY ("codestudio", "coddistribuidora"),
    CONSTRAINT "EstudioDisFK" FOREIGN KEY ("codestudio") REFERENCES "Estudio" ("cnpj")
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT "DistribuidoraEstFK" FOREIGN KEY ("coddistribuidora") REFERENCES "Distribuidora" ("cnpj")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
CREATE TABLE "AnimeConsumidor" (
    "codconsumidor" varchar(14),
    "codadaptacao" int,
    "codanime" int,
    CONSTRAINT "AnimeConsumidorPK" PRIMARY KEY ("codconsumidor", "codanime","codadaptacao"),
    CONSTRAINT "AnimeConFK" FOREIGN KEY ("codanime") REFERENCES "Anime" ("codigo")
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT "AnimeAdapFK" FOREIGN KEY ("codadaptacao") REFERENCES "Adaptacao" ("codigo")
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT "ConsumidorAniFK" FOREIGN KEY ("codconsumidor") REFERENCES "Consumidor" ("cpf")
        ON DELETE NO ACTION
        ON UPDATE CASCADE
);
-- Sugiro trocar os nomes das fk
-- E não sei ao certo sobre o NO ACTION nos delete
-- cascade acho que combina no update mas é bom rever em cada um    
