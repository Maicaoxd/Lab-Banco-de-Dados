-- Exercícios sobre Funções Agregadas e Cláusulas Group By e Having
 
CREATE DATABASE DB_LOJA;

USE DB_LOJA;

CREATE TABLE TB_PECA (
	CodPeca CHAR(2),
	NomePeca VARCHAR(255),
	CorPeca VARCHAR(255),
	PesoPeca SMALLINT,
	CidadePeca VARCHAR(255)
);

CREATE TABLE TB_EMBARQ (
	CodPeca CHAR(2),
	CodFornec CHAR(2),
	QtdeEmbarc SMALLINT
);

CREATE TABLE TB_FORNEC (
	CodFornec CHAR(2),
	NomeFornec VARCHAR(255),
	StatusFornec SMALLINT,
	CidadeFornec VARCHAR(255)
);

ALTER TABLE TB_PECA
ADD CONSTRAINT PK_PECA
PRIMARY KEY (CodPeca);

ALTER TABLE TB_FORNEC
ADD CONSTRAINT PK_FORNEC
PRIMARY KEY (CodFornec);

ALTER TABLE TB_EMBARQ
ADD CONSTRAINT FK_TB_PECA_TB_EMBARQ
FOREIGN KEY (CodPeca) REFERENCES TB_PECA (CodPeca);

ALTER TABLE TB_EMBARQ
ADD CONSTRAINT FK_TB_FORNEC_TB_EMBARQ
FOREIGN KEY (CodFornec) REFERENCES TB_FORNEC (CodFornec);

INSERT INTO TB_PECA
(CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca)
VALUES
	('P1', 'Eixo', 'Cinza', 10, 'Poa'),
	('P2', 'Rolamento', 'Preto', 16, 'Rio'),
	('P3', 'Mancal', 'Verde', 30, 'São Paulo');

INSERT INTO TB_FORNEC
(CodFornec, NomeFornec, StatusFornec, CidadeFornec)
VALUES
	('F1', 'Silva', 5, 'São Paulo'),
	('F2', 'Souza', 10, 'Rio'),
	('F3', 'Alvares', 5, 'São Paulo'),
	('F4', 'Tavares', 8, 'Rio');
	
INSERT INTO TB_EMBARQ
(CodPeca, CodFornec, QtdeEmbarc)
VALUES
	('P1', 'F1', 300),
	('P1', 'F2', 400),
	('P1', 'F3', 200),
	('P2', 'F1', 300),
	('P2', 'F4', 350);

-- 1) Obter o número de fornecedores na base de dados 
SELECT COUNT(CodFornec) FROM TB_FORNEC;

-- 2) Obter o número de cidades em que há fornecedores 
SELECT COUNT(DISTINCT(CidadeFornec)) FROM TB_FORNEC 
WHERE CodFornec IS NOT NULL;

-- 3) Obter o número de fornecedores com cidade informada 
SELECT COUNT(CodFornec) FROM TB_FORNEC
WHERE CidadeFornec IS NOT NULL;

-- 4) Obter a quantidade máxima embarcada 
SELECT MAX(QtdeEmbarc) FROM TB_EMBARQ;

-- 5) Obter o número de embarques de cada fornecedor 
SELECT CodFornec, COUNT(QtdeEmbarc) FROM TB_EMBARQ
GROUP BY CodFornec;

-- 6) Obter o número de embarques de quantidade maior que 300 de cada fornecedor
SELECT CodFornec, COUNT(QtdeEmbarc) FROM TB_EMBARQ
GROUP BY CodFornec
WHERE QtdeEmbarc > 300;

-- 7) Obter a quantidade total embarcada de peças de cor cinza para cada fornecedor
SELECT CodFornec, SUM(QtdeEmbarc) FROM TB_EMBARQ AS E
INNER JOIN TB_PECA AS P
ON E.CodPeca = P.CodPeca
WHERE P.CorPeca = 'Cinza'
GROUP BY CodFornec;

-- 8) Obter o quantidade total embarcada de peças para cada fornecedor. 
-- Exibir o resultado por ordem descendente de quantidade total embarcada. 
SELECT CodFornec, SUM(QtdeEmbarc) FROM TB_EMBARQ
GROUP BY CodFornec
ORDER BY SUM(QtdeEmbarc) DESC;

-- 9) Obter os códigos de fornecedores que tenham embarques de mais de 500 unidades 
-- de peças cinzas, junto com a quantidade de embarques de peças cinza
SELECT CodFornec, SUM(QtdeEmbarc) FROM TB_EMBARQ
WHERE CodPeca IN (
	SELECT CodPeca FROM 
TB_PECA
	WHERE CorPeca = 'Cinza'
) GROUP BY CodFornec
HAVING SUM(QtdeEmbarc) > 500;


