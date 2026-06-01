# Gerenciando dependências com NPM

## O que é o NPM?

O NPM (Node Package Manager) é o gerenciador de pacotes padrão do Node.js. Ele permite que os desenvolvedores instalem, compartilhem e gerenciem dependências de projetos JavaScript de forma eficiente. Com o NPM, é possível acessar uma vasta biblioteca de pacotes e módulos criados pela comunidade, facilitando a construção de aplicações complexas sem a necessidade de reinventar a roda.

## Principais comandos do NPM

- `npm init`: Inicializa um novo projeto Node.js, criando um arquivo `package.json` que contém as informações do projeto e suas dependências.
- `npm install <package-name>`: Instala um pacote específico e adiciona a dependência ao arquivo `package.json`.
- `npm install`: Instala todas as dependências listadas no arquivo `package.json`.
- `npm update`: Atualiza os pacotes instalados para suas versões mais recentes, respeitando as restrições de versão definidas no `package.json`.
- `npm uninstall <package-name>`: Remove um pacote específico e atualiza o arquivo `package.json` para refletir a remoção da dependência.

## Estrutura do arquivo `package.json`

O arquivo `package.json` é um componente essencial de qualquer projeto Node.js, pois contém informações sobre o projeto, suas dependências e scripts de execução. Ele é criado automaticamente quando você executa o comando `npm init` e pode ser editado manualmente para adicionar ou remover dependências, definir scripts personalizados e configurar outras opções do projeto. Segue abaixo um exemplo de um arquivo `package.json`:

```json
{
  "name": "meu-projeto",
  "version": "1.0.0",
  "description": "Um projeto de exemplo para gerenciar pacotes com NPM",
  "author": "Seu Nome",
  "license": "MIT",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "devDependencies": {
    "nodemon": "^2.0.7"
  },
  "dependencies": {
    "express": "^4.17.1"
  }
}
```

### vamos analisar cada seção do arquivo `package.json`:

- `name`: O nome do projeto.
- `version`: A versão do projeto.
- `description`: Uma breve descrição do projeto.
- `author`: O nome do autor do projeto.
- `license`: A [licença](https://pt.wikipedia.org/wiki/Licença_de_código_aberto) sob a qual o projeto é distribuído.
- `main`: O ponto de entrada do projeto, geralmente o arquivo principal que será executado.
- `scripts`: Um objeto que define scripts personalizados para executar comandos específicos, como iniciar a aplicação ou rodar testes.
- `devDependencies`: Um objeto que lista as dependências de desenvolvimento do projeto, ou seja, os pacotes necessários apenas durante o processo de desenvolvimento, como ferramentas de teste ou transpiladores.
- `dependencies`: Um objeto que lista as dependências de produção do projeto, ou seja, os pacotes necessários para a execução da aplicação em um ambiente de produção.

## Gerenciando a versão dos pacotes

Ao instalar pacotes com o NPM, é possível especificar a versão desejada utilizando operadores de versionamento semântico. Por exemplo:

- `npm install express@4.17.1`: Instala a versão 4.17.1 do pacote Express.
- `npm install express@^4.17.0`: Instala a versão mais recente da série 4.17.x, mas não atualiza para a versão 5.0.
- `npm install express@~4.17.0`: Instala a versão mais recente da série 4.17.x, mas não atualiza para a versão 4.18.0 ou superior.
- `npm install express`: Instala a versão mais recente do pacote Express disponível, independentemente da versão.

> Uma boa prática é sempre remover o operador de versionamento semântico ao instalar pacotes (ex: `^` ou `~`), para garantir que o projeto sempre utilize a mesma versão do pacote, evitando possíveis quebras causadas por atualizações automáticas. Dessa forma, é possível garantir a estabilidade e a consistência do projeto ao longo do tempo.

### Qual a diferença entre `^` e `~`?

- O operador `^` permite atualizações que não alterem a versão principal (major), ou seja, ele aceita atualizações de patch e minor. Por exemplo, `^4.17.0` pode atualizar para `4.17.1`, `4.18.0`, mas não para `5.0.0`.
- O operador `~` permite atualizações que não alterem a versão minor, ou seja, ele aceita apenas atualizações de patch. Por exemplo, `~4.17.0` pode atualizar para `4.17.1`, mas não para `4.18.0` ou `5.0.0`.


## Dependências de desenvolvimento vs dependências de produção

O NPM permite diferenciar entre dependências de desenvolvimento e dependências de produção. As dependências de desenvolvimento são aquelas necessárias apenas durante o processo de desenvolvimento, como ferramentas de teste ou transpiladores, enquanto as dependências de produção são aquelas necessárias para a execução da aplicação em um ambiente de produção.

## Exitem outros gerenciadores de pacotes?

Sim, além do NPM, existem outros gerenciadores de pacotes populares para JavaScript, como o Yarn e o PNPM. O Yarn é conhecido por sua velocidade e confiabilidade, enquanto o PNPM é conhecido por sua eficiência no uso de espaço em disco. Ambos os gerenciadores de pacotes oferecem funcionalidades semelhantes ao NPM, mas com algumas diferenças em termos de desempenho e gerenciamento de dependências.

## O arquivo `.npmrc`

O arquivo `.npmrc` é um arquivo de configuração do NPM que permite personalizar o comportamento do gerenciador de pacotes. Ele pode ser usado para definir configurações globais ou específicas para um projeto, como o registro de pacotes, a cache, as credenciais de autenticação e outras opções. O arquivo `.npmrc` pode ser criado na raiz do projeto ou no diretório do usuário, dependendo do escopo das configurações desejadas.

Um exemplo de configuração no arquivo `.npmrc` para definir um registro de pacotes personalizado seria:

```ini
registry=https://registry.npmjs.org/
```

## O arquivo `package-lock.json`

O arquivo `package-lock.json` é gerado automaticamente pelo NPM quando as dependências são instaladas ou atualizadas. Ele contém informações detalhadas sobre as versões exatas dos pacotes instalados, bem como suas dependências e subdependências. O objetivo do `package-lock.json` é garantir que o projeto seja reproduzível, ou seja, que as mesmas versões dos pacotes sejam instaladas em diferentes ambientes ou por diferentes desenvolvedores, evitando possíveis quebras causadas por atualizações automáticas de dependências.

## Sugestão de exercício

- [ ] Inicialize um novo projeto Node.js utilizando o comando `npm init` e instale o pacote `express` como dependência de produção e o pacote `nodemon` como dependência de desenvolvimento. Em seguida, configure um script que inicie um arquivo `index.js` usando o comando `node` e outro script que inicie o mesmo arquivo usando o `nodemon`. Teste ambos os scripts para garantir que estão funcionando corretamente.

- [ ] Remova o pacote `nodemon` do projeto utilizando o comando `npm uninstall` e verifique se ele foi removido corretamente do arquivo `package.json`.
