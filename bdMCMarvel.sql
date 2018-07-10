CREATE DATABASE bdMCMarvel;

CREATE TABLE "SuperHeroi" (
    id integer,
    nome varchar(50) NOT NULL,
    "nomeP" varchar(150) NOT NULL,
    sexo char(1) NOT NULL,
    numAparicoes integer NOT NULL,
    CONSTRAINT "SuperHeroiPK" PRIMARY KEY (id),
    CONSTRAINT "ValSexo" CHECK (lower(sexo) = 'f' or lower(sexo) = 'm')
)

CREATE TABLE "Equipe" (
    cod integer,
    nome varchar(50) NOT NULL,
    "idLider" integer NOT NULL,
    CONSTRAINT "EquipePK" PRIMARY KEY (cod),
    CONSTRAINT "EquipeSHFK" FOREIGN KEY ("idLider")
        REFERENCES "SuperHeroi" (id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
)

CREATE TABLE "SHEquip" (
    "idSH" integer,
    "codEquip" integer,
    CONSTRAINT "SHEquip" PRIMARY KEY ("idSH","codEquip"),
    CONSTRAINT "SHEquipEquipeFK" FOREIGN KEY ("codEquip")
        REFERENCES "Equipe" (cod)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT "EquipeSHFK" FOREIGN KEY ("idLider")
        REFERENCES "SuperHeroi" (id)
        ON DELETE NO ACTION
        ON UPDATE CASCADE
)