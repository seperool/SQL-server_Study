/* ACESSANDO O BANCO DE DADOS */
USE EMPRESA
GO

/* TSQL */
-- É UM BLOCO DE LINGUAGEM DE PROGRAMAÇÃO DO SQL SERVER,
-- PROGRAMAS SÃO UNIDADES QUE PODEM SER CHAMADAS DE BLOCOS ANONIMOS,
-- BLOCOS ANONIMOS NÃO RECEBEM NOME,
-- POIS NÃO SÃO SALVOS NO BANCO DE DADOS.
-- CRIAMOS BLOCOS ANONIMOS QUANDO IREMOS EXECUTA-LOS UMA UNICA VEZ,
-- OU TESTAR ALGO.

/* BLOCO DE EXECUÇÃO */
-- ESTRUTURA
BEGIN
	PRINT 'PRIMEIRO BLOCO'
END
GO

/* BLOCO DE ATRIBUIÇÃO DE VARIAVEIS */
DECLARE @CONTADOR INT
BEGIN
	SET @CONTADOR = 5
	PRINT @CONTADOR
END
GO
SELECT @CONTADOR
GO
-- VAI DAR ERRO, POIS A VARIAVEL NÃO ESTA DECLARADA.
-- A VARIAVEL ESTA DELIMITADA PELO GO.
-- FORA PACOTE DELIMITADO PELO GO, ELA NÃO EXISTE.

-- MODO CERTO DE RESOLVER
DECLARE @CONTADOR INT
BEGIN
	SET @CONTADOR = 5
	PRINT @CONTADOR
	SELECT @CONTADOR
END
GO

/*---------------------------------------------------------*/
/* CONVERSÃO DE TIPO */
-- NO SQL SERVER CADA COLUNA, VARIAVEL LOCAL, EXPRESSÃO E
-- PARAMETRO TEM UM TIPO.

DECLARE 
	@V_NUMERO NUMERIC(10,2) = 100.52,
	@V_DATA DATETIME = '20170207'
BEGIN
	PRINT 'VALOR NUMERICO: ' + CAST(@V_NUMERO AS VARCHAR)
	PRINT 'VALOR NUMERICO: ' + CONVERT(VARCHAR, @V_NUMERO)
	PRINT 'VALOR DE DATA: ' + CAST(@V_DATA AS VARCHAR)
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 121) 
	-- CÓDIGO DO FORMATO DATE ENG COM MILÉSIMOS
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 120)
	-- CÓDIGO DO FORMATO DATE ENG SEM MILÉSIMOS
	PRINT 'VALOR DE DATA: ' + CONVERT(VARCHAR, @V_DATA, 105) 
	-- CÓDIGO DO FORMATO DATE PT-BR SEM HORAS
END
GO
-- A FUNÇÃO 'CONVERT' É MAIS COMUM PARA TRABALHAR COM DATA
-- A FUNÇÃO 'CAST' É SEMELHANTE, POREM MENOS USADA PARA 
-- CONVERSÕES QUESTÕES DE DATA.

-- EXISTEM DIVERSOS CÓDIGOS PARA OUTROS FORMATOS 'CONVERT'
-- DE DATETIME PARA VARCHAR. (PESQUISAR NA DOCUMENTAÇÃO)
-- POREM ESSES SÃO OS PRINCIPAIS.