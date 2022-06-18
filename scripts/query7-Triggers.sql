USE EMPRESA
GO

/* TRIGGERS - FUNÇÕES (PROCEDURES) GATILHO */

CREATE TABLE PRODUTOS (
IDPRODUTO INT IDENTITY PRIMARY KEY,
NOME VARCHAR(50) NOT NULL,
CATEGORIA VARCHAR(30) NOT NULL,
PRECO NUMERIC(10,2) NOT NULL
) 
GO
-- NUMERIC = FLOAT NO MySQL
-- NUMERIC(NUMERO_TOTAL,NUMERO_DE_CASAS_DECIMAIS)

CREATE TABLE HISTORICO(
IDOPERACAO INT PRIMARY KEY IDENTITY,
PRODUTO VARCHAR(50),
CATEGORIA VARCHAR(30),
PRECOANTIGO NUMERIC(10,2) NOT NULL,
PRECONOVO NUMERIC(10,2) NOT NULL,
DATA DATETIME,
USUARIO VARCHAR(30),
MENSAGEM VARCHAR(100)
) 
GO

-- INSERIR PRODUTOS
INSERT INTO PRODUTOS VALUES
('LIVRO SQL SERVER','LIVROS',98.00),
('LIVRO ORACLE','LIVROS',50.00),
('LICENÇA POWERCENTER','SOFTWARE',45000.00),
('NOTEBOOK 17','COMPUTADORES',3150.00),
('LIVRO BUSINESS INTELLIGENCE','LIVROS',90.00)
GO

-- VERIFICANDO OS INSERT (DUAS TABELAS AO MESMO TEMPO)
SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO

-- VERIFICANDO O USUARIO
SELECT SUSER_NAME()
GO

/* TRIGGERS DE DADOS - DATA MANIPULATION LANGUAGE (DML) */

CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE 
AS

	-- BLOCO DE DECLARAÇÃO DE VARIAVEIS
	DECLARE @IDPRODUTO INT
	DECLARE @PRODUTO VARCHAR(30)
	DECLARE @CATEGORIA VARCHAR(10)
	DECLARE @PRECO NUMERIC(10,2)
	DECLARE @PRECONOVO NUMERIC(10,2)
	DECLARE @DATA DATETIME
	DECLARE @USUARIO VARCHAR(30)
	DECLARE @ACAO VARCHAR(100)

	-- PRIMEIRO BLOCO
	SELECT @IDPRODUTO = IDPRODUTO FROM INSERTED
	SELECT @PRODUTOS = NOME FROM INSERTED
	SELECT @CATEGORIA = CATEGORIA FROM INSERTED
	SELECT @PRECO = PRECO FROM DELETED
	SELECT @PRECONOVO = PRECO FROM INSERTED

	-- SEGUNDO BLOCO
	SET @DATA = GETDATE()
	SET @USUARIO = SUSER_NAME()
	SET @ACAO = "VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO"

	-- INSERINDO DADOS
	INSERT INTO HISTORICO 
	(PRODUTO, CATEGORIA, PRECOANTIGO, PRECONOVO, DATA, USUARIO, MENSAGEM)
	VALUES
	(@PRODUTO, @CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)

	-- MENSAGENS PRINTADA
	PRINT 'TRIGGER EXECUTADO COM SUCESSO'
GO

/*BEFORE/AFTER = DELETED/INSERTED*/
-- DELETED = BEFORE NO MySQL = ANTES
-- INSERTED = AFTER NO MySQL = DEPOIS
-- SÃO AREAS DO SISTEMA
-- TUDO QUE É DELETADO VAI PARA O "DELETED"
-- TUDO QUE É INSERIDO VAI PARA O "INSERTED"
-- LOGO SE QUERO PEGAR ALGUM VALOR "ANTES" DE ALGO NOVO SER INSERIDO, PEGO O QUE VAI SER "DELETADO", DELETED
-- LOGO SE QUERO PEGAR ALGUM VALOR "DEPOIS" DE ALGO NOVO SER INSERIDO, PEGO NO INSERTED

/*SCHEMA*/
-- DBO = DATABASE OWNER
-- SCHEMA = DIVISOR LOGICO DE BANCO DE DADOS (TODO ESQUEMA TEM UM DONO)
-- OU SEJA, DBO É UM SCHEMA
-- PODE SE CRIAR OUTROS SCHEMAS
-- SEM DONO = DBO (O DONO É O DONO DA DATABASE)
-- O SCHEMA PODE SER CONSIDERADO COMO ALGO SEMELHANTE A "PASTAS"
-- DBO É A "PASTA" DEFAULT DA DATABASE

