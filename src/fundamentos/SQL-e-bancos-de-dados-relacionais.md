# SQL e bancos de dados relacionais

O SQL (Structured Query Language) é a linguagem padrão para gerenciamento de bancos de dados relacionais. Ele permite criar, ler, atualizar e excluir dados em um banco de dados. Os bancos de dados relacionais organizam os dados em tabelas, que são compostas por linhas e colunas. Cada tabela tem um nome e cada coluna tem um tipo de dado específico. As tabelas podem estar relacionadas entre si por meio de chaves primárias e estrangeiras, o que permite a construção de consultas complexas para recuperar informações de várias tabelas ao mesmo tempo. O SQL é amplamente utilizado em aplicações web, sistemas de gerenciamento de conteúdo, análise de dados e muitas outras áreas onde o armazenamento e a manipulação de dados são essenciais. Existem vários sistemas de gerenciamento de bancos de dados relacionais (RDBMS) que suportam SQL, como MySQL, PostgreSQL, Oracle Database e Microsoft SQL Server. Cada um desses sistemas tem suas próprias extensões e características, mas todos seguem os princípios básicos do SQL para manipulação de dados. O conhecimento de SQL é fundamental para desenvolvedores, analistas de dados e administradores de bancos de dados, pois é a base para trabalhar com dados em muitos contextos diferentes.

## DQL

Os comandos DQL (Data Query Language) são usados para consultar e recuperar dados de um banco de dados relacional. O comando principal da DQL é o `SELECT`, que permite especificar quais colunas devem ser retornadas, de quais tabelas os dados devem ser extraídos e quais condições devem ser aplicadas para filtrar os resultados. A DQL é essencial para a análise de dados, pois permite que os usuários obtenham informações específicas dos dados armazenados no banco de dados, facilitando a tomada de decisões informadas com base nesses dados.

### SELECT

O comando `SELECT` é usado para recuperar dados de uma ou mais tabelas em um banco de dados relacional. Ele permite especificar quais colunas devem ser retornadas, de quais tabelas os dados devem ser extraídos e quais condições devem ser aplicadas para filtrar os resultados. O comando `SELECT` é a base para a maioria das consultas SQL e pode ser combinado com outras cláusulas, como `WHERE`, `GROUP BY`, `ORDER BY` e `JOIN`, para criar consultas mais complexas e obter informações específicas dos dados armazenados no banco de dados.

#### Exemplo de uso do SELECT

```sql
SELECT nome, idade FROM usuarios WHERE idade > 18;
```

Neste exemplo, o comando `SELECT` está recuperando as colunas `nome` e `idade` da tabela `usuarios`, mas apenas para os registros onde a idade é maior que 18.

## DML

Comandos DML (Data Manipulation Language) são usados para manipular os dados em um banco de dados relacional. Eles incluem os comandos `INSERT`, `UPDATE` e `DELETE`, que permitem adicionar, modificar e remover registros em uma tabela, respectivamente. Esses comandos são essenciais para a gestão dos dados, pois permitem que os usuários mantenham as informações atualizadas e relevantes no banco de dados. O uso adequado dos comandos DML é fundamental para garantir a integridade dos dados e evitar erros ou inconsistências no banco de dados.

### INSERT

O comando `INSERT` é usado para adicionar novos registros a uma tabela em um banco de dados relacional. Ele permite especificar os valores para cada coluna da tabela, ou pode ser usado para inserir dados em todas as colunas de uma vez. O comando `INSERT` é fundamental para a manipulação de dados, pois permite que os usuários adicionem informações ao banco de dados de forma estruturada e organizada. Ele pode ser combinado com outras cláusulas, como `SELECT`, para inserir dados provenientes de outras tabelas ou consultas, tornando-o uma ferramenta poderosa para a gestão de dados em bancos de dados relacionais.

#### Exemplo de uso do INSERT

```sql
INSERT INTO usuarios (nome, idade) VALUES ('Maria', 25);
```

Neste exemplo, o comando `INSERT` está adicionando um novo registro à tabela `usuarios`, com o nome 'Maria' e a idade 25.

### UPDATE

