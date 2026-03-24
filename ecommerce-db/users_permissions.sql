USE ecommerce2;

CREATE USER 'gerente'@'localhost' IDENTIFIED BY '123456';

GRANT SELECT ON ecommerce2.vw_products_sellers TO 'gerente'@'localhost';
GRANT SELECT ON ecommerce2.vw_products_suppliers TO 'gerente'@'localhost';

CREATE USER 'seller_user'@'localhost' IDENTIFIED BY '123456';

GRANT SELECT ON ecommerce2.product TO 'seller_user'@'localhost';