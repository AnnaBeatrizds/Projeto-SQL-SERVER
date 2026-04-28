-- NOsql Server, um banco de dados é como um livro: ele tem o conteúdo(Dados) e um índice de quem editou o que(Log).
CREATE DATABASE ECOMMERCE
ON PRIMARY ( -- É onde guardamos os dados de verdade
	NAME = 'Ecommerce_Data', -- É o apelido interno que o computador dá para esse banco
	FILENAME = 'C:\SQLECOMMERCE\EcommerceData.mdf', -- É o endereço de onde está esse arquivo no HD do computador.
	SIZE = 10MB, -- É o tamanho que o banco nasce
	MAXSIZE = 100MB, -- É o tamanho máximo, o banco só pode crescer até 100MB, se chegar, ele para.
	FILEGROWTH = 5MB -- Quando o banco exceder o seu limite, ele expande de 5 em 5 mb.
)
-- Tudo que colocamos ou tiramos do banco, é guardado no log. Se acontecer algum problema, ele nos ajuda a saber exatamente o que estava acontecendo para nada se perder
LOG ON (
    NAME = 'Ecommerce_Log', -- Nome do arquivo log
    FILENAME = 'C:\SQLECOMMERCE\Ecommerce_Log.ldf', --
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);

USE ECOMMERCE;

CREATE TABLE CLIENTES (
CPF VARCHAR(11) PRIMARY KEY, 
Nome VARCHAR(50) NOT NULL,
Sobrenome VARCHAR(50) NOT NULL,
Email VARCHAR(150) NOT NULL,
Telefone VARCHAR(15) NOT NULL,
CIDADE VARCHAR(50) NOT NULL,
BAIRRO VARCHAR(50) NOT NULL,
LOGRADOURO VARCHAR(100) NOT NULL,
NUMERO VARCHAR(10) NOT NULL,
CEP VARCHAR(10) NOT NULL
);

CREATE TABLE PEDIDOS (
IdPedido INT PRIMARY KEY IDENTITY(1,1),
CPF VARCHAR(11) NOT NULL,
Status VARCHAR(20) NOT NULL,
Data DATETIME DEFAULT GETDATE(), -- Caso a data não seja informada, o banco vai colocar a data atual
ValorTotal DECIMAL(10, 2) NOT NULL,
CONSTRAINT fk_cpfcliente FOREIGN KEY (CPF)
REFERENCES CLIENTES(CPF),
CONSTRAINT ck_status CHECK (Status IN ('Pago', 'Pendente','Cancelado'))
);

CREATE TABLE CATEGORIAS (
IdCategoria INT PRIMARY KEY IDENTITY(1,1),
NomeCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUTOS (
IdProduto INT PRIMARY KEY IDENTITY(1,1),
IdCategoria INT NOT NULL,
NomeProduto VARCHAR(100) NOT NULL,
Preco DECIMAL(10, 2) NOT NULL,
Estoque INT NOT NULL,
CONSTRAINT fk_categoria_produto FOREIGN KEY (IdCategoria) 
REFERENCES CATEGORIAS(IdCategoria)
);

CREATE TABLE ITENS_PEDIDO (
IdPedido INT NOT NULL, 
IdProduto INT NOT NULL,
Quantidade INT NOT NULL,
PrecoUnitarioProduto  DECIMAL(10, 2) NOT NULL,
CONSTRAINT pk_itens_pedido PRIMARY KEY (IdPedido, IdProduto),
CONSTRAINT fk_pedido_itens FOREIGN KEY (IdPedido) 
    REFERENCES PEDIDOS(IdPedido),
CONSTRAINT fk_produto_itens FOREIGN KEY (IdProduto)
    REFERENCES PRODUTOS(IdProduto)
);

