# Utilidades

## Formatar moedas

Caso queira formatar um valor monetário, o método `toLocaleString` é uma ótima opção. Ele recebe dois parâmetros: o primeiro é a localidade (idioma e região) e o segundo é um objeto de opções onde podemos especificar o estilo como 'currency' e a moeda desejada.

```javascript
const amount = 59.90

const currencyBRL = (value) => {
  const options = { style: 'currency', currency: 'BRL' }
  return value.toLocaleString('pt-BR', options)
}

const currencyUSD = (value) => {
  const options = { style: 'currency', currency: 'USD' }
  return value.toLocaleString('en-US', options)
}

console.log(currencyBRL(amount))
console.log(currencyUSD(amount))
```

```output
R$ 59,90
$59.90
```
