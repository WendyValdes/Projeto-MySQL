USE ecommerce2;

CREATE VIEW vw_products_sellers AS
SELECT 
    s.idSeller,
    s.SocialName AS seller_name,
    s.Location,
    p.idProduct,
    p.Pname,
    p.Category,
    p.Price
FROM seller s
JOIN productseller ps ON s.idSeller = ps.idSeller
JOIN product p ON ps.idProduct = p.idProduct;

CREATE VIEW vw_products_suppliers AS
SELECT 
    sup.idSupplier,
    sup.SocialName AS supplier_name,
    p.idProduct,
    p.Pname,
    p.Category,
    p.Price
FROM supplier sup
JOIN productsupplier ps ON sup.idSupplier = ps.idSupplier
JOIN product p ON ps.idProduct = p.idProduct;

CREATE VIEW vw_orders_clients AS
SELECT 
    c.idClient,
    c.Fname,
    c.Lname,
    o.idOrder,
    o.OrderStatus,
    o.Payment,
    o.SendValue
FROM client c
JOIN orders o ON c.idClient = o.idOrderClient;