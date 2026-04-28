-- PARTE 5: PERFORMANCE E TUNING
-- Objetivo: Otimizar buscas e reduzir esforço de I/O

-- 1 Gerando Massa de Dados (Simulação de Escalabilidade)
DECLARE @Contador INT = 1;

WHILE @Contador <= 1000
BEGIN
    INSERT INTO CLIENTES (CPF, Nome, Sobrenome, Email, Telefone, Cidade, Bairro, Logradouro, Numero, CEP)
    VALUES (
        CAST(10000000000 + @Contador AS VARCHAR(11)), -- CPF fictício
        'Cliente' + CAST(@Contador AS VARCHAR),
        'Sobrenome' + CAST(@Contador AS VARCHAR),
        'cliente' + CAST(@Contador AS VARCHAR) + '@teste.com',
        '1399999' + CAST(@Contador AS VARCHAR),
        'Praia Grande',
        'Bairro ' + CAST(@Contador AS VARCHAR),
        'Rua ' + CAST(@Contador AS VARCHAR),
        @Contador,
        '11700000'
    );
    SET @Contador = @Contador + 1;
END;
GO

SELECT * FROM CLIENTES;


-- 2. Teste de Busca sem Índice (Verifique o Plano de Execução - Ctrl+M)
-- Resultado esperado: Clustered Index Scan (Leitura completa da tabela)
SELECT * FROM CLIENTES WHERE Email = 'cliente500@teste.com';
GO


-- 3.1 Criando Índice Não-Clusterizado (O "Atalho")
/*
Por que criamos um Índice Não-Clusterizado para o Email?

Em um e-commerce, o cliente quase nunca decora o seu ID, mas ele sempre 
sabe o seu E-mail para fazer login. Como já usamos nossa "única vaga" de
índice clusterizado na PK, precisamos de uma alternativa para acelerar a
busca por e-mail. Então, criamos um Índice Não-Clusterizado, para suportar o
processo de login, que é a busca mais frequente.
*/

CREATE INDEX idx_clientes_email ON CLIENTES (Email);
GO

-- 3.2 Evolução: Índice de Cobertura (Covering Index)
/*
Por que evoluímos para um Índice de Cobertura (com INCLUDE)?

Percebemos no Plano de Execução que, mesmo achando o e-mail no
índice, o SQL ainda precisava "ir até a tabela principal" buscar
o Nome e o Telefone (o famoso Key Lookup). Isso gerava duas viagens de leitura.

Ao usar o INCLUDE (Nome, Telefone), guardamos esses dados dentro do próprio mapa de e-mail.
*/

CREATE INDEX idx_clientes_email_coberto 
ON CLIENTES (Email) 
INCLUDE (Nome, Sobrenome, Telefone);
GO

-- 4.1 Teste de Busca com Índice (Verifique o Plano de Execução - Ctrl+M)
-- Resultado esperado: Index Seek (Busca direta e eficiente)
SELECT Nome, Sobrenome, Telefone FROM CLIENTES WHERE Email = 'exp500@teste.com';
GO
