-- Criando logins

-- DBA COM ACESSO TOTAL
CREATE LOGIN DBA_Anna WITH PASSWORD = 'SenhaForteDBA123'
CREATE USER DBA_Anna FOR LOGIN DBA_Anna;
--Atribuindo permissão total
ALTER ROLE db_owner ADD MEMBER DBA_Anna;
GO

-- PERFIL PARA LEITURA E ESCRITA
CREATE LOGIN App_Ecommerce WITH PASSWORD = 'SenhaApp_789!';
CREATE USER App_Ecommerce FOR LOGIN App_Ecommerce;
-- leitura
ALTER ROLE db_datareader ADD MEMBER App_Ecommerce;
-- escrita
ALTER ROLE db_datawriter ADD MEMBER App_Ecommerce;
GO

-- PERFIL DE ANALISTA
CREATE LOGIN Analista_Dados WITH PASSWORD = 'SenhaAnalista_456!'
CREATE USER Analista_Dados FOR LOGIN Analista_Dados;
-- apenas leitura
ALTER ROLE db_datareader ADD MEMBER Analista_Dados;
GO

USE ECOMMERCE;
SELECT 
    role.name AS Perfil, 
    member.name AS Usuario
FROM sys.database_role_members AS rm
JOIN sys.database_principals AS role ON rm.role_principal_id = role.principal_id
JOIN sys.database_principals AS member ON rm.member_principal_id = member.principal_id
WHERE member.name IN ('App_Ecommerce', 'Analista_Dados');