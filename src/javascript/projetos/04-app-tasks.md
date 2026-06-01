# Projeto 4 - App de controle de tarefas com Node.js, Express, MySQL e React

A ideia desse projeto é criar uma aplicação de controle de tarefas usando Node.js, Express e MySQL. A aplicação permitirá que os usuários criem, visualizem, atualizem e excluam tarefas, e os dados serão armazenados em um banco de dados MySQL. Além disso, vamos criar uma interface simples usando React para consumir a API de tarefas que criamos.

## Fase 1 - Concepção do Projeto

A ideia desse projeto é criar uma aplicação de controle de tarefas usando Node.js, Express e MySQL. A aplicação permitirá que os usuários criem, visualizem, atualizem e excluam tarefas, e os dados serão armazenados em um banco de dados MySQL. Além disso, vamos criar uma interface simples usando React para consumir a API de tarefas que criamos.

### Arquitetura

A aplicação será composta por um backend construído com Node.js e Express, que expõe uma API RESTful para gerenciar as tarefas. O backend se comunicará com um banco de dados MySQL para armazenar as informações das tarefas. O frontend será desenvolvido usando React, que consumirá a API do backend para exibir a lista de tarefas e permitir a criação, atualização e exclusão de tarefas.

````mermaid
graph LR
  subgraph Backend
    A[Express Server] --> B[MySQL Database]
  end
  subgraph Frontend
    C[React App] --> A
  end
````

### Requisitos

