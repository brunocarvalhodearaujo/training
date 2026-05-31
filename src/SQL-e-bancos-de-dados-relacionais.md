# SQL e bancos de dados relacionais

O SQL (Structured Query Language) é a linguagem padrão para gerenciamento de bancos de dados relacionais. Ele permite criar, ler, atualizar e excluir dados em um banco de dados. Os bancos de dados relacionais organizam os dados em tabelas, que são compostas por linhas e colunas. Cada tabela tem um nome e cada coluna tem um tipo de dado específico. As tabelas podem estar relacionadas entre si por meio de chaves primárias e estrangeiras, o que permite a construção de consultas complexas para recuperar informações de várias tabelas ao mesmo tempo. O SQL é amplamente utilizado em aplicações web, sistemas de gerenciamento de conteúdo, análise de dados e muitas outras áreas onde o armazenamento e a manipulação de dados são essenciais. Existem vários sistemas de gerenciamento de bancos de dados relacionais (RDBMS) que suportam SQL, como MySQL, PostgreSQL, Oracle Database e Microsoft SQL Server. Cada um desses sistemas tem suas próprias extensões e características, mas todos seguem os princípios básicos do SQL para manipulação de dados. O conhecimento de SQL é fundamental para desenvolvedores, analistas de dados e administradores de bancos de dados, pois é a base para trabalhar com dados em muitos contextos diferentes.


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
