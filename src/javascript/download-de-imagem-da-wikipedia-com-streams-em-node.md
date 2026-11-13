# Download de Imagem da Wikipedia com Streams em Node.js

Você já se perguntou como é possível transferir uma imagem da Wikipedia para o seu computador de forma eficiente, sem precisar carregar todo o arquivo na memória ao mesmo tempo? Neste artigo você vai entender como funciona o download de um arquivo em **streams** e como aplicá-lo no Node.js para buscar uma imagem diretamente do repositório público da Wikipedia.

Ao final, você terá um exemplo prático, compreendido linha a linha, que utiliza apenas as ferramentas nativas do Node.js (junto com o pacote leve `undici`) para realizar o download de forma controlada e com suporte a erros.

---

## Por que usar streams?

Muitos programas carregam um arquivo inteiro na memória RAM antes de processá-lo. Para arquivos pequenos isso é irrelevante, mas imagine tentar baixar um vídeo de 5 GB ou um pacote de atualizações de vários gigabytes: a memória do computador seria consumida rapidamente e o processo poderia travar.

Os **streams** resolvem esse problema. Em vez de carregar tudo de uma vez, um stream transfere os dados em pequenos pedaços — chamados de *chunks* ou *barragens* — de uma origem para um destino. Isso significa:

- **Eficiência de memória**: apenas uma parte do arquivo está "ativa" por vez.
- **Transferência contínua**: os dados são lidos e escritos à medida que chegam.
- **Escalabilidade**: funciona bem tanto para arquivos pequenos quanto para os maiores.

A Wikipedia, por exemplo, permite baixar arquivos em seu repositório `commons`. Ao usarmos um stream, conseguimos baixar imagens e outros arquivos sem preocupações com memória.

---

## Como funciona o exemplo

O código abaixo realiza o download de uma imagem da Wikipedia e a salva localmente como `flower.jpg`, utilizando streams. Vamos destrinchar cada etapa.

### 1. Construindo a URL

```js
const url = new URL('https://upload.wikimedia.org')
url.pathname = '/wikipedia/commons/3/3f/JPEG_example_flower.jpg'
```

Começamos com um objeto `URL` apontando para o domínio principal de uploads da Wikipedia (`upload.wikimedia.org`). Em seguida, sobrescrevemos o `pathname` com a rota que leva à imagem desejada. O resultado final é uma URL completa e pronta para ser solicitada.

### 2. Fazendo a requisição

```js
const requestOptions = {
  method: 'GET',
  signal: AbortSignal.timeout(5 * 60 * 1000) // 5 minutes timeout
}

const response = await fetch(url, requestOptions)

if (!response.ok) {
  throw new Error(`Failed to download instance. Status: ${response.status}`)
}
```

Aqui usamos o `fetch` para enviar uma requisição `GET` para a URL construída. Um detalhe importante é o uso de `AbortSignal.timeout`, que estabelece um limite de tempo de espera de 5 minutos. Se o download demorar mais do que isso, a requisição é cancelada automaticamente, evitando que o programa fique travado indefinidamente.

Antes de continuar, verificamos se a resposta veio com sucesso por meio da propriedade `response.ok`. Caso contrário, lançamos um erro com o código de status retornado, garantindo que o problema seja sinalizado claramente.

### 3. Convertendo a resposta em stream

```js
const webStream = response.body
return Readable.from(webStream, { highWaterMark: 1024 * 1024 * 10 })
```

O corpo da resposta do `fetch` já é um *web stream*. Para podermos usá-lo com a API de streams do Node.js, o pacote `Readable` do módulo `node:stream` recria um stream legível (`Readable`) a partir desse objeto, passando o parâmetro `highWaterMark` para controlar o ponto em que o stream considera-se "dentro" do limite de backpressure.

### 4. Escrivendo os dados no disco

```js
const fileStream = createWriteStream('flower.jpg')
stream.pipe(fileStream)

fileStream.on('finish', () => {
  console.log('Download completed successfully.')
})

fileStream.on('error', (error) => {
  console.error(`Error writing to file: ${error.message}`)
})
```

Por fim, criamos um *write stream* (`createWriteStream`) que representa o arquivo `flower.jpg` no disco. A mágica acontece com o método `.pipe()`: ele conecta automaticamente o stream de download ao arquivo, transferindo os dados de uma ponta para a outra sem intervenção manual.

Enquanto isso, registramos dois *event listeners*:

- `'finish'` dispara quando todos os dados foram escritos corretamente, permitindo que saibamos que o download concluiu.
- `'error'` dispara caso algum problema aconteça ao gravar o arquivo, como disco cheio ou permissão negada.

---

## Código completo

```js
import { createWriteStream } from 'node:fs'
import { Readable } from 'node:stream'
import { fetch } from 'undici'

async function download() {
  const url = new URL('https://upload.wikimedia.org')
  url.pathname = '/wikipedia/commons/3/3f/JPEG_example_flower.jpg'

  const requestOptions = {
    method: 'GET',
    signal: AbortSignal.timeout(5 * 60 * 1000) // 5 minutes timeout
  }

  console.info(`Starting download from: ${url.toString()}`)

  const response = await fetch(url, requestOptions)

  if (!response.ok) {
    throw new Error(`Failed to download instance. Status: ${response.status}`)
  }

  const webStream = response.body
  return Readable.from(webStream, { highWaterMark: 1024 * 1024 * 10 })
}

async function main() {
  const stream = await download()

  const fileStream = createWriteStream('flower.jpg')
  stream.pipe(fileStream)

  fileStream.on('finish', () => {
    console.log('Download completed successfully.')
  })

  fileStream.on('error', (error) => {
    console.error(`Error writing to file: ${error.message}`)
  })
}

main().catch((error) => console.error(`Unexpected error: ${error.message}`))
```

---

## Conclusão

Com apenas algumas linhas de código e o uso de streams, foi possível baixar uma imagem da Wikipedia de forma eficiente e com controle sobre erros e tempo de execução. Aprendemos que:

- Streams evitam o consumo excessivo de memória ao transferir dados em pedaços.
- O `fetch` do `undici` oferece uma forma moderna e assíncrona de fazer requisições HTTP.
- O método `.pipe()` simplifica a transferência de dados de um stream para outro.
- Event listeners como `'finish'` e `'error'` tornam o controle do fluxo de trabalho mais robusto.

Próxima vez que precisar transferir um arquivo grande no Node.js, lembre-se: streams são a ferramenta certa para o trabalho.
