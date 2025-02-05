-- Tabela para Apartamentos
CREATE TABLE apartamentos (
    id INT PRIMARY KEY,
    block INT(10) NOT NULL,
    apartment INT(10) NOT NULL,
    resident VARCHAR(100) NOT NULL,
    telephone VARCHAR(15) NOT NULL,
    email VARCHAR(100)
);

-- Tabela para Veículos
CREATE TABLE veiculos (
    id SERIAL PRIMARY KEY,
    apartamento_id INTEGER REFERENCES APARTMENT(id) ON DELETE CASCADE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    placa VARCHAR(10) NOT NULL UNIQUE
);
