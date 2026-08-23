DROP TABLE IF EXISTS itens_venda, vendas, produtos, vendedores, clientes CASCADE;

CREATE TABLE clientes (
    id_cliente INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    estado CHAR(2) NOT NULL,
    segmento VARCHAR(30) NOT NULL,
    data_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
    id_produto INTEGER PRIMARY KEY,
    produto VARCHAR(120) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    custo NUMERIC(12,2) NOT NULL CHECK (custo >= 0),
    preco NUMERIC(12,2) NOT NULL CHECK (preco >= custo)
);

CREATE TABLE vendedores (
    id_vendedor INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    equipe VARCHAR(50) NOT NULL
);

CREATE TABLE vendas (
    id_venda INTEGER PRIMARY KEY,
    id_cliente INTEGER NOT NULL REFERENCES clientes(id_cliente),
    id_vendedor INTEGER NOT NULL REFERENCES vendedores(id_vendedor),
    data_venda DATE NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE itens_venda (
    id_item INTEGER PRIMARY KEY,
    id_venda INTEGER NOT NULL REFERENCES vendas(id_venda),
    id_produto INTEGER NOT NULL REFERENCES produtos(id_produto),
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(12,2) NOT NULL CHECK (preco_unitario >= 0),
    desconto NUMERIC(12,2) NOT NULL DEFAULT 0 CHECK (desconto >= 0)
);

CREATE INDEX idx_vendas_data ON vendas(data_venda);
CREATE INDEX idx_vendas_cliente ON vendas(id_cliente);
CREATE INDEX idx_vendas_vendedor ON vendas(id_vendedor);
CREATE INDEX idx_itens_venda ON itens_venda(id_venda);
CREATE INDEX idx_itens_produto ON itens_venda(id_produto);
