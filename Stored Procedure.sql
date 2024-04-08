-- 1- Procedure para Inserir um registro na Tabela Peça, usando parâmetros;

DELIMITER // 
CREATE PROCEDURE sp_inserir (
    IN CodPeca CHAR(10),
    IN NomePeca VARCHAR(255),
    IN CorPeca VARCHAR(255),
    IN PesoPeca SMALLINT,
    IN CidadePeca VARCHAR(255)
)
BEGIN
INSERT INTO TB_PECA
    (CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca)
VALUES
	(CodPeca,NomePeca, CorPeca,PesoPeca, CidadePeca);
END//
DELIMITER ;

CALL sp_inserir('P4', 'Roda', 'Preta', 15, 'São Paulo');


-- 2- Procedure para Inserir 5000 registros distintos na Tabela Peça;

DELIMITER //
CREATE PROCEDURE sp_loop()
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE pk CHAR(10);

    WHILE contador <= 5000 DO
        SET pk = CONCAT('P', contador);
        CALL sp_inserir(pk, 'Roda', 'Preta', 15, 'São Paulo');
        SET contador = contador + 1;
    END WHILE;
END//
DELIMITER ;

CALL sp_loop();