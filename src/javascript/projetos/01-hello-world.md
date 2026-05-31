# Projeto 1 - Hello World

Neste projeto, vamos criar uma aplicação simples em Node.js que exibe a mensagem "Hello World" no console. Este é um ótimo ponto de partida para se familiarizar com o ambiente de desenvolvimento Node.js e entender como criar e executar um script básico.

## Requisitos

- Node.js instalado em sua máquina com versão 24 ou superior.
- Editor de código de sua preferência (como Visual Studio Code, Sublime Text, etc.)
- Terminal do Linux ou macOS.

## Passo a Passo

### Passo 1: Configurar o ambiente

1. Certifique-se de ter o Node.js instalado em sua máquina. Você pode baixar a versão mais recente do Node.js em [https://nodejs.org/](https://nodejs.org/).
2. Crie uma nova pasta para o projeto e navegue até ela no terminal:
   ```bash
   mkdir hello-world
   cd hello-world
   ```

### Passo 2: Inicializar o projeto com o NPM

1. Inicialize um novo projeto Node.js usando o NPM:
   ```bash
   npm init -y
   ```
   Este comando criará um arquivo `package.json` com as configurações padrão, o que é útil para gerenciar dependências e scripts do projeto.

### Passo 3: Criar o arquivo principal do projeto

1. Crie um diretório chamado `src` para organizar o código-fonte do projeto:
   ```bash
   mkdir src
   cd src
   ```
2. Dentro do diretório `src`, crie um arquivo chamado `index.js`:
   ```bash
   touch index.js
   ```

### Passo 4: Escrever o código para exibir "Hello World"

1. Abra o arquivo `index.js` em um editor de texto e adicione o seguinte código:
   ```javascript
   import console from 'node:console'

    console.info('Hello, World!')
   ```
   Este código utiliza a função `console.log` para imprimir a mensagem "Hello World" no console.

### Passo 5: Executar o projeto

1. No terminal, certifique-se de estar no diretório raiz do projeto (onde está o arquivo `package.json`) e execute o seguinte comando para rodar o script:
   ```bash
   node src/index.js
   ```
2. Você deverá ver a mensagem "Hello World" sendo exibida no console.

## Passo 6: Incluindo um script de execução no `package.json`

1. Abra o arquivo `package.json` e adicione um script para facilitar a execução do projeto. Modifique a seção "scripts" para incluir o seguinte:
   ```diff
   "scripts": {
   -  "test": "echo \"Error: no test specified\" && exit 1"
   +. "test": "echo \"Error: no test specified\" && exit 1",
   +  "start": "node src/index.js"
   }
   ```
2. Agora, você pode iniciar o projeto usando o comando:
   ```bash
   npm start
   ```
3. Isso executará o script definido e exibirá "Hello World" no console.

## Conclusão

Neste projeto, criamos uma aplicação simples em Node.js que exibe "Hello World" no console. Passamos por todo o processo de configuração do ambiente, criação do arquivo principal, escrita do código e execução do projeto. Este é um excelente ponto de partida para aprender os fundamentos do desenvolvimento em Node.js e preparar o terreno para projetos mais complexos no futuro.
