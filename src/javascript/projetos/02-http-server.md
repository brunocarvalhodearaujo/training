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
4. Edite o arquivo `package.json` incluindo a propriedade `type` para `module` para habilitar o suporte a módulos ES6:
    ```diff
    {
      "name": "http-server",
      "version": "1.0.0",
      "description": "",
      "main": "server.js",
      + "type": "module",
      "scripts": {
        "start": "node server.js"
      },
      "author": "",
      "license": "ISC"
    }
    ```

### Passo 2: Criar o servidor HTTP

1. Crie um arquivo chamado `server.js` na raiz do projeto:
    ```bash
    touch server.js
    ```
2. Abra o arquivo `server.js` em seu editor de código e adicione o seguinte código para criar um servidor HTTP simples:

  ```javascript
  const http = require('http');
