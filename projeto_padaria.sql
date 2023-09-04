-- modelo padaria

-- DROP DATABASE padaria;
CREATE DATABASE IF NOT EXISTS padaria;
USE padaria;

-- Criação da tabela Clientes
CREATE TABLE Clientes (
    idCliente INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    CPF CHAR(14) UNIQUE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    PRIMARY KEY(idCliente)
);

-- Criação da tabela Produtos
CREATE TABLE Produtos (
    idProduto INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Estoque INT,
    PRIMARY KEY(idProduto)
);

-- Criação da tabela Pedidos
CREATE TABLE Pedidos (
    idPedido INT AUTO_INCREMENT,
    idCliente INT,
    DataPedido DATE,
    Total DECIMAL(10, 2),
	PRIMARY KEY(idPedido),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

-- Criação da tabela ItensPedido
CREATE TABLE ItensPedido (
    idItem INT AUTO_INCREMENT,
    idPedido INT,
    idProduto INT,
    Quantidade INT,
    Subtotal DECIMAL(10, 2),
    PRIMARY KEY (idItem),
    CONSTRAINT fk_itenspedido_pedido FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
    CONSTRAINT fk_itenspedido_produto FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

-- Criação da tabela Fornecedores
CREATE TABLE Fornecedores (
    idFornecedor INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    CNPJ CHAR(14) UNIQUE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    PRIMARY KEY (idFornecedor)
);

-- Criação da tabela ProdutosFornecedores
CREATE TABLE ProdutosFornecedores (
    idProdutoFornecedor INT AUTO_INCREMENT,
    idProduto INT,
    idFornecedor INT,
    PrecoCompra DECIMAL(10, 2),
    PRIMARY KEY (idProdutoFornecedor),
    CONSTRAINT fk_pf_produto FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto),
    CONSTRAINT fk_pf_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedores(idFornecedor)
);

-- Criação da tabela ProdutoFeito
CREATE TABLE ProdutoFeito (
    idProdutoFeito INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Estoque INT,
    PRIMARY KEY (idProdutoFeito)
);

-- Criação da tabela ProdutoIngrediente
CREATE TABLE ProdutoIngrediente (
    idProdutoIngrediente INT AUTO_INCREMENT,
    Nome VARCHAR(255),
    Descricao TEXT,
    Preco DECIMAL(10, 2),
    Estoque INT,
    PRIMARY KEY (idProdutoIngrediente)
);

-- Criação da tabela FichaTecnica
CREATE TABLE FichaTecnica (
    idFichaTecnica INT AUTO_INCREMENT,
    idProdutoFeito INT,
    idProdutoIngrediente INT,
    Quantidade DECIMAL(10, 2),
	PRIMARY KEY (idFichaTecnica),
    CONSTRAINT fk_fichatecnica_produtofeito FOREIGN KEY (idProdutoFeito) REFERENCES ProdutoFeito(idProdutoFeito),
    CONSTRAINT fk_fichatecnica_produtoingrediente FOREIGN KEY (idProdutoIngrediente) REFERENCES ProdutoIngrediente(idProdutoIngrediente)
);

-- Tabela ProdutosProdutoFeito
CREATE TABLE ProdutosProdutoFeito (
    idProdutoProdutoFeito INT AUTO_INCREMENT ,
    idProdutoFeito INT,
    idProduto INT,
    PRIMARY KEY(idProdutoProdutoFeito),
    CONSTRAINT fk_ppf_produtofeito FOREIGN KEY (idProdutoFeito) REFERENCES ProdutoFeito(idProdutoFeito),
    CONSTRAINT fk_ppf_produtos FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto)
);

INSERT INTO Clientes (Nome, CPF, Endereco, Telefone) VALUES
    ('João Silva', '123.456.789-10', 'Rua A, 123', '(11) 1234-5678'),
    ('Maria Santos', '987.654.321-00', 'Avenida B, 456', '(22) 5555-5555'),
    ('Pedro Oliveira', '555.555.555-55', 'Rua C, 789', '(33) 7777-7777'),
    ('Ana Souza', '111.222.333-44', 'Avenida D, 1010', '(44) 9999-9999'),
    ('Carlos Pereira', '999.888.777-66', 'Rua E, 222', '(55) 1111-1111');

INSERT INTO Produtos (Nome, Descricao, Preco, Estoque) VALUES
    ('Pão Francês', 'Pão tradicional', 2.50, 100),
    ('Bolo de Chocolate', 'Delicioso bolo de chocolate', 15.00, 20),
    ('Café Expresso', 'Café forte', 3.00, 50),
    ('Croissant', 'Croissant fresco', 2.00, 30),
    ('Torta de Morango', 'Torta com recheio de morango', 18.00, 15);
    
INSERT INTO Pedidos (idCliente, DataPedido, Total) VALUES
    (1, '2023-09-01', 20.50),
    (2, '2023-09-02', 35.00),
    (3, '2023-09-03', 10.00),
    (4, '2023-09-03', 5.00),
    (5, '2023-09-04', 40.00);
    
