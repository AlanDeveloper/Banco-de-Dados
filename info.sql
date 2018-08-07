INSERT INTO <nome_tabela> [(<col1>,<col2>,...)]
VALUES (<val1>,<val2>,...),(<val1>,<val2>,...), ...

<> = preencher com algum valor
[] = opcionalidade
() = escolha um dos itens

INSERT INTO empregado (nome,codigo)
VALUES ('Carlos',005)

!!!""

DELETE FROM <tabela> [WHERE <condição>]

delete = deleta a linha

Condição:como em um if,pode ter:
-Operadores Relacionais: <,>,<=,>=,=,...
-Operadores Lógicos:and,or,...

= --> igualdade
|| --> concatena string

DELETE FROM empregado WHERE codeempregado=9

UPDATE <tabela> SET <col1>=<val1>,<col2>,<val2> ...
[WHERE <condição>]

UPDATE empregado SET nome='Jessica',idade=20
WHERE cpf='012.321.654-96' AND id=25

SELECT <col1>,<col2>,... FROM <tabela>
[WHERE <condição>]

SELECT nome, idade FROM empregado
WHERE salario >= 5000

Criar bd:

CREATE DATABASE <nome_bd>

Apagar um bd:

DROP DATABASE <nome_bd>

--DROPS
--DROP TABLE Funcionario;
--DROP TABLE Departamento;

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



SELECT (now() - datanascimento), age(datanascimento), EXTRACT(year FROM age(datanascimento)) FROM Funcionario

deletar uma linha

DELETE FROM Funcionario WHERE codfuncionario=1

ex
DELETE FROM Funcionario WHERE ((EXTRACT(year FROM age(datanascimento))) - 50) >= 0
