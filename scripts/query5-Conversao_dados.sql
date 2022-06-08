USE EMPRESA
GO

/*Conversão de dados*/

SELECT 1 + '1'
GO
-- RETORNA VALOR INT 2
-- CONVERSÃO AUTOMATICA PELO SISTEMA
-- STRING -> INT

SELECT '1' + '1'
GO
-- O SIMBOLO DE + SERVE COMO CONCATENADOR
-- RETORNO STRING '11'

SELECT 'CURSO DE BANCO DE DADOS' + '1'
GO
-- RETORNO STRING 'CURSO DE BANCO DE DADOS1'

SELECT 'CURSO DE BANCO DE DADOS' + 1
GO
-- RETORNO UM ERRO
-- O SISTEMA SEMPRE TENTA CONVERTER STRING EM NUMERICO 
-- NUNCA O CONTRARIO

/* FUNÇÕES DE CONVERSÃO DE DADOS */
-- SERVE PARA FORÇAR O SISTEMA A FAZER DETERMINADAS CONVERSÕES

SELECT
CAST('1' AS INT) + CAST('1' AS INT)
GO
-- RETORNO 2 INT

/* TABELA DE CONVERSÃO DE DADOS DO SISTEMA DO SQL SERVER
msdn.microsoft.com/en-us/library/ms191530.aspx */

-- CONVERTER DATA FORMATO AMERICANO PARA, FORMATO BRASILEIRO
SELECT
NOME,
DAY(NASCIMENTO)+'/'+MONTH(NASCIMENTO)+'/'+YEAR(NASCIMENTO)
FROM ALUNO
GO
-- RETORNO ERRO
-- O SISTEMA ESTA TENTANDO CONVERTER '/' PARA INTEIRO (INT)

/*EXERCICIO CONSEGUIR DATA EM FORMATO BRASILEIRO*/

SELECT
NOME,
CAST(DAY(NASCIMENTO) AS VARCHAR)+'/'+
CAST(MONTH(NASCIMENTO) AS VARCHAR)+'/'+
CAST(YEAR(NASCIMENTO) AS VARCHAR) AS NASCIMENTO
FROM ALUNO
GO
-- RETORNA A DATA NO FORMATO BRASILEIRO
-- CUIDADO POIS ESTA COMO STRING

/* FUNÇÃO DE DATA - DAY(), MONTH(), YEAR() */
-- TEM COMO ARGUMENTO UMA DATA
-- RETORNA APENAS A PARTE DE INTERESSE DA FUNÇÃO DA DATA