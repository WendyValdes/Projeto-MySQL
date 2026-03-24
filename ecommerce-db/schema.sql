-- =========================================
-- CRIAÇÃO DO BANCO
-- =========================================
CREATE DATABASE IF NOT EXISTS ecommerce2;
USE ecommerce2;

-- =========================================
-- CLIENTE
-- =========================================
CREATE TABLE client (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(10),
    Lname VARCHAR(20),
    CPF CHAR(14) UNIQUE,
    Address VARCHAR(100)
);

-- =========================================
-- PRODUTO
-- =========================================
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50),
    Category VARCHAR(20),
    Price FLOAT
);

-- =========================================
-- PEDIDO
-- =========================================
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT,
    OrderStatus VARCHAR(20),
    Payment VARCHAR(20),
    SendValue FLOAT,
    CONSTRAINT fk_order_client FOREIGN KEY (idOrderClient)
        REFERENCES client(idClient)
);

-- =========================================
-- RELAÇÃO PRODUTO-PEDIDO
-- =========================================
CREATE TABLE productorder (
    idPO INT AUTO_INCREMENT PRIMARY KEY,
    idOrder INT,
    idProduct INT,
    Quantity INT,
    CONSTRAINT fk_po_order FOREIGN KEY (idOrder)
        REFERENCES orders(idOrder),
    CONSTRAINT fk_po_product FOREIGN KEY (idProduct)
        REFERENCES product(idProduct)
);

-- =========================================
-- VENDEDOR
-- =========================================
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(50),
    Location VARCHAR(50)
);

-- =========================================
-- FORNECEDOR
-- =========================================
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(50)
);

-- =========================================
-- RELAÇÃO PRODUTO-VENDEDOR
-- =========================================
CREATE TABLE productseller (
    idSeller INT,
    idProduct INT,
    PRIMARY KEY (idSeller, idProduct),
    FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
    FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- =========================================
-- RELAÇÃO PRODUTO-FORNECEDOR
-- =========================================
CREATE TABLE productsupplier (
    idSupplier INT,
    idProduct INT,
    PRIMARY KEY (idSupplier, idProduct),
    FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier),
    FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);