# Criando um Proxy Server com o pacote `proxy`

Você já precisou intermediar as comunicações entre o seu servidor e outros serviços — por exemplo, para esconder a origem real dos clientes, centralizar o tráfego ou simplesmente redirecionar as requisições para outro host? Uma das formas mais simples de resolver isso é usando um **proxy server**. Neste artigo você vai entender o que é um proxy, como ele funciona no Node.js e como montá-lo com o pacote leve e popular chamado `proxy`.

Ao final, você terá um exemplo prático, compreendido linha a linha, que cria um proxy capaz de encaminhar as requisições HTTP recebidas para um servidor destino, utilizando apenas as ferramentas nativas do Node.js junto com o pacote `proxy`.

---

## O que é um proxy server?

Um proxy age como intermediário entre quem faz a requisição (o cliente) e quem responde (o servidor destino). Quando uma solicitação chega ao proxy, ele a reencaminha para o local correto e, em seguida, devolve a resposta ao cliente. Por estar no meio do caminho, o proxy pode desempenhar várias funções importantes:

- **Ocultar a origem**: o servidor destino vê o endereço do proxy em vez do cliente real, o que protege a identidade dos usuários.
- **Centralizar o tráfego**: todas as requisições passam por um único ponto, facilitando o monitoramento, o log e a aplicação de políticas.
- **Adicionar funcionalidades**: autenticação, cache, limitação de taxa e inspeção de conteúdo podem ser inseridos sem alterar o servidor de origem.

No Node.js, criar um proxy significa construir um servidor HTTP próprio que, ao receber uma requisição, a repasse para outro servidor e encaminhe de volta a resposta.

---

## Por que usar o pacote `proxy`?

Implementar um proxy do zero é possível, mas exige cuidado com detalhes como o tratamento de diferentes tipos de conteúdo, o encaminhamento de cabeçalhos e os tempos limite de conexão. O pacote [`proxy`](https://www.npmjs.com/package/proxy) encapsula toda essa complexidade em uma API enxuta e fácil de usar. Ele se conecta a um servidor HTTP comum do Node.js e expõe métodos para encaminhar as requisições, além de suportar cabeçalhos de segurança como `X-Forwarded-*`.

Com o `proxy`, você passa o controle de um servidor HTTP criado com `node:http` para o pacote e ele cuida do resto.

---

## Como funciona o exemplo

O código abaixo cria um proxy que escuta na porta `8000` e encaminha as requisições para um servidor destino. Vamos destrinchar cada etapa.

### 1. Importando as dependências

```js
import console from 'node:console'
import { createServer } from 'node:http'
import { createProxy } from 'proxy'
```

Começamos importando três coisas:

- O módulo `node:console` para exibir mensagens informativas.
- A função `createServer` do `node:http`, que cria o servidor HTTP nativo do Node.js que receberá as requisições.
- A função `createProxy` do pacote `proxy`, responsável por transformar o servidor HTTP em um proxy.

### 2. Criando o servidor proxy

```js
const server = createServer()
const proxyServer = createProxy(server)
```

Aqui criamos o servidor HTTP com `createServer`. Em seguida, passamos esse servidor para `createProxy`, que o transforma em um proxy. O resultado é um objeto `proxyServer` com os métodos e eventos necessários para encaminhar as requisições.

### 3. Iniciando o listener

```js
proxyServer.listen(8000, () => {
  console.info('Proxy server running on port 8000')
})
```

Por fim, chamamos o método `listen` para iniciar o servidor na porta `8000`. Assim que ele começar a ouvir conexões, o callback é executado e informamos que o proxy está rodando.

---

## Código completo

```js
import console from 'node:console'
import { createServer } from 'node:http'
import { createProxy } from 'proxy'

// Create a proxy server
const server = createServer()
const proxyServer = createProxy(server)

proxyServer.listen(8000, () => {
  console.info('Proxy server running on port 8000')
})
```

Cada parte corresponde exatamente ao que explicamos acima: as importações, a criação do servidor HTTP, o envolvimento do pacote `proxy` e a inicialização do listener.

---

## Próximos passos

Com a base funcionando, você pode dar mais poderes ao proxy. Algumas possibilidades incluem:

- Definir um **destino explícito** com `createProxy(server, { target: 'http://localhost:3000' })`, para que o proxy sempre encaminhe as requisições para um serviço específico.
- Usar o método `proxyServer.proxyClientRequest(req, clientReq, clientRes)` para encaminhar uma requisição de cliente para outro servidor.
- Registrar o evento `'listening'` para obter o endereço e a porta em que o servidor foi criado, e o evento `'error'` para capturar e tratar falhas.

---

## Conclusão

Com o pacote `proxy`, foi possível criar um proxy server no Node.js em poucos passos, utilizando apenas ferramentas nativas da plataforma. Aprendemos que:

- Um proxy é um intermediário que reencaminha requisições entre cliente e servidor.
- O `proxy` encapsula a complexidade do encaminhamento em uma API simples.
- É necessário um servidor HTTP criado com `node:http` para o pacote se conectar.
- O método `listen` inicializa o proxy, permitindo que ele comece a encaminhar o tráfego.

Próxima vez que precisar intermediar o tráfego entre servidores no Node.js, lembre-se: o pacote `proxy` é uma das formas mais diretas de implementar isso.
