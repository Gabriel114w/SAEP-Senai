-- SGBD Escolhido: PostgreSQL

-- 3. Script SQL de Criação e População

-- 1. Cria o banco translog_db (Se o SGBD permitir, caso contrário, deve ser criado manualmente)
-- Comando para criar o banco de dados (executar fora de um banco de dados existente, ou em um cliente como psql)
-- CREATE DATABASE translog_db;
-- \c translog_db; -- Conecta ao novo banco de dados

-- 2. Cria as tabelas principais

-- Tabela USUARIO
CREATE TABLE USUARIO (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL, -- Em um sistema real, a senha seria um hash
    perfil VARCHAR(20) NOT NULL CHECK (perfil IN ('Admin', 'Mecanico', 'Motorista'))
);

-- Tabela VEICULO
CREATE TABLE VEICULO (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    quilometragem_atual INT NOT NULL,
    km_proxima_revisao INT NOT NULL
);

-- Tabela MANUTENCAO
CREATE TABLE MANUTENCAO (
    id_manutencao SERIAL PRIMARY KEY,
    id_veiculo INT NOT NULL REFERENCES VEICULO(id_veiculo),
    id_mecanico INT NOT NULL REFERENCES USUARIO(id_usuario),
    data_manutencao DATE NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('Preventiva', 'Corretiva')),
    descricao TEXT NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    km_manutencao INT NOT NULL
);

-- Tabela ALERTA
CREATE TABLE ALERTA (
    id_alerta SERIAL PRIMARY KEY,
    id_veiculo INT NOT NULL REFERENCES VEICULO(id_veiculo),
    tipo_alerta VARCHAR(50) NOT NULL,
    mensagem VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) NOT NULL CHECK (status IN ('Ativo', 'Resolvido'))
);

-- 3. Insere ao menos 3 registros por tabela

-- Inserindo dados na tabela USUARIO
INSERT INTO USUARIO (nome, email, senha, perfil) VALUES
('Admin Geral', 'admin@translog.com', 'hash_admin123', 'Admin'),
('João Mecânico', 'joao.mecanico@translog.com', 'hash_mecanico456', 'Mecanico'),
('Maria Motorista', 'maria.motorista@translog.com', 'hash_motorista789', 'Motorista'),
('Pedro Mecânico', 'pedro.mecanico@translog.com', 'hash_mecanico000', 'Mecanico');

-- Inserindo dados na tabela VEICULO
INSERT INTO VEICULO (placa, marca, modelo, ano, quilometragem_atual, km_proxima_revisao) VALUES
('ABC1234', 'Volvo', 'FH 540', 2022, 55000, 60000),
('XYZ5678', 'Scania', 'R 450', 2021, 105000, 110000),
('DEF9012', 'Mercedes-Benz', 'Actros 2651', 2023, 1500, 10000);

-- Inserindo dados na tabela MANUTENCAO
-- id_veiculo 1 (ABC1234), id_mecanico 2 (João Mecânico)
INSERT INTO MANUTENCAO (id_veiculo, id_mecanico, data_manutencao, tipo, descricao, custo, km_manutencao) VALUES
(1, 2, '2024-10-01', 'Preventiva', 'Troca de óleo e filtros (50.000 km)', 1500.00, 50000),
(2, 4, '2024-09-15', 'Corretiva', 'Reparo no sistema de freios traseiro', 3200.50, 102000),
(1, 2, '2024-10-20', 'Corretiva', 'Substituição de lâmpada do farol direito', 150.00, 53000);

-- Inserindo dados na tabela ALERTA
-- id_veiculo 1 (ABC1234) - Próximo da revisão
INSERT INTO ALERTA (id_veiculo, tipo_alerta, mensagem, status) VALUES
(1, 'Próxima Revisão', 'Veículo ABC1234 está a 5000 km da revisão de 60.000 km.', 'Ativo'),
(2, 'Próxima Revisão', 'Veículo XYZ5678 está a 5000 km da revisão de 110.000 km.', 'Ativo'),
(3, 'Novo Veículo', 'Veículo DEF9012 cadastrado. Agendar primeira revisão.', 'Resolvido');
