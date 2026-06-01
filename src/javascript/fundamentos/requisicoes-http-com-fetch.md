# Requisições HTTP com Fetch

O Fetch API é uma interface JavaScript que permite fazer requisições HTTP de forma fácil e eficiente. Ele é baseado em Promises, o que torna o código mais legível e fácil de trabalhar com operações assíncronas. Com o Fetch API, você pode enviar requisições para servidores, obter respostas e manipular os dados recebidos de maneira simples.

## Exemplo de uso do Fetch API

```javascript
fetch('https://viacep.com.br/ws/26130230/json')
  .then(response => {
    if (!response.ok) {
      throw new Error('Erro na requisição: ' + response.status)
    }
    return response.json()
  })
  .then(data => {
    console.log(data)
  })
  .catch(error => {
    console.error('Erro:', error)
  })
```

```output
{
  "cep": "26130-230",
  "logradouro": "Avenida Gonçalves Gatto",
  "complemento": "",
  "unidade": "",
  "bairro": "Centro",
  "localidade": "Belford Roxo",
  "uf": "RJ",
  "estado": "Rio de Janeiro",
  "regiao": "Sudeste",
  "ibge": "3300456",
  "gia": "",
  "ddd": "21",
  "siafi": "2909"
}
```

Abaixo a mesma requisição utilizando `async`/`await` para uma sintaxe mais limpa e fácil de entender:

```javascript
async function fetchData() {
  try {
    const response = await fetch('https://viacep.com.br/ws/26130230/json')
    if (!response.ok) {
      throw new Error('Erro na requisição: ' + response.status)
    }
    const data = await response.json()
    console.log(data)
  } catch (error) {
    console.error('Erro:', error)
  }
}

fetchData()
```

```output
{
  "cep": "26130-230",
  "logradouro": "Avenida Gonçalves Gatto",
  "complemento": "",
  "unidade": "",
  "bairro": "Centro",
  "localidade": "Belford Roxo",
  "uf": "RJ",
  "estado": "Rio de Janeiro",
  "regiao": "Sudeste",
  "ibge": "3300456",
  "gia": "",
  "ddd": "21",
  "siafi": "2909"
}
```

## Configurações adicionais

O Fetch API também permite configurar opções adicionais para as requisições, como método, cabeçalhos, corpo da requisição, entre outros. Por exemplo:

```javascript
/**
 * @type {RequestInit}
 */
const requestOptions = {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({ nome: 'Nova Tarefa', completed: false })
}

const response = await fetch('https://api.exemplo.com/tarefas', requestOptions)

if (!response.ok) {
  throw new Error('Erro na requisição: ' + response.status)
}
const data = await response.json()
console.log(data)
```

```output
{
  "id": 123,
  "nome": "Nova Tarefa",
  "completed": false
}
```

## Definindo o tempo máximo para a requisição

O fetch possui suporte a `AbortSignal.timeout()` para definir um tempo máximo para a requisição. Se a resposta não for recebida dentro do tempo especificado, a requisição será abortada.

```javascript
const requestOptions = {
  signal: AbortSignal.timeout(5000) // Define um tempo máximo de 5 segundos
}

try {
  const response = await fetch('https://api.exemplo.com/tarefas', requestOptions)
  if (!response.ok) {
    throw new Error('Erro na requisição: ' + response.status)
  }
  const data = await response.json()
  console.log(data)
} catch (error) {
  if (error.name === 'AbortError') {
    console.error('A requisição foi abortada devido ao tempo limite.')
  } else {
    console.error('Erro:', error)
  }
}
```

````output
A requisição foi abortada devido ao tempo limite.
```

## Referencias

- [Fetch API - MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/API/Fetch_API)
- [Fetch Living Standard — Last Updated 8 May 2026](https://fetch.spec.whatwg.org/#fetch-method)
