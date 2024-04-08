DROP DATABASE faculdade;
CREATE DATABASE faculdade;
USE faculdade;

CREATE TABLE Depto  (
    CodDepto CHAR(5),
    NomeDepto VARCHAR(40)
);

CREATE TABLE Disciplina (
    CodDepto CHAR(5),
    NumDisc int,
    NomeDisc VARCHAR(10),
    CreditoDisc int
);

CREATE TABLE PreReq (
    CodDeptoPreReq CHAR(5),
    NumDiscPreReq int,
    CodDepto CHAR(5),
    NumDisc int
);

CREATE TABLE Turma (
    AnoSem int,
    CodDepto CHAR(5),
    NumDisc int,
    SiglaTur CHAR(2),
    CapacTur int
);

CREATE TABLE Horario (
    AnoSem int,
    CodDepto CHAR(5),
    NumDisc int,
    SiglaTur CHAR(2),
    DiaSem int,
    HoraInicio int,
    NumSala int,
    CodPred int,
    NumHoras int
);

CREATE TABLE Predio (
    CodPred int,
    NomePred VARCHAR(40)
);

CREATE TABLE Sala (
    CodPred int,
    NumSala int,
    DescricaoSala VARCHAR(40),
    CapacSala int
);

CREATE TABLE Professor (
    CodProf int,
    CodDepto CHAR(5),
    CodTit int,
    NomeProf VARCHAR(40)
);

CREATE TABLE ProfTurma (
    AnoSem int,
    CodDepto CHAR(5),
    NumDisc int,
    SiglaTur CHAR(2),
    CodProf int
);

CREATE TABLE Titulacao (
    CodTit int,
    NomeTit VARCHAR(40)
);

ALTER TABLE Depto
ADD CONSTRAINT pk_Depto
PRIMARY KEY (CodDepto);

ALTER TABLE Disciplina
ADD CONSTRAINT pk_Disciplina
PRIMARY KEY (CodDepto, NumDisc);

ALTER TABLE PreReq
ADD CONSTRAINT pk_PreReq
PRIMARY KEY (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc);

ALTER TABLE Turma
ADD CONSTRAINT pk_Turma
PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur);

ALTER TABLE Horario
ADD CONSTRAINT pk_Horario
PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio);

ALTER TABLE Predio
ADD CONSTRAINT pk_Predio
PRIMARY KEY (CodPred);

ALTER TABLE Sala
ADD CONSTRAINT pk_Sala
PRIMARY KEY (CodPred, NumSala);

ALTER TABLE Professor
ADD CONSTRAINT pk_Professor
PRIMARY KEY (CodProf);

ALTER TABLE ProfTurma
ADD CONSTRAINT pk_ProfTurma
PRIMARY KEY (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf);

ALTER TABLE Titulacao
ADD CONSTRAINT pk_Titulacao
PRIMARY KEY (CodTit);

ALTER TABLE Disciplina
ADD CONSTRAINT fk_Discipli_Relation_Depto
FOREIGN KEY (CodDepto) REFERENCES Depto (CodDepto);

ALTER TABLE PreReq
ADD CONSTRAINT fk_PreReq_Tem_Pre_Discipli
FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina (CodDepto, NumDisc);

ALTER TABLE PreReq
ADD CONSTRAINT fk_PreReq_Eh_Pre_Discipli
FOREIGN KEY (CodDeptoPreReq, NumDiscPreReq) REFERENCES Disciplina (CodDepto, NumDisc);

ALTER TABLE Turma
ADD CONSTRAINT fk_Turma_Relation_Discipli
FOREIGN KEY (CodDepto, NumDisc) REFERENCES Disciplina (CodDepto, NumDisc);

ALTER TABLE Horario
ADD CONSTRAINT fk_Horario_Relation_Turma
FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma (AnoSem, CodDepto, NumDisc, SiglaTur);

ALTER TABLE Horario
ADD CONSTRAINT fk_Horario_Relation_Sala
FOREIGN KEY (CodPred, NumSala) REFERENCES Sala (CodPred, NumSala);

ALTER TABLE Sala
ADD CONSTRAINT fk_Sala_Relation_Predio
FOREIGN KEY (CodPred) REFERENCES Predio (CodPred);

ALTER TABLE Professor
ADD CONSTRAINT fk_Professor_Relation_Depto
FOREIGN KEY (CodDepto) REFERENCES Depto (CodDepto);

