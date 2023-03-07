DROP DATABASE IF EXISTS atividade02; -- DDL, comando para remoção
CREATE DATABASE atividade02; -- DDL, comando de definição
USE atividade02;

-- Criando a TABELA clientes - DDL, comando de definição
CREATE TABLE clientes(
id_cliente INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(255) NOT NULL,
whatsapp VARCHAR(255) NOT NULL,
CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);

-- Criando a TABELA servicos - DDL, comando de definição
CREATE TABLE servicos(
id_servicos INT NOT NULL AUTO_INCREMENT,
nome_servico VARCHAR(255) NOT NULL,
valor_servico DECIMAL NOT NULL,
CONSTRAINT servico_pk PRIMARY KEY(id_servicos)
);

-- Criando a TABELA servico_por_cliente - DDL, comando de definição
CREATE TABLE servico_por_cliente(
id_servico_cliente INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_servicos INT NOT NULL,
CONSTRAINT servico_cliente_pk PRIMARY KEY (id_servico_cliente),
CONSTRAINT servico_cliente_cliente_fk FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente),
CONSTRAINT servico_cliente_servicos_fk FOREIGN KEY (id_servicos) REFERENCES servicos (id_servicos)
);

-- Inserindo DADOS na TABELA clientes - DML, comandos de armazenamento 
INSERT INTO clientes (nome, whatsapp) VALUES ('João Marcos',   '44856963412');
INSERT INTO clientes (nome, whatsapp) VALUES ('Luis Felipe',   '44781334989');
INSERT INTO clientes (nome, whatsapp) VALUES ('Gustavo Liu',   '44965875321');
INSERT INTO clientes (nome, whatsapp) VALUES ('Matheus Ramos', '44586523145');
INSERT INTO clientes (nome, whatsapp) VALUES ('Cauê Grande',   '44758521232');

-- Inserindo DADOS na TABELA servicos - DML, comandos de armazenamento 
INSERT INTO servicos (nome_servico, valor_servico) VALUES ('Limpeza interna NoteBook', 50.00);
INSERT INTO servicos (nome_servico, valor_servico) VALUES ('Formatação do Computador', 100.00);
INSERT INTO servicos (nome_servico, valor_servico) VALUES ('Troca de peça queimada', 350.00);
INSERT INTO servicos (nome_servico, valor_servico) VALUES ('Instalação de Internet', 150.00);
INSERT INTO servicos (nome_servico, valor_servico) VALUES ('Montagem do Computador',  85.00);

-- Inserindo DADOS na TABELA servico_por_cliente - DML, comandos de armazenamento 
INSERT INTO servico_por_cliente (id_cliente, id_servicos) VALUES (1,2);
INSERT INTO servico_por_cliente (id_cliente, id_servicos) VALUES (4,3);
INSERT INTO servico_por_cliente (id_cliente, id_servicos) VALUES (3,4);
INSERT INTO servico_por_cliente (id_cliente, id_servicos) VALUES (2,5);
INSERT INTO servico_por_cliente (id_cliente, id_servicos) VALUES (5,1);

-- SELECT com INNER JOIN - DML, comandos de armazenamento 
SELECT c.nome "Nome Cliente", s.nome_servico "Nome Serviço", s.valor_servico "Valor Serviço"
FROM servico_por_cliente sc
INNER JOIN clientes c ON sc.id_cliente = c.id_cliente
INNER JOIN servicos s ON sc.id_servicos = s.id_servicos;

-- ALTER'S - DDL, comandos de modificação
ALTER TABLE clientes ADD cpf VARCHAR(11);
ALTER TABLE servico_por_cliente ADD data_servico DATE;
ALTER TABLE servicos ALTER valor_servico SET DEFAULT 0.0;
ALTER TABLE clientes MODIFY COLUMN whatsapp VARCHAR(16);
