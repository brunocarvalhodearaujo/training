# Projeto 2 - Servidor HTTP simples

Neste projeto, vamos criar um servidor HTTP simples usando Node.js. Este servidor responderá a todas as requisições com uma mensagem de boas-vindas. Este é um excelente exercício para entender como funcionam os servidores web e como lidar com requisições HTTP em Node.js.

## Requisitos

- Node.js instalado em sua máquina com versão 24 ou superior.
- Editor de código de sua preferência (como Visual Studio Code, Sublime Text, etc.)
- Terminal do Linux ou macOS.

## Passo a Passo

### Passo 1: Configurar o ambiente

1. Certifique-se de ter o Node.js instalado em sua máquina. Você pode baixar a versão mais recente do Node.js em [https://nodejs.org/](https://nodejs.org/).
2. Crie uma nova pasta para o projeto e navegue até ela no terminal:
    ```bash
    mkdir http-server
    cd http-server
    ```
3. Inicialize um novo projeto Node.js:
    ```bash
    npm init -y
    ```
    Isso criará um arquivo `package.json` com as configurações padrão.
4. Edite o arquivo `package.json` incluindo a propriedade `type` para `module` para habilitar o suporte a módulos ES6 e o script de inicialização:

    ````diff
    {
      "name": "http-server",
      "version": "1.0.0",
      "description": "",
      "main": "index.js",
    + "type": "module",
      "scripts": {
    -   "test": "echo \"Error: no test specified\" && exit 1"
    +   "test": "echo \"Error: no test specified\" && exit 1",
    +   "start": "node index.js"
      },
      "keywords": [],
      "author": "",
      "license": "ISC"
    }
    ````

    > O campo `type: "module"` é necessário para que possamos usar a sintaxe de importação ES6 (`import`) em nosso código. Sem essa configuração, o Node.js trataria os arquivos como CommonJS, e a sintaxe de importação não funcionaria corretamente.

    > O script `start` é adicionado para facilitar a execução do servidor. Com ele, você pode iniciar o servidor usando o comando `npm start` em vez de `node index.js`.

5. Crie um diretório `src` para organizar o código-fonte do projeto:
    ```bash
    mkdir src
    ```

6. Edite o arquivo `package.json` para apontar o campo `main` e o script `start` para o arquivo `src/index.js`:

    ````diff
    {
      "name": "http-server",
      "version": "1.0.0",
      "description": "",
    - "main": "index.js",
    + "main": "src/index.js",
      "type": "module",
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
    -    "start": "node index.js"
    +    "start": "node src/index.js"
      },
      "keywords": [],
      "author": "",
      "license": "ISC"
    }
    ````

    > Com essa configuração, o comando `npm start` agora executará o arquivo `src/index.js`, que será o ponto de entrada do nosso servidor HTTP.

### Passo 2: Criar o servidor HTTP

1. Crie um arquivo chamado `index.js` dentro do diretório `src`:
    ```bash
    touch src/index.js
    ```
2. Abra o arquivo `index.js` em seu editor de código e adicione o seguinte código para criar um servidor HTTP simples:

    ```javascript
    import { createServer } from 'node:http'

    const server = createServer((req, res) => {
      res.writeHead(200, { 'Content-Type': 'text/plain' })
      res.end('Hello World!\n')
    })

    server.listen(3000, '127.0.0.1', () => {
      console.log('Listening on 127.0.0.1:3000')
    })
    ```

    > É importante utilizar o prefixo `node:` ao importar módulos nativos do Node.js para garantir que o ambiente de execução reconheça corretamente os módulos.

    ### Vamos entender o que cada parte do código faz:

    - `import { createServer } from 'node:http'`: Importa a função `createServer` do módulo nativo `http` do Node.js.
    - `createServer((req, res) => { ... })`: Cria um servidor HTTP que recebe uma função de callback. Esta função é chamada toda vez que uma requisição é feita ao servidor. Ela recebe dois parâmetros: `req` (objeto de requisição) e `res` (objeto de resposta).
    - `res.writeHead(200, { 'Content-Type': 'text/plain' })`: Define o status da resposta como 200 (OK) e o tipo de conteúdo como texto simples.
    - `res.end('Hello World!\n')`: Envia a resposta "Hello World!" e encerra a conexão.
    - `server.listen(3000, '127.0.0.1', () => { ... })`: Inicia o servidor e faz com que ele escute na porta 3000 no endereço IP 127.0.0.1. A função de callback é chamada quando o servidor começa a escutar.

### Passo 3: Executar o servidor

1. No terminal, execute o comando para iniciar o servidor:
    ```bash
    npm start
    ```
2. Você verá a mensagem "Listening on 127.0.0.1:3000" no terminal, indicando que o servidor está em execução e pronto para receber requisições.
3. Abra um navegador web e acesse `http://localhost:3000`. Você verá a mensagem "Hello World!" exibida na página, confirmando que o servidor HTTP está funcionando corretamente.

## Conclusão

Neste projeto, criamos um servidor HTTP simples usando Node.js que responde a todas as requisições com a mensagem "Hello World!". Passamos por todo o processo de configuração do ambiente, criação do arquivo principal, escrita do código e execução do servidor. Este é um excelente ponto de partida para aprender os fundamentos do desenvolvimento de servidores web em Node.js e preparar o terreno para projetos mais complexos no futuro.