O comando `UPDATE` é usado para modificar os dados existentes em uma tabela de um banco de dados relacional. Ele permite especificar quais colunas devem ser atualizadas e quais valores devem ser atribuídos a essas colunas. O comando `UPDATE` também pode incluir uma cláusula `WHERE` para filtrar quais registros devem ser atualizados, garantindo que apenas os dados desejados sejam modificados. Sem a cláusula `WHERE`, o comando `UPDATE` afetará todos os registros da tabela, o que pode levar a alterações indesejadas. O uso do comando `UPDATE` é fundamental para manter os dados atualizados e corretos em um banco de dados relacional.

#### Exemplo de uso do UPDATE

```sql
UPDATE usuarios SET idade = 30 WHERE nome = 'João';
```

Neste exemplo, o comando `UPDATE` está modificando a coluna `idade` para o valor 30 na tabela `usuarios`, mas apenas para os registros onde o nome é 'João'.

### DELETE

O comando `DELETE` é usado para remover registros de uma tabela em um banco de dados relacional. Ele permite especificar quais registros devem ser excluídos usando uma cláusula `WHERE` para filtrar os dados. Sem a cláusula `WHERE`, o comando `DELETE` removerá todos os registros da tabela, o que pode resultar em perda de dados importante. O uso do comando `DELETE` é essencial para manter a integridade dos dados e garantir que apenas as informações relevantes sejam mantidas no banco de dados.

#### Exemplo de uso do DELETE

```sql
DELETE FROM usuarios WHERE idade < 18;
```

Neste exemplo, o comando `DELETE` está removendo os registros da tabela `usuarios` onde a idade é menor que 18.

## DDL

Os comandos DDL (Data Definition Language) são usados para definir e modificar a estrutura de um banco de dados relacional. Eles incluem os comandos `CREATE`, `ALTER` e `DROP`, que permitem criar, alterar e excluir tabelas, índices, visões e outros objetos do banco de dados. Esses comandos são essenciais para a gestão da estrutura do banco de dados, permitindo que os usuários criem novas tabelas para armazenar dados, modifiquem a estrutura existente para atender a novas necessidades e removam objetos que não são mais necessários. O uso adequado dos comandos DDL é fundamental para garantir a organização e a eficiência do banco de dados relacional.

### CREATE

O comando `CREATE` é usado para criar novos objetos em um banco de dados relacional, como tabelas, índices, visões e outros. Ele permite especificar a estrutura do objeto que está sendo criado, incluindo os nomes das colunas, os tipos de dados e as restrições. O comando `CREATE` é fundamental para a definição da estrutura do banco de dados, permitindo que os usuários criem tabelas para armazenar dados e outros objetos para facilitar a consulta e a manipulação desses dados. Ele pode ser combinado com outras cláusulas, como `IF NOT EXISTS`, para evitar erros ao tentar criar um objeto que já existe.

#### Exemplo de uso do CREATE

```sql
CREATE TABLE usuarios (
  id INT PRIMARY KEY,
  nome VARCHAR(100),
  idade INT
);
```

Neste exemplo, o comando `CREATE` está criando uma nova tabela chamada `usuarios` com três colunas: `id`, `nome` e `idade`. A coluna `id` é definida como a chave primária da tabela.

### ALTER

O comando `ALTER` é usado para modificar a estrutura de um objeto existente em um banco de dados relacional, como uma tabela. Ele permite adicionar, modificar ou excluir colunas, alterar tipos de dados, adicionar ou remover restrições e realizar outras alterações na estrutura do objeto. O comando `ALTER` é essencial para a evolução da estrutura do banco de dados, permitindo que os usuários façam ajustes e melhorias à medida que as necessidades de armazenamento e consulta de dados mudam ao longo do tempo. Ele pode ser combinado com outras cláusulas, como `ADD`, `DROP` e `MODIFY`, para especificar o tipo de alteração que deve ser realizada.

#### Exemplo de uso do ALTER

```sql
ALTER TABLE usuarios ADD COLUMN email VARCHAR(255);
```

Neste exemplo, o comando `ALTER` está modificando a tabela `usuarios` para adicionar uma nova coluna chamada `email` do tipo `VARCHAR(255)`.

### DROP

