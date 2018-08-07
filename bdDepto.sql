CREATE TABLE  Departamento 
(	CODDEPARTAMENTO serial, 
	NOME VARCHAR(100), 
	 CONSTRAINT "DepartamentoPK" PRIMARY KEY (CODDEPARTAMENTO)
) ;
CREATE TABLE Funcionario
(
	codFuncionario serial,
	codDepartamento integer,
	CPF varchar(15) UNIQUE, 
	Nome varchar(50) NOT NULL,
	Salario numeric(7,2) NOT NULL ,
	DataNascimento date,
	Sexo varchar(1),
	CONSTRAINT "FuncionarioPK" PRIMARY KEY (codFuncionario),
	CONSTRAINT "CheckSexo" CHECK (Sexo = 'M' or Sexo = 'F'),
	CONSTRAINT "FuncionarioFKDepartamento" FOREIGN KEY (codDepartamento)
		REFERENCES Departamento (codDepartamento)
		on delete set null
		on update cascade
);

SELECT * FROM Funcionario
SELECT * FROM Departamento

INSERT INTO Departamento (coddepartamento,nome)
VALUES (1,'TI')
INSERT INTO Departamento (coddepartamento,nome)
VALUES (2,'RH'),(3,'Administração'),(4,'Almox')

Insira um funcionário com nome João Matias, cpf 01243565478 e que nasceu em 28/5/1995. Ele deve trabalhar no departamento TI.

INSERT INTO Funcionario (codfuncionario,coddepartamento,cpf,nome,salario,datanascimento,sexo)
VALUES (1,1,01243565478,'João Matias',2000,'28/5/1995','M')

Insira 3 funcionários (com dados diferentes) em cada departamento criado no exercício 1.

INSERT INTO Funcionario (codfuncionario,coddepartamento,cpf,nome,salario,datanascimento,sexo)
VALUES (2,1,02233545458,'Felícia Rocha',1500,'25/2/2000','F'),(3,1,03443265178,'Nathalia Silva',3000,'15/2/1990','F'),(4,1,07628355448,'Gustavo Gularte',2500,'28/5/1989','M')
INSERT INTO Funcionario (codfuncionario,coddepartamento,cpf,nome,salario,datanascimento,sexo)
VALUES (5,2,01233445557,'Julia Keller',1200,'21/8/1990','F'),(6,2,08645235178,'Nicolly Medeiros',3290,'25/3/1992','F'),(7,2,02637455448,'Maria Cardoso',2300,'18/5/1989','F')
INSERT INTO Funcionario (codfuncionario,coddepartamento,cpf,nome,salario,datanascimento,sexo)
VALUES (8,3,02223545757,'Junior Gomes',2000,'30/12/2003','M'),(9,3,04453265178,'Júlio Santos',2500,'28/7/1995','M'),(10,3,06658453448,'Gustavo Lima',2100,'25/3/1987','M')
INSERT INTO Funcionario (codfuncionario,coddepartamento,cpf,nome,salario,datanascimento,sexo)
VALUES (11,4,03237545352,'Adrian Castro',1700,'5/4/2002','M'),(12,4,02433265144,'Thalya Souza',2000,'18/4/1990','F'),(13,4,02623354448,'João Soares',2200,'9/11/1986','M')

INSERT INTO Departamento (coddepartamento,nome)
VALUES (5,'P&D')
UPDATE Funcionario SET coddepartamento=5
WHERE nome='João Matias'