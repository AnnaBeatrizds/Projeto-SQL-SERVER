--TESTANTANDO BACKUP FULL
-- Apagando tabela 
DROP TABLE ITENS_PEDIDO;

USE master; -- Mudando de banco, pois não podemos restaurar o banco se estiver "dentro" dele
GO

-- SET SINGLE_USER: Se tiver um sistema ou outra aba do SSMS conectada ao banco, o RESTORE vai falhar
-- Então esse comando "expulsa" todo mundo do banco, e deixa ele em modo de usuário único, para que o RESTORE possa ser feito sem problemas
ALTER DATABASE ECOMMERCE SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

-- 2. O comando de Restore propriamente dito
RESTORE DATABASE ECOMMERCE
FROM DISK = 'C:\SQLECOMMERCE\Backups\EcommerceBackup.bak' 
WITH REPLACE, -- Avisa que pode sobrescrever o banco atual
     RECOVERY, -- Deixa o banco online e pronto para uso após terminar
     STATS = 10;
GO

ALTER DATABASE ECOMMERCE SET MULTI_USER;
GO

-- Verificando se os dados foram restaurados corretamente
USE ECOMMERCE;
SELECT * FROM ITENS_PEDIDO; 