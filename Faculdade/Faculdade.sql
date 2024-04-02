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