- Ter conhecimento básico de [JavaScript](../visao-geral.md), Node.js e Express.
- Ter conhecimento básico de [APIs RESTful](../../rest.md) e como elas funcionam.
- Ter conhecimento básico de bancos de dados relacionais e [SQL](../../SQL-e-bancos-de-dados-relacionais.md).
- Ter conhecimento básico de [React](../react.md) para criar a interface frontend.
- Ter conhecimento básico de [Docker](../../devops/docker.md) para configurar o banco de dados MySQL.
- Ter conhecimento básico de [Dbeaver](https://dbeaver.io/) para gerenciar o banco de dados MySQL.
- Ter um ambiente de desenvolvimento configurado com Node.js 24, Docker e Dbeaver.
- Editor de código de sua preferência (como Visual Studio Code, Sublime Text, etc.)
- Terminal do Linux ou macOS.
- [Docker](../../devops/docker.md) instalado para configurar o banco de dados MySQL.
- [Dbeaver](https://dbeaver.io/) para gerenciar o banco de dados MySQL.


### Endpoints

Nesse projeto, vamos criar os seguintes endpoints para a API de tarefas:

- `POST /tasks`: Criar uma nova tarefa.
- `GET /tasks`: Listar todas as tarefas.
- `GET /tasks/:id`: Obter detalhes de uma tarefa específica.
- `PUT /tasks/:id`: Atualizar uma tarefa existente.
- `DELETE /tasks/:id`: Excluir uma tarefa.

### O que fizemos até agora:

- Definimos a arquitetura da aplicação, com um backend em Node.js e Express, um banco de dados MySQL e um frontend em React.
- Listamos os requisitos necessários para desenvolver a aplicação, incluindo conhecimentos em JavaScript, Node.js, Express, APIs RESTful, SQL, React, Docker e Dbeaver.
- Especificamos os endpoints que serão implementados na API de tarefas para permitir a criação, leitura, atualização e exclusão de tarefas.


## Fase 2 - Configuração do Projeto

Vamos configurar o projeto passo a passo, começando pela criação do backend com Node.js e Express, seguido pela configuração do banco de dados MySQL usando Docker, e finalmente criando a interface frontend com React para consumir a API de tarefas.


### Passo 1: Configurar o Projeto

1. Crie um novo diretório para o projeto e navegue até ele:
    ```bash
    mkdir 04-api-tasks
    cd 04-api-tasks
    ```
2. Inicialize um novo projeto Node.js:
    ```bash
    npm init -y
    ```
3. Edite o arquivo `package.json` para incluir a propriedade `type` como `module` e adicione um script de inicialização:
    ````diff
    {
      "name": "04-api-tasks",
      "version": "1.0.0",
      "description": "",
      "main": "index.js",
    + "type": "module",
      "scripts": {
    -   "test": "echo \"Error: no test specified\" && exit 1"
    +   "test": "echo \"Error: no test specified\" && exit 1",
    +   "start": "node src/index.js"
      },
      "keywords": [],
      "author": "",
      "license": "ISC"
    }
    ```
4. Crie um diretório `src` para organizar o código-fonte do projeto:
    ```bash
    mkdir src
    ```
5. Edite o arquivo `package.json` para apontar o campo `main` e o script `start` para o arquivo `src/index.js`:
    ````diff
    {
      "name": "04-api-tasks",
      "version": "1.0.0",
      "description": "",
    - "main": "index.js",
    + "main": "src/index.js",
      "type": "module",
      "scripts": {
    -   "test": "echo \"Error: no test specified\" && exit 1",
    +   "test": "echo \"Error: no test specified\" && exit 1",
    +   "start": "node src/index.js"
      },
      "keywords": [],
      "author": "",
      "license": "ISC"
    }
    ```

### Passo 2: Configurar o Banco de Dados MySQL via Docker

1. Certifique-se de ter o Docker instalado e em execução em sua máquina.
2. Crie um arquivo chamado `docker-compose.yml` na raiz do projeto com o seguinte conteúdo para configurar um contêiner MySQL:
    ```yaml
    networks:
      internal:
        driver: bridge

    volumes:
      mysql-storage:
        driver: local

    services:
      mysql:
        image: mysql:8.0
        command: --character-set-server=utf8 --collation-server=utf8_unicode_ci
        restart: unless-stopped
        environment:
          MYSQL_ROOT_HOST: '%'
          MYSQL_ROOT_PASSWORD: root
          MYSQL_DATABASE: tasks-api
        volumes:
          - mysql-storage:/var/lib/mysql:rw
        ports:
          - 3306:3306
        networks:
          - internal
    ```

    ### Explicação do `docker-compose.yml`:
    - **networks**: Define uma rede personalizada chamada `internal` para isolar os serviços do projeto.
    - **volumes**: Define um volume chamado `mysql-storage` para armazenar os dados do MySQL de forma persistente.
    - **services**: Define o serviço `mysql` que utiliza a imagem oficial do MySQL 8.0. Ele configura o banco de dados com um nome, usuário e senha, e expõe a porta 3306 para permitir conexões externas.
      - `command`: Configura o MySQL para usar UTF-8 como conjunto de caracteres padrão, garantindo compatibilidade com caracteres acentuados e outros símbolos.
3. Inicie o contêiner MySQL usando o Docker Compose:
    ```bash
    docker-compose up -d
    ```
    Este comando iniciará o contêiner em segundo plano. O MySQL estará disponível na porta 3306 do localhost, e você poderá conectar-se a ele usando as credenciais definidas no arquivo `docker-compose.yml` (usuário: `root`, senha: `root`, banco de dados: `tasks-api`).
    > Caso queira parar o contêiner, use o comando `docker-compose down`. Para visualizar os logs do contêiner, use `docker-compose logs mysql`.


### Passo 3: Instalar as Dependências

1. No terminal, dentro do diretório do projeto, execute o seguinte comando para instalar as dependências necessárias:
    ```bash
    npm install express@4.19.2 mysql2@3.11.0 knex@3.1.0
    ```
    - `express`: Framework web para Node.js que facilita a criação de APIs.
    - `mysql2`: Biblioteca para conectar e interagir com bancos de dados MySQL.
    - `knex`: Query builder para SQL que facilita a construção de consultas ao banco de dados.
    > Estamos especificando as versões das dependências para garantir que elas funcionem de forma idêntica ao que foi testado durante a criação deste projeto, evitando possíveis incompatibilidades com versões mais recentes.
2. O arquivo `package.json` deve ser atualizado para refletir as dependências instaladas:
    ````diff
    {
      "name": "04-api-tasks",
      "version": "1.0.0",
      "description": "",
      "main": "src/index.js",
      "type": "module",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "start": "node src/index.js"
      },
      "keywords": [],
      "author": "",
      "license": "ISC",
    + "dependencies": {
    +   "express": "4.19.2",
    +   "knex": "3.1.0",
    +   "mysql2": "3.11.0"
    + }
    }
    ```

### Passo 4: Criando o arquivo `knexfile.js` para configurar o Knex

O knex precisa de um arquivo de configuração para saber como se conectar ao banco de dados. Crie um arquivo chamado `knexfile.js` na raiz do projeto com o seguinte conteúdo:

```javascript
import path from 'node:path'
import process from 'node:process'

/**
 * @type {import('knex').Knex.Config}
 */
export default {
  client: 'mysql2',
  migrations: {
    directory: path.join(process.cwd(), 'src', 'migrations'),
  },
  connection: {
    host: '0.0.0.0',
    port: 3306,
    user: 'root',
    password: 'root',
    database: 'tasks-api',
  }
}
```

#### Explicação do `knexfile.js`:

- **export default**: Exporta a configuração do Knex como um módulo ES6.
- **client**: Especifica o cliente de banco de dados a ser usado, neste caso, `mysql2`.
- **migrations**: Define o diretório onde as migrações do banco de dados serão armazenadas. As migrações são usadas para versionar e gerenciar as alterações no esquema do banco de dados.
  - `directory`: Usa o módulo `path` para construir um caminho absoluto para o diretório `src/migrations`, onde as migrações serão armazenadas.
- **connection**: Configura os detalhes de conexão com o banco de dados MySQL, sendo:
  - `host`: Define o endereço do servidor MySQL. Usamos `0.0.0.0` para permitir conexões de qualquer endereço IP.
  - `port`: Especifica a porta em que o MySQL está escutando, que é a porta padrão 3306.
  - `user`: O nome de usuário para autenticação no banco de dados, que é `root` conforme definido no `docker-compose.yml`.
  - `password`: A senha para autenticação, que é `root` conforme definido no `docker-compose.yml`.
  - `database`: O nome do banco de dados a ser usado, que é `tasks-api` conforme definido no `docker-compose.yml`.

Com essa configuração, o Knex estará pronto para se conectar ao banco de dados MySQL e gerenciar as migrações necessárias para criar as tabelas e estruturas do banco de dados para a API de tarefas.


### Passo 5: Criar script para executar as migrações

Para criar um script que execute as migrações do Knex, adicione a seguinte linha ao campo `scripts` do arquivo `package.json`:

````diff
{
  "name": "04-api-tasks",
  "version": "1.0.0",
  "description": "",
  "main": "src/index.js",
  "type": "module",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
-   "start": "node src/index.js"
+   "start": "node src/index.js",
+   "migrate": "knex migrate:latest --knexfile knexfile.js",
+   "rollback": "knex migrate:rollback --knexfile knexfile.js"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "4.19.2",
    "knex": "3.1.0",
    "mysql2": "3.11.0"
  }
}
````

#### Explicação dos scripts adicionados:
- **migrate**: Este script executa as migrações do Knex para criar ou atualizar a estrutura do banco de dados. O comando `knex migrate:latest` aplica todas as migrações pendentes, e a opção `--knexfile knexfile.js` especifica o arquivo de configuração do Knex a ser usado.
- **rollback**: Este script reverte a última migração aplicada. O comando `knex migrate:rollback` desfaz a última migração, e a opção `--knexfile knexfile.js` especifica o arquivo de configuração do Knex a ser usado.

### Passo 6: Criar a migração para a tabela de tarefas

1. Crie um diretório chamado `migrations` dentro do diretório `src`:
    ```bash
    mkdir src/migrations
    ```
2. Crie um arquivo de migração para a tabela de tarefas. O nome do arquivo deve seguir um formato numérico para garantir a ordem de execução, seguido por uma descrição da migração. Por exemplo:
    ```bash
    touch src/migrations/1.js
    ```
3. Edite o arquivo `src/migrations/1.js` para definir a estrutura da tabela de tarefas:
    ```javascript
    export const up = (knex) => {
      return knex.schema
        .createTable('tasks', (table) => {
          table.comment('Tasks table')
          table.increments()
          table.string('name', 100).comment('Task name')
          table.boolean('completed').defaultTo(false).comment('Task status')
          table.timestamps()
        })
    }

    export const down = (knex) => {
      return knex.schema
        .dropTable('tasks')
    }
    ```
    ### Explicação da migração:
    - **up**: Função que define as alterações a serem aplicadas ao banco de dados. Neste caso, estamos criando uma tabela chamada `tasks` com as seguintes colunas:
      - `id`: Coluna auto-incremental que serve como chave primária.
      - `name`: Coluna de texto para armazenar o nome da tarefa, com um limite de 100 caracteres.
      - `completed`: Coluna booleana para indicar se a tarefa foi concluída ou não, com valor padrão `false`.
      - `created_at` e `updated_at`: Colunas de timestamp para registrar quando a tarefa foi criada e atualizada.
    - **down**: Função que define as alterações para reverter a migração, ou seja, o que deve ser feito para desfazer as alterações aplicadas pela função `up`. Neste caso, estamos simplesmente removendo a tabela `tasks` do banco de dados.
4. Execute as migrações para criar a tabela de tarefas no banco de dados:
    ```bash
    npm run migrate
    ```
    Este comando executará a migração definida no arquivo `src/migrations/1.js`, criando a tabela `tasks` no banco de dados MySQL. Se precisar reverter a migração, você pode usar o comando `npm run rollback` para desfazer a última migração aplicada.
    > É necessário que o contêiner MySQL esteja em execução para que as migrações sejam aplicadas com sucesso. Certifique-se de que o Docker Compose esteja ativo e o contêiner MySQL esteja rodando antes de executar as migrações.
5. Abra o DBeaver e conecte-se ao banco de dados MySQL usando as credenciais definidas no `docker-compose.yml` (host: `localhost`, porta: `3306`, usuário: `root`, senha: `root`, banco de dados: `tasks-api`). Verifique se a tabela `tasks` foi criada com sucesso e explore sua estrutura.
  > Você pode visualizar o [manual de configuração do DBeaver](../../SQL-e-bancos-de-dados-relacionais.md#dbeaver) para aprender como configurar conexões no DBeaver e gerenciar seu banco de dados MySQL.

### Passo 7: Criar arquivo `src/index.js` para configurar o servidor Express

Nesta etapa, vamos criar o arquivo `src/index.js` e incluir o conteúdo abaixo para começar a construir o servidor Express e definir as rotas da API de tarefas:

```javascript
import express from 'express'
import console from 'node:console'

const app = express()

app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.listen(3000, () => {
  console.info('Listening on 127.0.0.1:3000')
})
```

Nesse momento a aplicação Express está configurada para ouvir na porta 3000, mas ainda não temos nenhuma rota definida para manipular as tarefas. Nos próximos passos, vamos adicionar as rotas para criar, ler, atualizar e excluir tarefas, além de configurar a conexão com o banco de dados usando o Knex.

### Explicação do código:
- **import express from 'express'**: Importa o módulo Express para criar o servidor web.
- **import console from 'node:console'**: Importa o módulo console para usar o método `console.info` para exibir mensagens informativas no terminal.
- **const app = express()**: Cria uma instância do aplicativo Express.
- **app.use(express.json())**: Middleware que converte o corpo das requisições para JSON, permitindo que a API receba dados no formato JSON.
- **app.use(express.urlencoded({ extended: true }))**: Middleware que converte o corpo das requisições para URL-encoded, permitindo que a API receba dados de formulários HTML.
- **app.listen(3000, () => { ... })**: Inicia o servidor Express na porta 3000 e exibe uma mensagem no console indicando que o servidor está ouvindo nessa porta.

> No express os **middlewares** são funções que têm acesso ao objeto de requisição (req), ao objeto de resposta (res) e à próxima função de middleware no ciclo de requisição-resposta do aplicativo. Eles podem executar código, modificar os objetos de requisição e resposta, encerrar o ciclo de requisição-resposta ou chamar a próxima função de middleware. No exemplo acima, estamos usando middlewares para processar o corpo das requisições e permitir que a API receba dados em formatos JSON e URL-encoded.

### O que fizemos até agora:

- Configuramos o projeto Node.js e Express para criar a API de tarefas.
- Configuramos o banco de dados MySQL usando Docker e criamos a tabela `tasks` usando migrações do Knex.
- Criamos o arquivo `src/index.js` para configurar o servidor Express e definir os middlewares para processar o corpo das requisições.

## Fase 3 - Implementação dos Endpoint de cadastro de tarefas

Neste passo, vamos editar o arquivo `src/index.js` para adicionar o knex, para isso deixe o arquivo como o exemplo abaixo:

````diff
import express from 'express'
import console from 'node:console'
+import knex from 'knex'
+import knexConfig from '../knexfile.js'

+const db = knex(knexConfig)
const app = express()
````

Em seguida, adicione o seguinte código para criar um endpoint POST que permita criar uma nova tarefa após a linha `app.use(express.urlencoded({ extended: true }))`:

````javascript
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

// Endpoint para criar uma nova tarefa
app.post('/tasks', async (req, res) => {
 try {
    const { name, completed = false } = req.body
  
    const data = {
      name, // nome da tarefa
      completed, // se não for informado, assume o valor padrão false
      created_at: new Date(), // data de criação
      updated_at: new Date() // data de atualização
    }
  
    // INSERT INTO tasks (name, completed, created_at, updated_at) VALUES (?, ?, ?, ?)
    const id = await db('tasks') // tabela tasks
      .insert(data) // insere os dados
      .first() // retorna apenas o primeiro resultado

    res
      .status(201)
      .json({ id, name, completed })
 } catch (error) {
   console.error('Error creating task:', error)
   res.status(500).json({ error: 'Failed to create task' })
 }
})

app.listen(3000, () => {
  console.info('Listening on port 3000')
})
````

### Explicação do código:

- **app.post('/tasks', async (req, res) => { ... })**: Define um endpoint POST na rota `/tasks` para criar uma nova tarefa. A função é assíncrona para permitir o uso de operações assíncronas, como a interação com o banco de dados.
- **try { ... } catch (error) { ... }**: Bloco de código para capturar e lidar com erros que possam ocorrer durante o processo de criação da tarefa.
- **const { name, completed = false } = req.body**: [Desestrutura](../destructuring.md) o corpo da requisição para obter os campos `name` e `completed`. O campo `completed` tem um valor padrão de `false` caso não seja fornecido na requisição.
- **const data = { ... }**: Cria um objeto `data` que contém os dados da nova tarefa, incluindo o nome, o status de conclusão e as datas de criação e atualização.
- **const id = await db('tasks').insert(data).first()**: Usa o Knex para inserir os dados da nova tarefa na tabela `tasks` do banco de dados. O método `insert` insere os dados e o método `first` retorna o ID da nova tarefa criada.
- **res.status(201).json({ id, name, completed })**: Retorna uma resposta JSON com o ID, nome e status da tarefa criada, e define o status HTTP para 201 (Created) para indicar que a tarefa foi criada com sucesso.
- **catch (error) { ... }**: Captura qualquer erro que ocorra durante o processo de criação da tarefa e retorna uma resposta de erro com status HTTP 500 (Internal Server Error) e uma mensagem de erro.

A partir deste ponto, a API de tarefas já tem um endpoint funcional para criar novas tarefas. Nesse momento vamos testar esse endpoint usando o Postman ou qualquer outra ferramenta de teste de APIs para garantir que ele esteja funcionando corretamente antes de prosseguir para a implementação dos outros endpoints (leitura, atualização e exclusão de tarefas).

### Testando o endpoint de criação de tarefas:

1. Execute o servidor Express usando o comando:
    ```bash
    npm start
    ```
    O servidor deve iniciar e exibir a mensagem "Listening on port 3000".
    > Caso o serviço já esteja em execução é necessário reiniciá-lo para que as alterações no código sejam aplicadas. Você pode parar o servidor atual usando `Ctrl + C` no terminal e, em seguida, executar `npm start` novamente para reiniciar o servidor.
2. Abra o Postman e crie uma nova requisição POST para a URL `http://localhost:3000/tasks`.
3. No corpo da requisição, selecione o formato JSON e adicione o seguinte conteúdo para criar uma nova tarefa:
    ```json
    { "name": "Minha primeira tarefa" }
    ```
4. Envie a requisição e verifique se a resposta retorna o ID, nome e status da tarefa criada, com um status HTTP 201 (Created). A resposta deve ser semelhante a:
    ```json
    { "id": 1, "name": "Minha primeira tarefa", "completed": false }
    ```
5. Se preferir você poderá usar o terminal para testar o endpoint usando o `curl`:
    ```bash
    curl -X POST http://localhost:3000/tasks \
      -H "Content-Type: application/json" \
      -d '{"name": "Minha primeira tarefa"}'
    ```
    A resposta deve ser semelhante a:
    ```json
    { "id": 1, "name": "Minha primeira tarefa", "completed": false }
    ```
6. Verifique no banco de dados MySQL, usando o DBeaver, se a nova tarefa foi inserida corretamente na tabela `tasks`. Você deve ver um registro com o nome "Minha primeira tarefa" e o status `completed` como `false`.

### O que fizemos até agora:

- Adicionamos o Knex ao projeto para facilitar a interação com o banco de dados MySQL.
- Criamos um endpoint POST `/tasks` para permitir a criação de novas tarefas, recebendo os dados no corpo da requisição e inserindo-os na tabela `tasks` do banco de dados.
- Testamos o endpoint usando o Postman e verificamos se a tarefa foi criada corretamente no banco de dados MySQL.


## Fase 4 - Criando uma aplicação React para consumir a API de tarefas

Nesta etapa, vamos criar uma interface simples usando [React](../react.md) para consumir a API de tarefas que acabamos de criar. A interface permitirá que os usuários visualizem a lista de tarefas, criem novas tarefas e marquem as tarefas como concluídas.

Para isso vamos criar um novo projeto React fora do diretório `04-api-tasks` do nosso projeto atual. Siga os passos abaixo para iniciar uma aplicação React:

1. Abra um novo terminal e navegue para o diretório onde deseja criar a aplicação React. Em seguida, execute o seguinte comando para criar um novo projeto React usando o Create React App:

    ```bash
    npx create-react-app --template typescript 04-api-tasks-frontend
    ```
    Este comando criará um novo diretório chamado `04-api-tasks-frontend` com a estrutura básica de um projeto React. Será solicitado que você confirme a instalação do Create React App e suas dependências. Após a instalação, o terminal exibirá uma mensagem de sucesso indicando que a aplicação React foi criada com sucesso, juntamente com instruções para iniciar o servidor de desenvolvimento.

    ```output
    Need to install the following packages:
    create-react-app@5.1.0
    Ok to proceed? (y) y


    Creating a new React app in /Users/bruno/04-api-tasks-frontend.

    Installing packages. This might take a couple of minutes.
    Installing react, react-dom, and react-scripts with cra-template-typescript...


    added 1298 packages in 56s

    268 packages are looking for funding
      run `npm fund` for details

    Initialized a git repository.

    Installing template dependencies using npm...

    added 22 packages, removed 1 package, and changed 2 packages in 4s

    268 packages are looking for funding
      run `npm fund` for details

    We detected TypeScript in your project (src/App.test.tsx) and created a tsconfig.json file for you.

    Your tsconfig.json has been populated with default values.

    Removing template package using npm...


    removed 1 package, and audited 1319 packages in 5s

    268 packages are looking for funding
      run `npm fund` for details

    28 vulnerabilities (9 low, 6 moderate, 13 high)

    To address issues that do not require attention, run:
      npm audit fix

    To address all issues (including breaking changes), run:
      npm audit fix --force

    Run `npm audit` for details.

    Created git commit.

    Success! Created 04-api-tasks-frontend at /Users/bruno/04-api-tasks-frontend
    Inside that directory, you can run several commands:

      npm start
        Starts the development server.

      npm run build
        Bundles the app into static files for production.

      npm test
        Starts the test runner.

      npm run eject
        Removes this tool and copies build dependencies, configuration files
        and scripts into the app directory. If you do this, you can’t go back!

    We suggest that you begin by typing:

      cd 04-api-tasks-frontend
      npm start

    Happy hacking!
    ```
2. Navegue para o diretório do projeto React:
    ```bash
    cd 04-api-tasks-frontend
    ```
3. Inicie o servidor de desenvolvimento do React:
    ```bash
    npm start
    ```
    O comando `npm start` iniciará o servidor de desenvolvimento e abrirá a aplicação React no navegador, geralmente em `http://localhost:3000`. Você verá a página inicial do Create React App, indicando que a aplicação React foi criada com sucesso.

### O que fizemos até agora:

- Criamos uma nova aplicação React usando o Create React App com template TypeScript.
- Iniciamos o servidor de desenvolvimento do React para visualizar a aplicação no navegador.

## Fase 5 - Construindo o componente responsável por cadastrar tarefas

Agora você pode começar a editar os arquivos dentro do diretório `04-api-tasks-frontend/src` para construir a interface da aplicação React que irá consumir a API de tarefas. Você pode criar componentes para exibir a lista de tarefas, um formulário para criar novas tarefas e botões para marcar as tarefas como concluídas. Utilizaremos o [`fetch` API](../fetch.md) para fazer requisições HTTP à API de tarefas que criamos anteriormente e atualizar a interface com os dados recebidos.

### Criando um arquivo para armazenar as chamadas à API

Crie um arquivo `src/api.ts` para centralizar as chamadas à API de tarefas. Este arquivo conterá funções para criar, ler, atualizar e excluir tarefas, facilitando a manutenção e reutilização do código relacionado à comunicação com a API. E para começar, adicione a função para criar uma nova tarefa:

```typescript
export const createTask = async (name: string) => {
  const requestOptions: RequestInit = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({ name })
  }

  const response = await fetch('http://localhost:3000/tasks', requestOptions)

  if (!response.ok) {
    throw new Error('Failed to create task')
  }

  return await response.json()
}
```

#### Explicação do código:
- **createTask**: Função assíncrona que recebe o nome da tarefa como parâmetro e faz uma requisição POST para a API de tarefas.
- **requestOptions**: Objeto que define as opções da requisição, incluindo o método HTTP, os cabeçalhos e o corpo da requisição, que é convertido para JSON usando `JSON.stringify`.
- **fetch**: Função nativa do JavaScript para fazer requisições HTTP. Ela é usada para enviar a requisição para o endpoint da API de tarefas.
- **response.ok**: Verifica se a resposta da API foi bem-sucedida (status HTTP 200-299). Se não for bem-sucedida, lança um erro.
- **response.json()**: Converte a resposta da API para um objeto JavaScript usando o método `json()` da resposta, que é uma função assíncrona.

### Criando o componente para criar tarefas

Crie o arquivo `src/views/CreateTask.tsx` que será responsável por exibir um formulário para criar novas tarefas e enviar os dados para a API:

```typescript
import React, { useState, type FC } from 'react'
import { createTask } from '../api'

type Props = {}

export const CreateTask: FC<Props> = () => {
  const [name, setName] = useState<string>('')
  const [loading, setLoading] = useState<boolean>(false)
  const [error, setError] = useState<string | null>(null)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError(null)

    try {
      const newTask = await createTask(name)
      console.log('Task created:', newTask)
      setName('')
    } catch (err) {
      setError((err as Error).message)
    } finally {
      setLoading(false)
    }
  }

  return (
    <div>
      <h2>Create Task</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={name}
          onChange={(e) => setName(e.target.value)}
          placeholder="Task name"
          required
        />
        <button type="submit" disabled={loading}>
          {loading ? 'Creating...' : 'Create Task'}
        </button>
      </form>
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  )
}
```

#### Explicação do código:

- **CreateTask**: Componente funcional que exibe um formulário para criar novas tarefas.
- **useState**: O hook `useState` é uma função do React que permite adicionar estado a componentes funcionais. Ele retorna um array com dois elementos: o valor atual do estado e uma função para atualizar esse valor. No exemplo acima, estamos usando `useState` para gerenciar o estado do nome da tarefa, o estado de carregamento e o estado de erro. Cada vez que o estado é atualizado usando a função fornecida pelo `useState`, o componente é re-renderizado para refletir as mudanças na interface.
- **handleSubmit**: Função assíncrona que é chamada quando o formulário é submetido. Ela previne o comportamento padrão do formulário, define o estado de carregamento e chama a função `createTask` para enviar a requisição à API. Se a tarefa for criada com sucesso, o nome da tarefa é limpo. Se ocorrer um erro, a mensagem de erro é exibida.
- **form**: O formulário contém um campo de entrada para o nome da tarefa e um botão de envio. O botão é desabilitado enquanto a requisição está em andamento para evitar múltiplas submissões.
- **error**: Se houver um erro durante a criação da tarefa, a mensagem de erro é exibida abaixo do formulário em vermelho.

> A primeira vista o JSX pode parecer confuso, mas ele é apenas uma sintaxe que permite escrever HTML dentro do JavaScript. O JSX é transformado em chamadas de funções do React para criar os elementos da interface. Por exemplo, o código JSX `<h2>Create Task</h2>` é transformado em `React.createElement('h2', null, 'Create Task')` durante a compilação. Isso permite que você escreva a estrutura da interface de forma mais intuitiva e legível, enquanto o React cuida de criar os elementos correspondentes no DOM.


### O que fizemos até agora:

- Criamos um arquivo `src/api.ts` para centralizar as chamadas à API de tarefas, começando com a função `createTask` para criar novas tarefas.
- Criamos um componente React `CreateTask` que exibe um formulário para criar novas tarefas e utiliza a função `createTask` para enviar os dados para a API.
- Implementamos o estado para gerenciar o nome da tarefa, o estado de carregamento e o estado de erro, e adicionamos lógica para lidar com a submissão do formulário e exibir mensagens de erro quando necessário.