-- IMPORTANTE:
-- É POSSIVEL DAR (OU REVOGAR) PERMISSÕES PARA USUARIOS EM SCHEMAS
-- UMA DAS PRINCIPAIS UTILIZAÇÃO DE SCHEMA

/* DECLARE - DECLARAÇÃO DE VARIAVEIS */
-- COLOCAR "@" NA FRENTE DA VARIAVEL CRIADA

/* PRINT */
-- IMPRIME UMA MENSAGEM NA TELA

/* BOAS PRATICAS */
/* BLOCO 1 */
-- VALORES VINDOS DE TABELAS SÃO INSERIDOS PELO COMANDO "SELECT"

/* BLOCO 2*/
-- VALORES VINDOS DE FUNÇÕES OU VALORES LITERAIS SÃO INSERIDOS PELO COMANDO "SET"

/* EXECUTANDO UM UPDATE */

UPDATE PRODUTOS SET PRECO = 100.00
WHERE IDOPERACAO = 1
GO

UPDATE PRODUTOS SET NOME = "LIVRO C#"
WHERE IDOPERACAO = 1
GO

/* VERIFICANDO AS ATUALIZAÇÕES */

SELECT * FROM PRODUTOS
SELECT * FROM HISTORICO
GO
-- TUDO CERTO COM A TRIGGER
-- POREM NÃO QUERIA QUE SALVASE O NOVO NOME, APENAS O PREÇO
-- NECESSIDADE DE CONSERTAR A TRIGGER PARA OLHAR APENAS PARA COLUNA PREÇO
-- E SALVAR AS ATUALIZAÇÕES QUANDO, SE SOMENTE SE, ESSA COLUNA FOR ATUALIZADA

/* PROGRAMANDO O TRIGGER PARA OBSERVAR UMA COLUNA */

-- DELETANDO A TRIGGER ANTERIOR
DROP TRIGGER TRG_ATUALIZA_PRECO
GO

-- REESCREVENDO A TRIGGER
CREATE TRIGGER TRG_ATUALIZA_PRECO
ON DBO.PRODUTOS
FOR UPDATE AS
IF UPDATE(PRECO)
BEGIN

	-- BLOCO DE DECLARAÇÃO DE VARIAVEIS
	DECLARE @IDPRODUTO INT
	DECLARE @PRODUTO VARCHAR(30)
	DECLARE @CATEGORIA VARCHAR(10)
	DECLARE @PRECO NUMERIC(10,2)
	DECLARE @PRECONOVO NUMERIC(10,2)
	DECLARE @DATA DATETIME
	DECLARE @USUARIO VARCHAR(30)
	DECLARE @ACAO VARCHAR(100)

	-- PRIMEIRO BLOCO
	SELECT @IDPRODUTO = IDPRODUTO FROM INSERTED
	SELECT @PRODUTOS = NOME FROM INSERTED
	SELECT @CATEGORIA = CATEGORIA FROM INSERTED
	SELECT @PRECO = PRECO FROM DELETED
	SELECT @PRECONOVO = PRECO FROM INSERTED

	-- SEGUNDO BLOCO
	SET @DATA = GETDATE()
	SET @USUARIO = SUSER_NAME()
	SET @ACAO = "VALOR INSERIDO PELA TRIGGER TRG_ATUALIZA_PRECO"

	-- INSERINDO DADOS
	INSERT INTO HISTORICO 
	(PRODUTO, CATEGORIA, PRECOANTIGO, PRECONOVO, DATA, USUARIO, MENSAGEM)
	VALUES
	(@PRODUTO, @CATEGORIA,@PRECO,@PRECONOVO,@DATA,@USUARIO,@ACAO)

	-- MENSAGENS PRINTADA
	PRINT 'TRIGGER EXECUTADO COM SUCESSO'
END
GO

/* TRIGGER OLHANDO PARA A COLUNA ESPECIFICADA - USO DO "IF" */
-- O TRIGGER SÓ FUNCIONA SE A COLUNA ESPECIFICADA FOR MODIFICADA
-- O COMANDO "IF" RECEBE COMO EXPRESSÃO O TIPO DE AÇÃO E A COLUNA OBSERVADA PELA AÇÃO
-- O COMANDO "IF" VEM SEGUIDO DE "BEGIN", ONDE COMEÇA E "END" ONDE TERMINA

-- ESSE TIPO DE AÇÃO JÁ COMEÇA A ENTRAR EM TSQL
-- (TRANSACTIONAL SQL LANGUAGE)