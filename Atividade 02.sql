DROP DATABASE IF EXISTS atividade02;
CREATE DATABASE atividade02;
USE atividade02;

CREATE TABLE clientes(
id_cliente INT NOT NULL,
nome VARCHAR(255) NOT NULL,
whatsapp VARCHAR(255) NOT NULL,
CONSTRAINT cliente_PK PRIMARY KEY (id_cliente)
);

CREATE TABLE servicos(
id_servicos INT NOT NULL,
nome_servico VARCHAR(255) NOT NULL,
valor_servico DECIMAL(6,2) NOT NULL,
CONSTRAINT servico_PK PRIMARY KEY(id_servico)
);

CREATE TABLE servico_por_cliente(
id_servico_cliente INT NOT NULL,
id_cliente INT NOT NULL,
id_servicos INT NOT NULL,
CONSTRAINT servico_por_cliente_PK PRIMARY KEY (id_servico_cliente),
CONSTRAINT id_cliente_FK FOREIGN KEY (id_cliente) REFERENCES clientes (id_clientes),
CONSTRAINT id_servico_FK FOREIGN KEY (id_servicos) REFERENCES servicos (id_servicos)
);

-- INSERINDO DADOS NA TABELA CLIENTE - DML, comandos de armazenamento 
INSERT INTO clientes (nome, whatsapp) VALUES ('João Marcos',   '44856963412');
INSERT INTO clientes (nome, whatsapp) VALUES ('Luis Felipe',   '44781334989');
INSERT INTO clientes (nome, whatsapp) VALUES ('Gustavo Liu',   '44965875321');
INSERT INTO clientes (nome, whatsapp) VALUES ('Matheus Ramos', '44586523145');
INSERT INTO clientes (nome, whatsapp) VALUES ('Cauê Grande',   '44758521232');

-- INSERINDO DADOS NA TABELA SERVIÇOS - DML, comandos de armazenamento 
INSERT INTO sevicos (nome_servico, valor_servico) VALUES ('Limpeza interna NoteBook', 50.00);
INSERT INTO sevicos (nome_servico, valor_servico) VALUES ('Formatação do Computador', 100.00);
INSERT INTO sevicos (nome_servico, valor_servico) VALUES ('Troca de peça queimada', 350.00);
INSERT INTO sevicos (nome_servico, valor_servico) VALUES ('Instalação de Internet', 150.00);
INSERT INTO sevicos (nome_servico, valor_servico) VALUES ('Montagem do Computador',  85.00);