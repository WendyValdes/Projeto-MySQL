USE ecommerce2;

SET autocommit = 0;

START TRANSACTION;

INSERT INTO orders (idOrderClient, OrderStatus, Payment, SendValue)
VALUES (1, 'Em processamento', 'Cartão', 15.00);

INSERT INTO productorder (idOrder, idProduct, Quantity)
VALUES (LAST_INSERT_ID(), 1, 2);

UPDATE product
SET Price = Price - 10
WHERE idProduct = 1;

COMMIT;