INSERT INTO ItensPedido (idPedido, idProduto, Quantidade, Subtotal) VALUES
    (1, 1, 5, 12.50),
    (1, 3, 2, 6.00),
    (2, 2, 1, 15.00),
    (3, 4, 3, 6.00),
    (4, 5, 2, 36.00);

INSERT INTO Fornecedores (Nome, CNPJ, Endereco, Telefone) VALUES
    ('Fornecedor A', '12345678901234', 'Rua X, 111', '(11) 1234-5678'),
    ('Fornecedor B', '98765432109876', 'Avenida Y, 222', '(22) 5555-5555'),
    ('Fornecedor C', '55555555555555', 'Rua Z, 333', '(33) 7777-7777'),
    ('Fornecedor D', '11112222333344', 'Avenida W, 444', '(44) 9999-9999'),
    ('Fornecedor E', '99988877766655', 'Rua V, 555', '(55) 1111-1111');

INSERT INTO ProdutosFornecedores (idProduto, idFornecedor, PrecoCompra) VALUES
    (1, 1, 2.00),
    (2, 2, 12.00),
    (3, 3, 2.50),
    (4, 4, 1.80),
    (5, 5, 14.00);
    
INSERT INTO ProdutoFeito (Nome, Descricao, Preco, Estoque) VALUES
    ('Pão de Queijo', 'Deliciosos pães de queijo', 3.00, 50),
    ('Bolo de Morango', 'Bolo de morango fresco', 18.00, 10),
    ('Coxinha', 'Coxinhas recheadas', 2.50, 40),
    ('Pão de Forma', 'Pão de forma tradicional', 2.00, 60),
    ('Torta de Limão', 'Torta com recheio de limão', 20.00, 8);
    
INSERT INTO ProdutoIngrediente (Nome, Descricao, Preco, Estoque) VALUES
    ('Polvilho', 'Polvilho para pão de queijo', 4.00, 100),
    ('Chocolate', 'Chocolate para bolos', 8.00, 50),
    ('Café', 'Café em grãos', 8.50, 80),
    ('Farinha de Trigo', 'Farinha de trigo para coxinhas', 3.00, 120),
    ('Limão', 'Limão fresco', 2.00, 30);

INSERT INTO FichaTecnica (idProdutoFeito, idProdutoIngrediente, Quantidade) VALUES
    (1, 1, 300), 
    (1, 3, 500), 
    (2, 2, 200), 
    (3, 4, 400), 
    (4, 5, 4);   

INSERT INTO FichaTecnica (idProdutoFeito, idProdutoIngrediente, Quantidade) VALUES
    (1, 1, 300), 
    (1, 3, 500), 
    (2, 2, 200), 
    (3, 4, 400), 
    (4, 5, 4),   
    (1, 2, 200), 
    (3, 5, 150), 
    (5, 1, 250), 
    (2, 4, 300), 
    (4, 3, 350); 

-- Contar quantos clientes estão cadastrados:
SELECT COUNT(*) AS TotalClientes FROM Clientes;

-- Descobrir nomes dos produtos feitos e seus ingredientes:
SELECT pf.Nome AS ProdutoFeito, pi.Nome AS Ingrediente FROM ProdutoFeito pf
JOIN FichaTecnica ft ON pf.idProdutoFeito = ft.idProdutoFeito
JOIN ProdutoIngrediente pi ON ft.idProdutoIngrediente = pi.idProdutoIngrediente;

-- Saber quais ingredientes estão repetidos na preparação dos produtos feitos:
SELECT pi.Nome AS Ingrediente, COUNT(ft.idProdutoIngrediente) AS QuantidadeRepetida FROM FichaTecnica ft
JOIN ProdutoIngrediente pi ON ft.idProdutoIngrediente = pi.idProdutoIngrediente
GROUP BY ft.idProdutoIngrediente, pi.Nome
HAVING COUNT(ft.idProdutoIngrediente) > 1;

-- Selecionar o nome dos clientes, o nome dos produtos de cada cliente, a quantidade de produtos comprados e ordenar pelo nome do produto:
SELECT c.Nome AS NomeCliente, p.Nome AS NomeProduto, SUM(ip.Quantidade) AS QuantidadeProdutos FROM Clientes c
JOIN Pedidos pe ON c.idCliente = pe.idCliente
JOIN ItensPedido ip ON pe.idPedido = ip.idPedido
JOIN Produtos p ON ip.idProduto = p.idProduto
GROUP BY c.Nome, p.Nome
ORDER BY p.Nome;

-- Listar o preço de todos os produtos (incluindo produtos feitos) ordenados pelo nome do produto
SELECT 'Produto' AS Tipo, Nome, Preco FROM Produtos
UNION ALL
SELECT 'Produto Feito' AS Tipo, Nome, Preco FROM ProdutoFeito
ORDER BY Nome;






















