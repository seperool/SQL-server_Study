-- ACESSANDO O BANCO DE DADOS
USE EMPRESA
GO

/* BLOCOS IF E ELSE */

DECLARE @NUMERO INT = 5
BEGIN
	IF @NUMERO = 5 -- EXPRESSÃO BOOLEANA - TRUE
		PRINT 'O VALOR É VERDADEIRO'
	ELSE
		PRINT 'O VALOR É FALSO'
END
GO

/* CASE */
DECLARE @CONTADOR INT
BEGIN
	SELECT
	CASE
		WHEN FABRICANTE = 'FIAT' THEN 'FAIXA 1'
		WHEN FABRICANTE = 'CHEVROLET' THEN 'FAIXA 2'
		ELSE 'OUTRAS FAIXAS'
	END AS "INFORMAÇÕES",
	*
	FROM CARROS
END
GO
-- CASE REPRESENTA UMA COLUNA.
-- CASE NÃO É PROGRAMAÇÃO, É UMA FUNÇÃO.

/*-----------------------------------------------------------*/

/* DEVER DE CASA */
-- TRANSFORMAR IF E ELSE EM BLOCO NOMEADO (PROCEDURES)

-- CRIANDO A PROCEDURE
CREATE PROC V_OU_F @NUMERO INT -- DINAMICO
AS
BEGIN
	IF @NUMERO = 5 -- EXPRESSÃO BOOLEANA - TRUE
		PRINT 'O VALOR É VERDADEIRO'
	ELSE
		PRINT 'O VALOR É FALSO'
END
GO

-- CHAMANDO A PROCEDURE
EXEC V_OU_F 6
GO