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
    (43424, 202, 'Sala de aula 2', 25);

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


-- Criar trigger para registrar um LOG das atualizações das Tabela Professor. No Log deve existir:

--           1-  código do usuário que fez a alteração;
--           2-  chave primaria do registro alterado;
--           3-  Tipo de alteração realizado (INSERT ou UPDATE ou DELETE);
--           4-  Data e Hora da alteração.

-- Entregar a estrutura da Tabela de LOG ( pode ser chamada Tabela_Log_Professor ) ;

-- e o Código da(s) Trigger(s).

-- para selecionar o usuario corrente no mysql
-- SELECT CURRENT_USER();

CREATE TABLE Tabela_Log_Professor (
    idLogProf int AUTO_INCREMENT PRIMARY KEY,
    codUsuario char(80),
    CodProf int,
    tpAlteracao VARCHAR(20),
    dtAlteracao DateTime
);

ALTER TABLE Tabela_Log_Professor
ADD CONSTRAINT fk_Log_Professor_Professor
FOREIGN KEY (CodProf) REFERENCES Professor (CodProf);

DELIMITER $$
CREATE OR REPLACE PROCEDURE insertLog(IN codUsuario char(80), IN CodProf int, IN tpAlteracao VARCHAR(20), IN dtAlteracao DateTime)
BEGIN

INSERT INTO Tabela_Log_Professor (codUsuario, CodProf, tpAlteracao, dtAlteracao)
VALUES (codUsuario, CodProf, tpAlteracao, dtAlteracao);

END $$

CREATE TRIGGER triggerLogUpdate
AFTER UPDATE ON Professor
FOR EACH ROW
BEGIN

    CALL insertLog(CURRENT_USER(), NEW.CodProf, 'UPDATE', NOW());

END $$

CREATE TRIGGER triggerLogInsert
AFTER INSERT ON Professor
FOR EACH ROW
BEGIN

    CALL insertLog(CURRENT_USER(), NEW.CodProf, 'INSERT', NOW());

END $$

CREATE TRIGGER triggerLogDelete
AFTER DELETE ON Professor
FOR EACH ROW
BEGIN

    CALL insertLog(CURRENT_USER(), OLD.CodProf, 'DELETE', NOW());

END $$

DELIMITER ;

INSERT into professor (CodProf, CodDepto, CodTit, NomeProf) 
VALUES (4, 'INF01', 2, 'Satoshi');

UPDATE professor set nomeprof = 'Joilson' where codProf = 4;

SET FOREIGN_KEY_CHECKS = 0;

DELETE from professor where codProf = 4;

SET FOREIGN_KEY_CHECKS = 1;

SELECT * FROM Tabela_Log_Professor;
