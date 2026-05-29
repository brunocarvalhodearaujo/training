# Observabilidade

Atualmente a complexidade das aplicações vem aumentando por inúmeros fatores como múltiplas instâncias, acesso a diversas
bases de dados, dependências de serviços e acima de tudo a importância de ser possível auditar as informações que são
processadas pelos serviços, isso requer cada vez mais que os serviços possuam estruturas de logs cada vez mais robustas.

Antes de começar a implementar essa estrutura é recomendável que você leia o guia de gerenciamento de logs onde você
encontra um guia rápido e fácil de seguir para implementar os logs, além de boas praticas.

Neste manual você irá encontrar uma forma simples de instrumentar suas aplicações **Node.JS** para que seja possível ter
controle de cada evento que ocorre no ciclo de vida do seu serviço.

Lembre-se que você não precisa seguir a risca todos os passos abaixo embora seja recomendado, além disso serão utilizados
alguns exemplos de código para tornar mais fácil ilustrar todo o processo de configuração.

## Configurando e estruturando os logs

Existem pacotes do `Node.js` que simplificam alguns passos durante o processo de configuração dos logs, para isso utilize
o comando abaixo para instalar o pacote [bunyan](https://www.npmjs.com/package/bunyan):

````bash
# usando o npm para instalar o pacote
$ npm install bunyan
# usando o yarn para instalar o pacote
$ yarn add bunyan
````

Depois de instalado os pacotes necessários iremos criar um ponto central para as chamadas dos logs, a opção mais simples
e efetiva é criar um arquivo chamado `console.ts` na raiz do seu projeto usando o código abaixo:

````ts
/**
 * Copyright (c) 2024-present, Bruno Carvalho de Araujo.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 */

import bunyan, { type LoggerOptions, type Stream } from 'bunyan'
import process from 'node:process'
import path from 'node:path'
import { hostname } from 'node:os'

const options: LoggerOptions = {
  name: process.env.npm_package_name ?? 'unknown',
  src: process.env.NODE_ENV !== 'production',
  stream: process.stdout,
  serializers: {
    err: bunyan.stdSerializers.err,
    error: bunyan.stdSerializers.err
  }
}

const logger = bunyan.createLogger(options)

if (process.env.LOG_TYPE === 'rotating-file') {
  const stream: Stream = {
    type: 'rotating-file',
    path: path.join(process.cwd(), 'logs', `${hostname()}.log`),
    period: '1d',
    count: 3
  }

  logger.addStream(stream)
}

logger.level(Number(process.env.LOG_LEVEL) || bunyan.INFO)

if (process.env.NODE_ENV === 'test') {
  logger.level(bunyan.FATAL + 1)
}

export default logger
````

Em seguida você poderá executar as chamadas ao nosso serviço de logs como no exemplo abaixo:

````ts
import console from './console'
import express from 'express'
import { Account } from './services/Account'

const app = express()
const account = new Account()

app.get('/reset-password', async (request, response) => {
  const { body: { email } } = request

  try {
    console.info({ email }, 'iniciando fluxo de  de envio de email de reset de senha')

    await account.reset(email)

    console.info({ email }, 'concluído com sucesso o fluxo de envio de email de reset de senha')

    response
      .status(200)
      .json({ message: 'Email de reset de senha enviado com sucesso' })
  } catch (error) {
    console.error({ error, email }, 'ocorreu um erro ao enviar o email de reset de senha')

    response
      .status(500)
      .json({ code: 500, message: 'Email de reset de senha enviado com sucesso' })
 }
})

app.listen(3000, () => {
  console.info('Example app listening on port 3000')
})
````

Perceba que a primeira coisa que fizemos foi importar o arquivo `console.js`, dessa forma podemos simplificar as chamadas ao nosso logger, como mostrado nas linhas 12, 16, 22 e 28.

Um ponto importante a se lembrar é que os logs devem conter uma das seguintes estrutura:

````ts
console.info('mensagem de exemplo')
console.info({ propriedade: 'valor' }, 'mensagem de exemplo')
console.error({ propriedade: 'valor', error }, 'mensagem de exemplo')
console.debug({ propriedade: 'valor' }, 'mensagem de exemplo')
console.trace({ propriedade: 'valor' }, 'mensagem de exemplo')
````

Caso os logs fiquem difíceis de ler, você pode utilizar alterar o package.json e efetuar a alteração como no exemplo abaixo:

```diff
"scripts": {
  ...
-  "start": "node bin/start"
+  "start": "node bin/start | bunyan -o short"
  ...
},
```

É importante lembrar que a verbosidade do log pode ser alterada pela variável de ambiente `LOG_LEVEL`, por padrão o
valor é `info=30`, mas você pode alterar para `debug=20` ou `trace=10` para ter mais detalhes sobre o que está acontecendo.

## Padronizando os logs

Para garantir que seja possível extrair o máximo de informações dos logs é importante que eles sejam padronizados, para
isso você pode deve seguir o seguinte padrão de estrutura:

- `level`: Nível do log, podendo ser `info`, `debug`, `trace` ou `error`, ou seja, `console.info`, `console.debug` e etc.
- `message`: Mensagem que será exibida no log, por exemplo: `iniciando fluxo de  de envio de email de reset de senha`,
ou seja `console.info({ email }, 'iniciando fluxo de  de envio de email de reset de senha')`, deixe claro o que está
sendo executado pelo serviço para facilitar a leitura e entendimento do fluxo.

## Pontos de atenção

- Não informe dados sensiveis do usuário como cpf, identidade e etc.

## Referências

- [Connecting NodeJS Logs and Traces](https://docs.datadoghq.com/tracing/connect_logs_and_traces/nodejs/#manual-trace-id-injection)
- [Tracing Node.js Applications](https://docs.datadoghq.com/tracing/setup_overview/setup/nodejs/?tab=containers)
- [Datadog's Lambda Layer: Monitor custom serverless metrics](https://www.datadoghq.com/blog/datadog-lambda-layer/)
- [Troubleshooting Serverless Package Too Large Errors](https://docs.datadoghq.com/serverless/guide/serverless_package_too_large/)