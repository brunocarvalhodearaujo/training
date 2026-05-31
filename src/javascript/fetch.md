# Fetch API

O Fetch API é uma interface JavaScript que permite fazer requisições HTTP de forma fácil e eficiente. Ele é baseado em Promises, o que torna o código mais legível e fácil de trabalhar com operações assíncronas. Com o Fetch API, você pode enviar requisições para servidores, obter respostas e manipular os dados recebidos de maneira simples.

## Exemplo de uso do Fetch API

```javascript
fetch('https://api.exemplo.com/dados')
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

Abaixo a mesma requisição utilizando async/await:

```javascript
async function fetchData() {
  try {
    const response = await fetch('https://api.exemplo.com/dados')
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

const response = await fetch('https://api.exemplo.com/dados', requestOptions)

if (!response.ok) {
  throw new Error('Erro na requisição: ' + response.status)
}
const data = await response.json()
console.log(data)
```
  
