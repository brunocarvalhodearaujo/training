# Projeto 3 - Servidor Express simples

Neste projeto, vamos criar um servidor web simples usando o framework [Express](https://expressjs.com/en/) para Node.js. O Express é uma biblioteca popular inspirada no framework Sinatra do Ruby, que facilita a criação de servidores web e APIs. Ele é capaz de criar com aplicações web robustas e escaláveis, e é amplamente utilizado na indústria para desenvolvimento de backends.

Este projeto é ideal para quem deseja aprender a usar o Express e entender como ele simplifica o desenvolvimento de servidores web.

## Requisitos

- Node.js instalado em sua máquina com versão 24 ou superior.
- Editor de código de sua preferência (como Visual Studio Code, Sublime Text, etc.)
- Terminal do Linux ou macOS.

## Passo a Passo

### Passo 1: Configurar o ambiente

1. Certifique-se de ter o Node.js instalado em sua máquina. Você pode baixar a versão mais recente do Node.js em [https://nodejs.org/](https://nodejs.org/).
2. Crie uma nova pasta para o projeto e navegue até ela no terminal:
    ```bash
    mkdir 03-express-simple-server
    cd 03-express-simple-server
    ```
3. Inicialize um novo projeto Node.js:
    ```bash
    npm init -y
    ```
    Isso criará um arquivo `package.json` com as configurações padrão.
4. Edite o arquivo `package.json` incluindo a propriedade `type` para `module` para habilitar o suporte a módulos ES6 e o script de inicialização:
    ````diff
    {
      "name": "03-express-simple-server",
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
      "name": "03-express-simple-server",
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
    ````

### Passo 2: Instalar o Express

1. No terminal, dentro do diretório do projeto, execute o seguinte comando para instalar o Express:
    ```bash
    npm install express@^4.19.2
    ```
    > O comando acima instala a versão 4.19.2 do Express, que é uma versão estável e amplamente utilizada. Você pode verificar a versão mais recente do Express no [npm](https://www.npmjs.com/package/express) e ajustar o comando de instalação conforme necessário.
2. Isso adicionará o Express como uma dependência do projeto e permitirá que você o utilize em seu código.
3. Ao final da instalação, o arquivo `package.json` será atualizado para incluir o Express como uma dependência:
    ````diff
    {
      "name": "03-express-simple-server",
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
    +   "express": "^4.19.2"
    + }
    }
    ````

### Passo 3: Criar o servidor Express

1. Crie um arquivo chamado `index.js` dentro do diretório `src`:
    ```bash
    touch src/index.js
    ```
2. Abra o arquivo `index.js` em seu editor de código e adicione o seguinte código para criar um servidor Express simples:

    ```javascript
    import console from 'node:console'
    import express from 'express'

    const app = express()
    const PORT = 3000

    app.get('/', (req, res) => {
      res
        .status(200)
        .json({ message: 'Hello, World!' })
    })

    // Iniciar o servidor
    app.listen(PORT, () => {
      console.log(`Servidor rodando em http://localhost:${PORT}`)
    })
    ```

    ### Vamos entender o que cada parte do código faz:

    - `import console from 'node:console'`: Importa o módulo `console` do Node.js para usar suas funcionalidades de logging.
    - `import express from 'express'`: Importa o framework Express para criar o servidor web.
    - `const app = express()`: Cria uma instância do aplicativo Express.
    - `const PORT = 3000`: Define a porta em que o servidor irá escutar as requisições.
    - `app.get('/', (req, res) => { ... })`: Define uma rota GET para o caminho raiz (`/`). Quando um cliente fizer uma requisição para essa rota, a função de callback será executada, enviando uma resposta JSON com a mensagem "Hello, World!" e um status HTTP 200 (OK).
    - `app.listen(PORT, () => { ... })`: Inicia o servidor e faz com que ele escute na porta definida. A função de callback é chamada quando o servidor começa a escutar, e nela utilizamos o `console.log` para imprimir uma mensagem indicando que o servidor está rodando e em qual URL ele pode ser acessado.

### Passo 4: Testar o servidor

1. No terminal, execute o comando para iniciar o servidor:
    ```bash
    npm start
    ```
2. Você verá a mensagem "Servidor rodando em http://localhost:3000" no terminal, indicando que o servidor está em execução e pronto para receber requisições.
3. Abra um navegador web e acesse `http://localhost:3000`. Você verá a mensagem JSON `{"message":"Hello, World!"}` exibida na página, confirmando que o servidor Express está funcionando corretamente.

## Conclusão

Neste projeto, criamos um servidor web simples usando o framework Express para Node.js. Aprendemos a configurar o ambiente, instalar o Express, criar rotas e iniciar o servidor. O Express facilita muito o desenvolvimento de servidores web e APIs, e é uma ótima escolha para projetos de todos os tamanhos. Com este conhecimento, você pode começar a construir aplicações web mais complexas usando o Express!
