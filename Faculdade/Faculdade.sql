CREATE database Faculdade;
USE Faculdade;

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
VALUES ('COMP', 'Computação'),
       ('ELEC', 'Elétrica'),
       ('CIVIL', 'Engenharia Civil'),
       ('QUIM', 'Química');

INSERT INTO Disciplina (CodDepto, NumDisc, NomeDisc, CreditoDisc)
VALUES ('COMP', 101, 'Programação I', 3),
       ('COMP', 202, 'Banco de Dados I', 3),
       ('ELEC', 301, 'Circuitos Elétricos I', 4),
       ('ELEC', 302, 'Eletrônica Básica', 3),
       ('CIVIL', 400, 'Cálculo I', 4),
       ('CIVIL', 401, 'Resistência dos Materiais I', 4),
       ('QUIM', 500, 'Química Geral', 3),
       ('QUIM', 501, 'Química Analítica I', 3);

INSERT INTO PreReq (CodDeptoPreReq, NumDiscPreReq, CodDepto, NumDisc)
VALUES ('COMP', 101, 'COMP', 202),  -- Programação I is a pre-requisite for Banco de Dados I
       ('ELEC', 301, 'ELEC', 302),  -- Circuitos Elétricos I is a pre-requisite for Eletrônica Básica
       ('CIVIL', 400, 'CIVIL', 401);  -- Cálculo I is a pre-requisite for Resistência dos Materiais I

INSERT INTO Turma (AnoSem, CodDepto, NumDisc, SiglaTur, CapacTur)
VALUES (2024, 'COMP', 101, 'A', 40),
       (2024, 'COMP', 202, 'B', 30),
       (2024, 'ELEC', 301, 'C', 35),
       (2024, 'ELEC', 302, 'D', 30),
       (2024, 'CIVIL', 400, 'E', 45),
       (2024, 'CIVIL', 401, 'F', 35),
       (2024, 'QUIM', 500, 'G', 40),
       (2024, 'QUIM', 501, 'H', 25);

INSERT INTO Predio (CodPred, NomePred)
VALUES (1, 'Bloco A'),
       (2, 'Bloco B'),
       (3, 'Bloco C'),
       (4, 'Biblioteca');

INSERT INTO Sala (CodPred, NumSala, DescricaoSala, CapacSala)
VALUES (1, 101, 'Laboratório de Computação 1', 40),
       (1, 102, 'Sala de Aula 1', 30),
       (1, 201, 'Laboratório de Eletrônica', 35),
       (1, 202, 'Sala de Aula 2', 30),
       (2, 301, 'Sala de Aula 3', 45),
       (2, 302, 'Laboratório de Química', 35),
       (3, 401, 'Auditório', 100),
       (4, 501, 'Sala de Reuniões', 20);

INSERT INTO Horario (AnoSem, CodDepto, NumDisc, SiglaTur, DiaSem, HoraInicio, NumSala, CodPred, NumHoras)
VALUES (2024, 'COMP', 101, 'A', 2, 8, 101, 1, 2),
       (2024, 'COMP', 202, 'B', 4, 10, 202, 1, 2),
       (2024, 'ELEC', 301, 'C', 3, 9, 302, 2, 3),
       (2024, 'ELEC', 302, 'D', 5, 13, 401, 3, 2),
       (2024, 'CIVIL', 400, 'E', 1, 8, 302, 2, 3),
       (2024, 'CIVIL', 401, 'F', 3, 14, 501, 4, 3);

INSERT INTO Titulacao (CodTit, NomeTit)
VALUES (1, 'Professor Doutor'),
       (2, 'Professor Mestre');

INSERT INTO Professor (CodProf, CodDepto, CodTit, NomeProf)
VALUES (1001, 'COMP', 1, 'Dr. João Silva'),
       (1002, 'COMP', 2, 'Dra. Maria Oliveira'),
       (1003, 'ELEC', 1, 'Dr. Pedro Souza'),
       (1004, 'ELEC', 2, 'Dra. Ana Costa'),
       (1005, 'CIVIL', 1, 'Dr. Roberto Santos'),
       (1006, 'CIVIL', 2, 'Dra. Fernanda Lima'),
       (1007, 'QUIM', 1, 'Dr. Carlos Mendes'),
       (1008, 'QUIM', 2, 'Dra. Gabriela Martins');

INSERT INTO ProfTurma (AnoSem, CodDepto, NumDisc, SiglaTur, CodProf)
VALUES (2024, 'COMP', 101, 'A', 1001),
       (2024, 'COMP', 202, 'B', 1002),
       (2024, 'ELEC', 301, 'C', 1003),
       (2024, 'ELEC', 302, 'D', 1004),
       (2024, 'CIVIL', 400, 'E', 1005),
       (2024, 'CIVIL', 401, 'F', 1006),
       (2024, 'QUIM', 500, 'G', 1007),
       (2024, 'QUIM', 501, 'H', 1008);

-- Criar Procedure , usando cursor explicito, para Selecionar a quantidade de disciplinas agrupadas por Departamento.
DELIMITER $$
CREATE OR REPLACE PROCEDURE QtdDisPDep()
BEGIN

	DECLARE quantidade int DEFAULT 0;
    DECLARE departamento CHAR(5);
	DECLARE done INT DEFAULT 0;

	DECLARE C1 CURSOR FOR 
            SELECT CodDepto, COUNT(NumDisc)FROM Disciplina
            GROUP BY CodDepto;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN C1;
	loop_fetch: LOOP
        FETCH C1 INTO departamento, quantidade;
        IF done THEN
            LEAVE loop_fetch;
        END IF;
        SELECT departamento, quantidade;
    END LOOP loop_fetch;
	CLOSE C1;

END $$
DELIMITER ;

CALL QtdDisPDep();