ALTER TABLE Professor
ADD CONSTRAINT fk_Professor_Relation_Titulacao
FOREIGN KEY (CodTit) REFERENCES Titulacao (CodTit);

ALTER TABLE ProfTurma
ADD CONSTRAINT fk_ProfTurm_ProfTurma_Turma
FOREIGN KEY (AnoSem, CodDepto, NumDisc, SiglaTur) REFERENCES Turma (AnoSem, CodDepto, NumDisc, SiglaTur);

ALTER TABLE ProfTurma
ADD CONSTRAINT fk_ProfTurm_ProfTurma_Professor
FOREIGN KEY (CodProf) REFERENCES Professor (CodProf);

INSERT INTO Depto (CodDepto, NomeDepto) 
VALUES
    ('INF01', 'Informatica'),
    ('MAT01', 'Matematica'),
    ('FIS01', 'Fisica');

INSERT INTO Disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc) 
VALUES
    ('INF01', 101, 'Introducao a Ciencia da Computacao', 4),
    ('INF01', 102, 'Programacao de Computadores I', 4),
    ('MAT01', 101, 'Calculo I', 4),
    ('FIS01', 101, 'Fisica I', 4);

INSERT INTO PreReq (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc) 
VALUES
    ('INF01', 102, 'INF01', 101);

INSERT INTO Turma (AnoSem, CodDepto, NumDisc, SiglaTur, CapacTur) 
VALUES
    (20021, 'INF01', 101, 'A', 40),
    (20021, 'INF01', 102, 'A', 40),
    (20022, 'INF01', 102, 'A', 40),
    (20021, 'MAT01', 101, 'A', 40);

INSERT INTO Predio (CodPred, NomePred) 
VALUES
    (43423, 'Informatica - aulas'),
    (43424, 'Matematica - aulas');

INSERT INTO Sala (CodPred, NumSala, DescricaoSala, CapacSala) 
VALUES
    (43423, 101, 'Laboratório de Informatica I', 40),
    (43424, 202, 'Sala de aula 2', 30);

INSERT INTO Horario (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio, NumSala, CodPred, NumHoras) 
VALUES
    (20021, 'INF01', 101, 'A', 2, 8, 101, 43423, 2),
    (20021, 'INF01', 101, 'A', 4, 10, 101, 43423, 2),
    (20022, 'INF01', 102, 'A', 3, 14, 202, 43424, 2),
    (20021, 'INF01', 102, 'A', 3, 14, 202, 43424, 2);

INSERT INTO Titulacao (CodTit, NomeTit) 
VALUES
    (1, 'Doutor'),
    (2, 'Mestre');

INSERT INTO Professor (CodProf, CodDepto, CodTit, NomeProf) 
VALUES
    (1, 'INF01', 1, 'Antunes'),
    (2, 'MAT01', 2, 'Silva'),
    (3, 'FIS01', 1, 'Barbosa');

INSERT INTO ProfTurma (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf) 
VALUES
    (20021, 'INF01', 101, 'A', 1),
    (20021, 'INF01', 102, 'A', 1),
    (20022, 'INF01', 102, 'A', 1);


-- 01- Obter os códigos dos diferentes departamentos que tem turmas no ano-semestre 2002/1
DELIMITER $$
CREATE OR REPLACE PROCEDURE Procedure01()
BEGIN

	DECLARE departamento CHAR(5);
    DECLARE turma INT;
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT DISTINCT(CodDepto), AnoSem FROM TURMA
            WHERE AnoSem = 20021;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO departamento, turma;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT departamento, turma;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL Procedure01();

-- 02- Obter os códigos dos professores que sao do departamento de código 'INF01' e que ministraram ao menos uma turma em 2002/1.  
DELIMITER $$
CREATE OR REPLACE PROCEDURE Procedure02()
BEGIN

	DECLARE professor INT;
    DECLARE departamento CHAR(5);
    DECLARE turma INT;
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT CodProf, CodDepto, AnoSem FROM ProfTurma
            WHERE CodDepto = 'INF01' 
            AND AnoSem = 20021;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO professor, departamento, turma;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT professor, departamento, turma;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL Procedure02();

