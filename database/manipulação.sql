-- Arquivo: manipulacao.sql
-- Descrição: Exemplos de operações de manipulação de dados (DML) para o projeto Sangue Comunidade MS.
-- Autor: [Felipe]
-- Data: 30/09/2025

-- --- OPERAÇÕES DE CONSULTA (SELECT) ---

-- 1. Consultar todos os doadores cadastrados
SELECT * FROM Doadores;

-- 2. Consultar todos os agendamentos, juntando com os nomes dos doadores
SELECT
    Agendamentos.id_agendamento,
    Agendamentos.data_agendamento,
    Agendamentos.local_coleta,
    Agendamentos.status,
    Doadores.nome_completo,
    Doadores.tipo_sanguineo
FROM Agendamentos
JOIN Doadores ON Agendamentos.id_doador = Doadores.id_doador;

-- 3. Consultar doadores do tipo sanguíneo 'O-'
SELECT nome_completo, email, telefone FROM Doadores WHERE tipo_sanguineo = 'O-';


-- --- OPERAÇÃO DE ATUALIZAÇÃO (UPDATE) ---

-- 1. Atualizar o status de um agendamento para 'Realizado'.
-- Vamos supor que o agendamento de Maria Oliveira (id_agendamento = 2) foi concluído.
UPDATE Agendamentos
SET status = 'Realizado'
WHERE id_agendamento = 2;


-- --- OPERAÇÃO DE REMOÇÃO (DELETE) ---

-- 1. Remover um agendamento que foi cancelado.
-- Vamos criar um agendamento para depois removê-lo.
INSERT INTO Agendamentos (id_doador, data_agendamento, local_coleta, status) VALUES
(3, '2025-11-05 10:00:00', 'Hemosul - Dourados', 'Cancelado');

-- Agora, vamos remover o agendamento que acabamos de inserir (cujo status é 'Cancelado').
DELETE FROM Agendamentos
WHERE status = 'Cancelado';

```