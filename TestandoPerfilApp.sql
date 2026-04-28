-- Testando as permissões do usuario App_Ecommerce
INSERT INTO CATEGORIAS (NomeCategoria) VALUES ('Acessórios Premium') -- Deve funcionar e cadastrar um nova categoria.
UPDATE PRODUTOS SET Preco = 199.90 WHERE IdProduto = 1;-- O app precisa conseguir atualizar preços.
DROP TABLE CLIENTES; -- O app NUNCA deve ter permissão para apagar uma tabela.