-- 03- Obter os horarios de aula (dia da semana,hora inicial e número de horas ministradas) do professor "Antunes" em 20021.
DELIMITER $$
CREATE OR REPLACE PROCEDURE Procedure03()
BEGIN

	DECLARE professor VARCHAR(40);
    DECLARE diaSemana INT;
    DECLARE horaInicial INT;
    DECLARE nHorasMinis INT;
    DECLARE turma INT;
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT P.NomeProf, H.DiaSem, H.HoraInicio, H.NumHoras, T.AnoSem FROM Horario AS H

            INNER JOIN TURMA AS T
            ON T.AnoSem = H.AnoSem 
            AND T.CodDepto = H.CodDepto 
            AND T.NumDisc = H.NumDisc 
            AND T.SiglaTur = H.SiglaTur 

            INNER JOIN ProfTurma AS PT
            ON PT.AnoSem = T.AnoSem
            AND PT.CodDepto = T.CodDepto
            AND PT.NumDisc = T.NumDisc
            AND PT.SiglaTur = T.SiglaTur

            INNER JOIN Professor AS P
            ON P.CodProf = PT.CodProf
            
            WHERE P.NomeProf = 'Antunes' 
            AND T.AnoSem = 20021;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO professor, diaSemana, horaInicial, nHorasMinis, turma;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT professor, diaSemana, horaInicial, nHorasMinis, turma;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL Procedure03();

-- 04- Obter os nomes dos departamentos que têm turmas que, em 2002/1, têm aulas na sala 101 do prédio denominado 'Informatica - aulas'.
DELIMITER $$
CREATE OR REPLACE PROCEDURE Procedure04()
BEGIN

	DECLARE departamento VARCHAR(40);
    DECLARE turma INT;
    DECLARE sala INT;
    DECLARE predio VARCHAR(40);
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT DISTINCT D.NomeDepto, H.AnoSem, H.NumSala, P.NomePred FROM Horario AS H

            INNER JOIN Depto AS D
            ON D.CodDepto = H.CodDepto

            INNER JOIN Predio AS P
            ON P.CodPred = H.CodPred
            
            WHERE H.NumSala = 101 
            AND H.AnoSem = 20021 
            AND P.NomePred = 'Informatica - aulas';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO departamento, turma, sala, predio;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT departamento, turma, sala, predio;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL Procedure04();

-- 05- Obter os códigos dos professores com titulo denominado 'Doutor' que nao ministraram aulas em 2002/1.
DELIMITER $$
CREATE OR REPLACE PROCEDURE Procedure05()
BEGIN

	DECLARE professor VARCHAR(40);
    DECLARE turma INT;
    DECLARE titulo VARCHAR(40);
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT DISTINCT P.NomeProf, PT.AnoSem, T.NomeTit FROM Professor AS P

            INNER JOIN Titulacao AS T
            ON P.CodTit = T.CodTit

            INNER JOIN ProfTurma AS PT
            ON PT.CodProf = P.CodProf
            
            WHERE T.NomeTit = 'Doutor' 
            AND NOT PT.AnoSem = 20021;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO professor, turma, titulo;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT professor, turma, titulo;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL Procedure05();

-- 06- Obter os identificadores das salas (código do prédio e número da sala) que, em 2002/1:  
    -- nas segundas-feiras (dia da semana = 2), tiveram ao menos uma turma do departamento 'Informatica', e  
    -- nas quartas-feiras (dia da semana = 4), tiveram ao menos uma turma ministrada pelo professor denominado 'Antunes'.

-- 07- Obter o dia da semana, a hora de inicio e o número de horas de cada horario de cada turma ministrada 
-- por um professor de nome `Antunes', em 2002/1, na sala número 101 do prédio de código 43423.  

-- 08- Um professor pode ministrar turmas de disciplinas pertencentes a outros departamentos. Para cada professor que ja ministrou aulas em 
-- disciplinas de outros departamentos, obter o código do professor, seu nome, o nome de seu departamento e o nome do departamento no qual ministrou disciplina.  

-- 09- Obter o nome dos professores que possuem horarios conflitantes (possuem turmas que tenham a mesma hora inicial, no mesmo dia da semana
-- e no mesmo semestre). Além dos nomes, mostrar as chaves primarias das turmas em conflito.  

-- 10- Para cada disciplina que possui pré-requisito, obter o nome da disciplina seguido do nome da disciplina que é seu pré-requisito.  

-- 11- Obter os nomes das disciplinas que nao têm pré-requisito.  

-- 12- Obter o nome de cada disciplina que possui ao menos dois pré-requisitos.  