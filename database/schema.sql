-- Arquivo: schema.sql
-- Descrição: Script para criação do banco de dados e tabelas do projeto Sangue Comunidade MS.
-- Autor: [Felipe]
-- Data: 30/09/2025

--- CRIAÇÃO DAS TABELAS ---

-- Tabela: Doadores
-- Armazena as informações pessoais de cada doador.
CREATE TABLE Doadores (
    id_doador INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    tipo_sanguineo VARCHAR(5) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Agendamentos
-- Armazena os agendamentos de doação, relacionando um doador a uma data e local.
CREATE TABLE Agendamentos (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_doador INT NOT NULL,
    data_agendamento DATETIME NOT NULL,
    local_coleta VARCHAR(255) NOT NULL,
    status VARCHAR(50) DEFAULT 'Agendado', -- Ex: Agendado, Realizado, Cancelado
    observacoes TEXT,
    FOREIGN KEY (id_doador) REFERENCES Doadores(id_doador)
);


--- INSERÇÃO DE DADOS DE EXEMPLO ---

-- Inserindo 3 registros na tabela de Doadores
INSERT INTO Doadores (nome_completo, email, telefone, tipo_sanguineo, data_nascimento) VALUES
('João da Silva', 'joao.silva@email.com', '(67) 99999-1111', 'A+', '1990-05-15'),
('Maria Oliveira', 'maria.oliveira@email.com', '(67) 98888-2222', 'O-', '1985-11-20'),
('Carlos Pereira', 'carlos.pereira@email.com', '(67) 97777-3333', 'AB+', '2001-02-10');

-- Inserindo 3 registros na tabela de Agendamentos
-- Note que o id_doador corresponde aos doadores inseridos acima (1=João, 2=Maria, 3=Carlos)
INSERT INTO Agendamentos (id_doador, data_agendamento, local_coleta, status) VALUES
(1, '2025-10-15 09:30:00', 'Hemosul - Campo Grande', 'Agendado'),
(2, '2025-10-18 14:00:00', 'Santa Casa - Campo Grande', 'Agendado'),
(1, '2024-08-22 11:00:00', 'Hemosul - Campo Grande', 'Realizado');

```
