BACKUP DATABASE ECOMMERCE
TO DISK = 'C:\SQLECOMMERCE\Backups\EcommerceBackup.bak' -- Indica onde o arquivo será salvo
WITH FORMAT, -- Certifica que o backup seja criado do zero, mesmo que já exista um backup anterior no local
	COMPRESSION,-- Reduz o tamanho do arquivo de backup, economizando espaço em disco
	CHECKSUM, -- Gera um valor de verificação para garantir a integridade do backup, ajudando a detectar corrupção de dados
	STATS = 10, -- Exibe o progresso do backup a cada 10% concluído	
	NAME = 'Full Backup of ECOMMERCE'; -- Dá um nome para o backup, facilitando a identificação em caso de múltiplos backups
GO