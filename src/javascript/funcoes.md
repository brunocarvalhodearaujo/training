# Funções

As funções são blocos de código reutilizáveis que realizam uma tarefa específica. Elas podem ser declaradas usando a palavra-chave `function` ou como expressões de função. As funções podem receber parâmetros e retornar valores.

```javascript
function saudacao(nome) {
  return `Olá, ${nome}!`
}

const mensagem = saudacao("João") // mensagem é "Olá, João!"
```

## Funções em flecha (arrow functions)

As funções em flecha são uma forma concisa de escrever funções em JavaScript. Elas são especialmente úteis para funções anônimas e callbacks.

```javascript
const saudacao = (nome) => {
  return `Olá, ${nome}!`
}

const mensagem = saudacao("João") // mensagem é "Olá, João!"
```

> É importante notar que as funções em flecha não possuem seu próprio `this`, `arguments`, `super` ou `new.target`, o que as torna inadequadas para certos casos, como métodos de objetos ou funções construtoras, Além disso é possível escrever a função em flecha de forma ainda mais concisa quando ela possui apenas um parâmetro e uma expressão de retorno:

```javascript
const saudacao = nome => `Olá, ${nome}!`
const mensagem = saudacao("João") // mensagem é "Olá, João!"
```

## Funções anônimas

As funções anônimas são funções que não possuem um nome. Elas são frequentemente usadas como argumentos para outras funções, como callbacks.

```javascript
setTimeout(function() {
  console.info("Esta mensagem será exibida após 2 segundos")
}, 2000)
```

Essa mesma função anônima pode ser escrita como uma função em flecha para uma sintaxe mais concisa:

```javascript
setTimeout(() => {
  console.info("Esta mensagem será exibida após 2 segundos")
}, 2000)
```
