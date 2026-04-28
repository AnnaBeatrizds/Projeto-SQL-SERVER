USE ECOMMERCE;
GO

-- 1. POPULANDO CATEGORIAS
INSERT INTO CATEGORIAS (NomeCategoria) VALUES 
('Moda Feminina'), ('Moda Masculina'), ('Calçados'), ('Acessórios'), ('Moda Praia');
GO

-- 2. POPULANDO CLIENTES
INSERT INTO CLIENTES (CPF, Nome, Sobrenome, Email, Telefone, CIDADE, BAIRRO, LOGRADOURO, NUMERO, CEP) VALUES
('11122233344', 'Anna', 'Beatriz', 'anna.be@email.com', '13991234567', 'Praia Grande', 'Canto do Forte', 'Av. Marechal Mallet', '100', '11700-010'),
('22233344455', 'Carlos', 'Silva', 'carlos.silva@email.com', '11988887777', 'São Paulo', 'Itaim Bibi', 'Rua Tabapuã', '500', '04533-000'),
('33344455566', 'Juliana', 'Mendes', 'ju.mendes@email.com', '21977776666', 'Rio de Janeiro', 'Copacabana', 'Av. Atlântica', '1010', '22070-000'),
('44455566677', 'Ricardo', 'Oliveira', 'ric.oli@email.com', '31966665555', 'Belo Horizonte', 'Savassi', 'Rua Pernambuco', '25', '30130-150'),
('55566677788', 'Fernanda', 'Costa', 'fe.costa@email.com', '13992223333', 'Praia Grande', 'Boqueirão', 'Av. Costa e Silva', '200', '11700-020'),
('66677788899', 'Lucas', 'Santos', 'lucas.santos@email.com', '11955554444', 'Santos', 'Gonzaga', 'Av. Ana Costa', '450', '11060-001'),
('77788899900', 'Mariana', 'Rocha', 'mari.rocha@email.com', '19944443333', 'Campinas', 'Cambuí', 'Rua Coronel Silva Teles', '88', '13024-000'),
('88899900011', 'Rafael', 'Almeida', 'rafa.almeida@email.com', '11933332222', 'São Caetano do Sul', 'Santa Paula', 'Rua Tiradentes', '12', '09541-000'),
('99900011122', 'Beatriz', 'Nunes', 'bia.nunes@email.com', '13988776655', 'São Vicente', 'Itararé', 'Av. Ayrton Senna', '1500', '11320-000'),
('00011122233', 'Thiago', 'Souza', 'thiago.souza@email.com', '11922221111', 'São Paulo', 'Moema', 'Av. Ibirapuera', '2100', '04028-002');
GO

-- 3. POPULANDO PRODUTOS
INSERT INTO PRODUTOS (IdCategoria, NomeProduto, Preco, Estoque) VALUES
(1, 'Vestido Midi Floral', 159.90, 20),
(1, 'Blusa de Seda Branca', 89.90, 15),
(1, 'Saia Plissada Midi', 120.00, 10),
(2, 'Camisa Polo Azul', 79.90, 30),
(2, 'Calça Jeans Masculina Slim', 149.90, 25),
(2, 'Bermuda Sarja Bege', 95.00, 12),
(3, 'Tênis Casual Branco', 189.00, 8),
(3, 'Sandália Rasteira Couro', 110.00, 18),
(3, 'Sapato Social Preto', 220.00, 5),
(4, 'Bolsa Transversal Couro', 250.00, 7),
(4, 'Cinto Feminino Strass', 45.00, 40),
(4, 'Relógio Digital Minimalista', 310.00, 3),
(5, 'Biquíni Cintura Alta', 135.00, 22),
(5, 'Saída de Praia Renda', 98.00, 14),
(5, 'Sunga Boxer Estampada', 65.00, 19);
GO

-- 4. POPULANDO PEDIDOS
INSERT INTO PEDIDOS (CPF, Status, Data, ValorTotal) VALUES
('11122233344', 'Pago', '2026-04-01 10:30:00', 319.80),
('22233344455', 'Pendente', '2026-04-02 14:15:00', 79.90),
('33344455566', 'Pago', '2026-04-03 09:00:00', 439.00),
('44455566677', 'Cancelado', '2026-04-03 16:45:00', 45.00),
('11122233344', 'Pago', '2026-04-05 11:20:00', 120.00),
('55566677788', 'Pendente', '2026-04-06 18:00:00', 233.00),
('66677788899', 'Pago', '2026-04-07 13:10:00', 189.00),
('77788899900', 'Pago', '2026-04-08 10:00:00', 250.00),
('88899900011', 'Cancelado', '2026-04-09 20:30:00', 110.00),
('99900011122', 'Pago', '2026-04-10 15:00:00', 65.00);
GO

-- 5. POPULANDO ITENS DO PEDIDO (A ponte entre pedidos e produtos)
-- Aqui usamos os Ids gerados a cima(assumindo que começaram em 1)
INSERT INTO ITENS_PEDIDO (IdPedido, IdProduto, Quantidade, PrecoUnitarioProduto) VALUES
(1, 1, 2, 159.90), -- Pedido 1: 2 Vestidos
(2, 4, 1, 79.90),  -- Pedido 2: 1 Camisa Polo
(3, 7, 1, 189.00), -- Pedido 3: 1 Tênis + 1 Bolsa
(3, 10, 1, 250.00),
(4, 11, 1, 45.00),  -- Pedido 4: 1 Cinto
(5, 3, 1, 120.00), -- Pedido 5: 1 Saia
(6, 13, 1, 135.00), -- Pedido 6: 1 Biquíni + 1 Saída
(6, 14, 1, 98.00),
(7, 7, 1, 189.00), -- Pedido 7: 1 Tênis
(8, 10, 1, 250.00),-- Pedido 8: 1 Bolsa
(10, 15, 1, 65.00); -- Pedido 10: 1 Sunga


SELECT * FROM CATEGORIAS;
SELECT * FROM CLIENTES;
SELECT * FROM PRODUTOS;
SELECT * FROM PEDIDOS;
SELECT * FROM ITENS_PEDIDO;

