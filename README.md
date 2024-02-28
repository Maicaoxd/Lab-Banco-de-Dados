# Laboratório de Banco de Dados

Conteúdo das aulas e exercícios propostos na matéria Laboratório de Banco de Dados ministrada pelo professor Joilson De Souza Cardoso, cursada no 5º semestre no curso de análise e desenvolvimento de sistemas da Faculdade de Tecnologia da Zona Leste (FATEC-ZL).

# Exercícios propostos

### [PDF](./ANOTAÇÃO%201%20Projeto%20Modelo%20de%20Dados%20CURSO/PDF/Atividade%20-%20Revisao%20SQL%20Basico%20v2.pdf])

## [ANOTAÇÃO 1 Projeto Modelo de Dados CURSO](https://github.com/Maicaoxd/Sistemas-Operacionais-I/tree/main/ExerciciosProcessos) 


### 1.1 Desenho de Modelo de Dados Físico 

![alt text](./ANOTAÇÃO%201%20Projeto%20Modelo%20de%20Dados%20CURSO/Imagens/image.png)

### 1.2 Descrição do Conteúdo das tabelas que serão utilizadas 
Após entender o modelo de dados físico e Criar todas as tabelas, Primary keys e Foreign 
keys, inserir dados nas mesmas de acordo com as definições de conteúdo abaixo, 
utilizando os comandos SQL. 

1) TABELA DE PROFESSORES TB_PROFESSOR 

    ID_PROFESSOR | NOME_PROFESSOR

- JOI JOILSON CARDOSO 
- OSE OSEAS SANTANA 
- VIT VITOR VASCONCELOS 
- FER JOSE ROBERTO FERROLI 
- LIM VALMIR LIMA 
- EDS EDSON SILVA 
- WAG WAGNER OKIDA 

2) TABELA DE ALUNOS TB_ALUNO 

    COD_ALUNO | NOME_ALUNO | END_ALUNO | SIGLA_ESTADO | ID_CLASSE 

- 1 ANTONIO CARLOS PENTEADO RUA X SP  1
- 2 AUROMIR DA SILVA VALDEVINO RUA W SP 1 
- 3 ANDRE COSTA RUA T SP 1 
- 4 ROBERTO SOARES DE MENEZES RUA BW SP 2 
- 5 DANIA RUA CCC SP 2 
- 6 CARLOS MAGALHAES AV SP SP 2 
- 7 MARCELO RAUBA AV SAO LUIS SP 3 
- 8 FERNANDO AV COUNTYR SP 3 
- 9 WALMIR BURIN RUA SSISIS SP 3 
 
3) TABELA DE DICIPLINAS TB_DISCIPLINA 

    ID_DISCIPLINA | NOME_DISCIPLINA | ID_PROFESSOR_DISCIPLINA | NOTA_MINIMA_DISCIPLINA 

- MAT MATEMATICA JOI 7 
- POR PORTUGUES VIT 5 
- FIS FISICA OSE 3 
- HIS HISTORIA EDS 2 
- GEO GEOGRAFIA WAG 4 
- ING INGLES LIM 2 


4) RELACIONAMENTO ALUNO X DISCIPLINA TB_ALUNO_DISCIPLINA 

    COD_ALUNO | ID_DISCIPLINA | NOTA_ALUNO 

- 1 MAT 0 
- 2 MAT 0
- 3 MAT 1
- 4 POR 2
- 5 POR 2
- 6 POR 2
- 7 FIS 3 
- 8 FIS 3 
- 9 FIS 3 
- 1 POR 2 
- 2 POR 2 
- 7 POR 2 
- 1 FIS 3 