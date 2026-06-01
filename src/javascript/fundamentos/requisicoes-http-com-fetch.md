# Requisições HTTP com Fetch

O Fetch API é uma interface JavaScript que permite fazer requisições HTTP de forma fácil e eficiente. Ele é baseado em Promises, o que torna o código mais legível e fácil de trabalhar com operações assíncronas. Com o Fetch API, você pode enviar requisições para servidores, obter respostas e manipular os dados recebidos de maneira simples.

## Exemplo de uso do Fetch API

```javascript
fetch('https://viacep.com.br/ws/01001000/json')
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
  cep: '01001-000',
  logradouro: 'Praça da Sé',
  complemento: 'lado ímpar',
  unidade: '',
  bairro: 'Sé',
  localidade: 'São Paulo',
  uf: 'SP',
  estado: 'São Paulo',
  regiao: 'Sudeste',
  ibge: '3550308',
  gia: '1004',
  ddd: '11',
  siafi: '7107'
}
```

Abaixo a mesma requisição utilizando `async`/`await` para uma sintaxe mais limpa e fácil de entender:

```javascript
async function fetchData() {
  try {
    const response = await fetch('https://viacep.com.br/ws/01001000/json')
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
  cep: '01001-000',
  logradouro: 'Praça da Sé',
  complemento: 'lado ímpar',
  unidade: '',
  bairro: 'Sé',
  localidade: 'São Paulo',
  uf: 'SP',
  estado: 'São Paulo',
  regiao: 'Sudeste',
  ibge: '3550308',
  gia: '1004',
  ddd: '11',
  siafi: '7107'
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

const response = await fetch('https://viacep.com.br/ws/01001000/json', requestOptions)

if (!response.ok) {
  throw new Error('Erro na requisição: ' + response.status)
}
const data = await response.json()
console.log(data)
```

```output
{
  cep: '01001-000',
  logradouro: 'Praça da Sé',
  complemento: 'lado ímpar',
  unidade: '',
  bairro: 'Sé',
  localidade: 'São Paulo',
  uf: 'SP',
  estado: 'São Paulo',
  regiao: 'Sudeste',
  ibge: '3550308',
  gia: '1004',
  ddd: '11',
  siafi: '7107'
}
```
  

## Referencias

- [Fetch API - MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/API/Fetch_API)
- [Fetch Living Standard — Last Updated 8 May 2026](https://fetch.spec.whatwg.org/#fetch-method)
