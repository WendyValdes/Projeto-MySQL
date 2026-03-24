USE ecommerce2;

-- Clientes
INSERT INTO client (Fname, Lname, CPF, Address) VALUES
('Ana', 'Silva', '123.456.789-00', 'Rua A'),
('Carlos', 'Souza', '987.654.321-00', 'Rua B');

-- Produtos
INSERT INTO product (Pname, Category, Price) VALUES
('Notebook', 'Eletrônico', 3000),
('Mouse', 'Acessório', 50);

-- Vendedores
INSERT INTO seller (SocialName, Location) VALUES
('Loja Tech', 'SP'),
('Info Store', 'RJ');

-- Fornecedores
INSERT INTO supplier (SocialName) VALUES
('Fornecedor A'),
('Fornecedor B');

-- Relações
INSERT INTO productseller VALUES (1,1),(2,2);
INSERT INTO productsupplier VALUES (1,1),(2,2);