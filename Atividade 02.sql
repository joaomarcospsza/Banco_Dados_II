DROP DATABASE IF EXISTS atividade03;
CREATE DATABASE atividade03;
USE atividade03;

CREATE TABLE alunos(
id_aluno INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(150) NOT NULL,
endereco VARCHAR(150) NOT NULL,
cidade VARCHAR(150) NOT NULL,
CONSTRAINT pk_aluno PRIMARY KEY (id_aluno)
);

CREATE TABLE disciplinas(
id_disciplinas INT NOT NULL AUTO_INCREMENT,
cod_disc INT NOT NULL,
nome_disc VARCHAR(150) NOT NULL,
cargo_hor INT NOT NULL,
CONSTRAINT pk_disciplinas PRIMARY KEY (id_disciplinas)
);

CREATE TABLE professor(
id_professor INT NOT NULL AUTO_INCREMENT,
cod_prof INT NOT NULL,
nome VARCHAR(150) NOT NULL,
endereco VARCHAR(150) NOT NULL,
cidade VARCHAR(150) NOT NULL,
CONSTRAINT pk_professor PRIMARY KEY (id_professor)
);

CREATE TABLE turma(
id_turma INT NOT NULL AUTO_INCREMENT,
id_cod_disc INT NOT NULL,
id_cod_prof INT NOT NULL,
horario DATETIME NOT NULL,
CONSTRAINT pk_turma PRIMARY KEY (id_turma),
CONSTRAINT fk_turma_cod_disc FOREIGN KEY (id_cod_disc) REFERENCES disciplinas (id_disciplinas),
CONSTRAINT fk_turma_cod_prof FOREIGN KEY (id_cod_prof) REFERENCES professor (id_professor)
);

CREATE TABLE historico(
id_historico INT NOT NULL AUTO_INCREMENT,
frequencia INT NOT NULL,
nota INT NOT NULL,
id_mat INT NOT NULL,
id_cod_disc INT NOT NULL,
id_cod_turma INT NOT NULL,
id_cod_prof INT NOT NULL,
CONSTRAINT pk_historico PRIMARY KEY (id_historico),
CONSTRAINT fk_historico_mat FOREIGN KEY (id_mat) REFERENCES alunos (id_aluno),
CONSTRAINT fk_historico_cod_disc FOREIGN KEY (id_cod_disc) REFERENCES disciplinas (id_disciplinas),
CONSTRAINT fk_historico_cod_turma FOREIGN KEY (id_cod_turma) REFERENCES turma (id_turma),
CONSTRAINT fk_historico_cod_prof FOREIGN KEY (id_cod_prof) REFERENCES professor (id_professor)
);