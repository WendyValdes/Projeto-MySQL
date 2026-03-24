USE ecommerce2;

-- Histórico de clientes deletados
CREATE TABLE deleted_clients (
    idClient INT,
    Fname VARCHAR(10),
    Lname VARCHAR(20),
    CPF CHAR(14),
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER before_client_delete
BEFORE DELETE ON client
FOR EACH ROW
BEGIN
    INSERT INTO deleted_clients(idClient, Fname, Lname, CPF)
    VALUES (OLD.idClient, OLD.Fname, OLD.Lname, OLD.CPF);
END $$

DELIMITER ;

-- Log de preços
CREATE TABLE product_price_log (
    idProduct INT,
    old_price FLOAT,
    new_price FLOAT,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER before_product_update
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    IF OLD.Price <> NEW.Price THEN
        INSERT INTO product_price_log(idProduct, old_price, new_price)
        VALUES (OLD.idProduct, OLD.Price, NEW.Price);
    END IF;
END $$

DELIMITER ;