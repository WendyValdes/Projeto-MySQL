USE ecommerce2;

DELIMITER $$

CREATE PROCEDURE sp_create_order (
    IN p_idClient INT,
    IN p_idProduct INT,
    IN p_quantity INT
)
BEGIN

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO orders (idOrderClient, OrderStatus, Payment, SendValue)
    VALUES (p_idClient, 'Em processamento', 'Cartão', 20.00);

    SAVEPOINT before_item;

    INSERT INTO productorder (idOrder, idProduct, Quantity)
    VALUES (LAST_INSERT_ID(), p_idProduct, p_quantity);

    IF p_quantity <= 0 THEN
        ROLLBACK TO before_item;
    END IF;

    COMMIT;

END $$

DELIMITER ;

CALL sp_create_order(1, 1, 2);