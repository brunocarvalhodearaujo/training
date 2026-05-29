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

O arquivo `package.json` é um componente essencial de qualquer projeto Node.js, pois contém informações sobre o projeto, suas dependências e scripts de execução. Ele é criado automaticamente quando você executa o comando `npm init` e pode ser editado manualmente para adicionar ou remover dependências, definir scripts personalizados e configurar outras opções do projeto.

Exemplo de um arquivo `package.json`:

```json
{
  "name": "meu-projeto",
  "version": "1.0.0",
  "description": "Um projeto de exemplo para gerenciar pacotes com NPM",
  "main": "index.js",
  "scripts": {
    "start": "node index.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "dependencies": {
    "express": "^4.17.1"
  },
  "devDependencies": {
    "nodemon": "^2.0.7"
  },
  "author": "Seu Nome",
  "license": "MIT"
}
```

Na seção `dependencies`, são listados os pacotes necessários para a execução da aplicação, enquanto na seção `devDependencies` são listados os pacotes necessários apenas durante o desenvolvimento. Os scripts definidos na seção `scripts` podem ser executados usando o comando `npm run <script-name>`, facilitando a automação de tarefas comuns, como iniciar o servidor ou executar testes.

## Gerenciando a versão dos pacotes

Ao instalar pacotes com o NPM, é possível especificar a versão desejada utilizando operadores de versionamento semântico. Por exemplo:

- `npm install express@4.17.1`: Instala a versão 4.17.1 do pacote Express.
- `npm install express@^4.17.0`: Instala a versão mais recente da série 4.17.x, mas não atualiza para a versão 5.0.
- `npm install express@~4.17.0`: Instala a versão mais recente da série 4.17.x, mas não atualiza para a versão 4.18.0 ou superior.
- `npm install express`: Instala a versão mais recente do pacote Express disponível, independentemente da versão.

### Qual a diferença entre `^` e `~`?

- O operador `^` permite atualizações que não alterem a versão principal (major), ou seja, ele aceita atualizações de patch e minor. Por exemplo, `^4.17.0` pode atualizar para `4.17.1`, `4.18.0`, mas não para `5.0.0`.
- O operador `~` permite atualizações que não alterem a versão minor, ou seja, ele aceita apenas atualizações de patch. Por exemplo, `~4.17.0` pode atualizar para `4.17.1`, mas não para `4.18.0` ou `5.0.0`.


## Dependências de desenvolvimento vs dependências de produção

O NPM permite diferenciar entre dependências de desenvolvimento e dependências de produção. As dependências de desenvolvimento são aquelas necessárias apenas durante o processo de desenvolvimento, como ferramentas de teste ou transpiladores, enquanto as dependências de produção são aquelas necessárias para a execução da aplicação em um ambiente de produção.

## Exitem outros gerenciadores de pacotes?

Sim, além do NPM, existem outros gerenciadores de pacotes populares para JavaScript, como o Yarn e o PNPM. O Yarn é conhecido por sua velocidade e confiabilidade, enquanto o PNPM é conhecido por sua eficiência no uso de espaço em disco. Ambos os gerenciadores de pacotes oferecem funcionalidades semelhantes ao NPM, mas com algumas diferenças em termos de desempenho e gerenciamento de dependências.

## Sugestão de exercício

- [ ] Inicialize um novo projeto Node.js utilizando o comando `npm init` e instale o pacote `express` como dependência de produção e o pacote `nodemon` como dependência de desenvolvimento. Em seguida, configure um script que inicie um arquivo `index.js` usando o comando `node` e outro script que inicie o mesmo arquivo usando o `nodemon`. Teste ambos os scripts para garantir que estão funcionando corretamente.

- [ ] Remova o pacote `nodemon` do projeto utilizando o comando `npm uninstall` e verifique se ele foi removido corretamente do arquivo `package.json`.