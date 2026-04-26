CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL
);

CREATE TABLE CLIENTE_PF (
    id_cliente INT PRIMARY KEY,
    cpf CHAR(11) NOT NULL UNIQUE,
    CONSTRAINT fk_pf FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE CLIENTE_PJ (
    id_cliente INT PRIMARY KEY,
    cnpj CHAR(14) NOT NULL UNIQUE,
    razao_social VARCHAR(150) NOT NULL,
    CONSTRAINT fk_pj FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE PEDIDO (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    status_pedido VARCHAR(50) DEFAULT 'Processando',
    frete DECIMAL(10,2),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ENTREGA (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    status_entrega ENUM('Postado', 'Em trânsito', 'Entregue'),
    codigo_rastreio VARCHAR(50),
    CONSTRAINT fk_entrega_pedido FOREIGN KEY (id_pedido) REFERENCES PEDIDO(id_pedido)
);