O comando `DROP` é usado para excluir objetos de um banco de dados relacional, como tabelas, índices, visões e outros. Ele remove completamente o objeto do banco de dados, incluindo todos os dados e a estrutura associada a ele. O comando `DROP` é essencial para a gestão do banco de dados, permitindo que os usuários removam objetos que não são mais necessários ou que foram criados por engano. No entanto, o uso do comando `DROP` deve ser feito com cautela, pois ele pode resultar na perda irreversível de dados se usado incorretamente.

#### Exemplo de uso do DROP

```sql
DROP TABLE usuarios;
```

Neste exemplo, o comando `DROP` está excluindo completamente a tabela `usuarios` do banco de dados, incluindo todos os dados e a estrutura associada a ela.

## DTL

Os comandos DTL (Data Transaction Language) são usados para gerenciar transações em um banco de dados relacional. Eles incluem os comandos `BEGIN TRANSACTION`, `COMMIT` e `ROLLBACK`, que permitem iniciar, confirmar e reverter transações, respectivamente. As transações são unidades de trabalho que garantem a integridade dos dados, permitindo que um conjunto de operações seja executado como uma única unidade atômica. O uso adequado dos comandos DTL é fundamental para garantir que as operações no banco de dados sejam consistentes e confiáveis, especialmente em ambientes onde múltiplos usuários estão acessando e modificando os dados simultaneamente.

#### Exemplo de uso do DTL

```sql
BEGIN TRANSACTION;
UPDATE contas SET saldo = saldo - 100 WHERE id = 1;
UPDATE contas SET saldo = saldo + 100 WHERE id = 2;
COMMIT;
```

Neste exemplo, o comando `BEGIN TRANSACTION` inicia uma nova transação, e as duas operações de atualização são executadas como parte dessa transação. O comando `COMMIT` confirma as alterações feitas durante a transação, garantindo que ambas as atualizações sejam aplicadas ao banco de dados. Se ocorrer algum erro durante a transação, o comando `ROLLBACK` pode ser usado para reverter todas as alterações feitas, mantendo a integridade dos dados.

## Dbeaver

O DBeaver é uma ferramenta de gerenciamento de bancos de dados que suporta uma ampla variedade de sistemas de gerenciamento de bancos de dados (RDBMS). Ele oferece uma interface gráfica intuitiva para criar, editar e consultar bancos de dados, facilitando o trabalho com SQL. O DBeaver é especialmente útil para desenvolvedores e administradores de bancos de dados, pois permite visualizar a estrutura do banco de dados, executar consultas SQL, gerenciar conexões e realizar tarefas administrativas sem a necessidade de usar a linha de comando. Além disso, o DBeaver suporta recursos avançados como visualização de diagramas ER, exportação e importação de dados, e integração com sistemas de controle de versão. É uma ferramenta poderosa para quem trabalha com bancos de dados relacionais e deseja uma maneira eficiente de gerenciar seus dados.

### Configuração de conexões

Para configurar uma conexão no DBeaver, siga os passos abaixo:

1. Abra o DBeaver e clique em "Database" no menu superior, depois selecione "New Database Connection".
  ![Seleção de banco de dados no DBeaver](./.attachments/Screenshot%202026-05-31%20at%2015.35.49.png)
2. Na janela de seleção de banco de dados, escolha o tipo de banco de dados que deseja conectar (por exemplo, MySQL, PostgreSQL, etc.) e clique em "Next".
  ![Seleção do MySQL no DBeaver](./.attachments/Screenshot%202026-05-31%20at%2015.40.55.png)
3. Preencha as informações de conexão, como host, porta, nome do banco de dados, nome de usuário e senha. Você também pode testar a conexão para garantir que as informações estão corretas.
  ![Configuração de conexão no DBeaver 2](./.attachments/Screenshot%202026-05-31%20at%2015.40.18.png)
4. Clique em "Finish" para salvar a conexão. Agora você pode acessar o banco de dados e começar a executar consultas SQL, visualizar tabelas e gerenciar seus dados usando a interface do DBeaver.
5. Para acessar o banco de dados, basta clicar na conexão que você criou na barra lateral esquerda do DBeaver. Você poderá expandir a conexão para visualizar as tabelas, colunas e outros objetos do banco de dados, além de poder executar consultas SQL diretamente na interface do DBeaver.
  ![Acessando o banco de dados](./.attachments/Screenshot%202026-05-31%20at%2015.43.08.png)
