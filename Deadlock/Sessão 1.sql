drop database deadlock;
CREATE DATABASE deadlock;
USE deadlock;

SET AUTOCOMMIT = 0; -- Usado para o commit automatico ser desativado

-- criação de tabelas exemplo
CREATE TABLE TBA (
	codigo smallint primary key, 
    descricao VARCHAR(100)
); 

INSERT INTO TBA (codigo, descricao)
VALUES 
(1,'VALOR 1'),
(2,'VALOR 2');

CREATE TABLE TBB (
	codigo smallint primary key, 
    descricao VARCHAR(100)
);

INSERT INTO TBB (codigo, descricao)
VALUES 
(1,'VALOR 1'),
(2,'VALOR 2');

commit; -- efetua a criação das tabelas e inserção de dados

UPDATE TBA SET descricao = 'NOVO VALOR 1' where codigo = 1; -- atualiza a TBA

-- (atualizar a TBB na sessão 2)

UPDATE TBB SET descricao = 'NOVO VALOR 2' where codigo = 2; -- atualizar a TBB

-- (atualizar a TBA na sessão 2, momento em que ocorre o deadlock)
