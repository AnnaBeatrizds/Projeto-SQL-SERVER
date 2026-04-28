#  Projeto SQL Server - E-Commerce

Este repositório contém um projeto prático de banco de dados focado na estruturação, administração e otimização do back-end de um e-commerce de moda. O laboratório foi desenvolvido para estruturar um portfólio sólido na área de dados, demonstrando habilidades fundamentais que vão desde a modelagem até o performance tuning.

##  Objetivo do Projeto
Demonstrar a implementação completa de um banco de dados relacional com SQL Server. O projeto engloba a criação da arquitetura de tabelas, aplicação de regras de negócio em SQL, gerenciamento de permissões de usuários, melhoria de performance de buscas e simulação de cenários de recuperação de desastres (Disaster Recovery).

##  Estrutura e Ordem de Execução

Abaixo estão os scripts desenvolvidos e o que cada um executa no projeto:

* **`1. CriandoDatabase.sql`**: Este script cria o banco de dados `ECOMMERCE` e define as especificações de tamanho dos arquivos `.mdf` e `.ldf`. Ele também estrutura as tabelas `CLIENTES`, `PEDIDOS`, `CATEGORIAS`, `PRODUTOS` e `ITENS_PEDIDO` com suas chaves primárias e estrangeiras.
* **`2. InserindoRegistros.sql`**: Este arquivo insere dados nas tabelas `CATEGORIAS` e `CLIENTES`. O script também popula `PRODUTOS`, `PEDIDOS` e `ITENS_PEDIDO` para simular as transações diárias da loja.
* **`3. CriandoLogins.sql`**: O script cria três perfis de acesso: `DBA_Anna`, `App_Ecommerce` e `Analista_Dados`. Ele define a permissão total para a DBA, acesso de leitura e escrita para o App, e apenas permissão de leitura para a função de analista.
* **`4. TestandoPerfilAnalista.sql` e `TestandoPerfilApp.sql`**: O primeiro arquivo testa se o `Analista_Dados` consegue ler dados, enquanto atesta que comandos de deleção são bloqueados pelo SQL Server. O segundo verifica se o `App_Ecommerce` pode inserir e atualizar valores, validando que ele não possui permissões destrutivas como o `DROP`.
* **`5. CriandoIndices.sql`**: Este script gera uma massa de 1.000 registros com um loop `WHILE` para simular escalabilidade de clientes. Em seguida, cria um índice não-clusterizado e um índice de cobertura (*Covering Index*) para a coluna de e-mail, reduzindo drasticamente o esforço de I/O em logins de usuários.
* **`6. CriandoBackupFull.sql`**: O script executa a criação de um backup total da base. Ele emprega parâmetros avançados como `COMPRESSION` e `CHECKSUM` para economizar espaço em disco e garantir a integridade contra corrupção de dados.
* **`7. TestandoBackupFull.sql`**: O arquivo realiza um teste prático simulando a exclusão acidental de uma tabela (`DROP TABLE`) e, em seguida, a restauração (*restore*) completa do banco. O processo demonstra o uso do modo `SINGLE_USER` para desconectar usuários ativos antes de restaurar os dados com segurança.

##  Tecnologias e Conceitos Aplicados
* **SGBD**: SQL Server
* **Linguagem**: T-SQL
* **Conceitos Práticos**: 
  * DDL (Data Definition Language)
  * DML (Data Manipulation Language)
  * DCL (Data Control Language) e Gestão de Permissões (Roles)
  * Performance Tuning (Indexação Avançada e Planos de Execução)
  * Administração de BD (Backup, Restore e Segurança)

##  Autora
**Anna Beatriz**
