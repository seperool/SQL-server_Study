# 1 Objetivo

Estudo dirigido de SQL-server.

# 2 Referência

Vídeo aulas “O curso completo de Banco de Dados e SQL, sem mistérios” -
Udemy.

# 3 Modulo 24 - Instalação e delimitador **GO**

## 3.1 Instalação

### 3.1.1 Instalar SQL-server 

-   Versão:  
    Versão usada é a express 2019, por ser a versão mais completa
    gratuita.  

-   Ubuntu  
    <https://docs.microsoft.com/pt-br/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-ver15>  
    Basta seguir o passo a passo do site, ou pesquisar por pesquisar por
    “SQL-server Ubuntu” no youtube e seguir alguns tutoriais.  

-   Windows  

### 3.1.2 Instalar Azure Data Studio 

-   Gerenciador de banco de dados usado para SQL-server, que estou
    usando no Ubuntu.  
-   Onde baixar:  
    <https://docs.microsoft.com/pt-br/sql/azure-data-studio/download-azure-data-studio?view=sql-server-ver15>  

## 3.2 Acessando SQL-server pelo terminal

-   Execute o sqlcmd com parâmetros para o nome do SQL Server (-S), o
    nome de usuário (-U) e a senha (-P). Neste tutorial, você está se
    conectando localmente, portanto, o nome do servidor é localhost. O
    nome de usuário é SA (system administrator, equivalente ao root do
    MySQL) e a senha é a mesma fornecida para a conta SA durante a
    instalação.  

sqlcmd -S localhost -U SA -P ‘*YourPassword*’  

-   É possível omitir a senha na linha de comando para receber uma
    solicitação para inseri-la.  

sqlcmd -S localhost -U SA  

## 3.3 Bancos do sistema

-   São os bancos de dados do sistema que armazenam os dicionarios de
    dados.  
-   Bancos de dados do sistema:  
    -   **master**  
        -   É o banco de dados principal do sistema.  
        -   Todas as informações dos outros bancos de dados criados
            ficam armazenados nele.  
    -   **model**  
        -   São modelos de tabelas e bancos de dados, que ficam
            armazenados nesse banco de dados.  
        -   Pode servir de modelo automatico na criação de uma nova
            tabela ou banco de dados.  
    -   **msdb**  
        -   Armazenamento de rotinas.  
        -   Integrations Services, área de BI (ferramenta de **ETL**).  
    -   **tempdb**  
        -   Bancos de dados temporarios, ele é apagado todo vez que
            fecha e abre o sistema do banco de dados.  
        -   Muito utilizado para agilizar o teste de aplicações.  

## 3.4 Uso do delimitador **GO**

# 4 Andamento dos Estudos

## 4.1 Assunto em andamento

Atualmente estou estudando Módulo 24.  
