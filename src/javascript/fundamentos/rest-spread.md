# Rest e Spread

O Rest e Spread são recursos do JavaScript que permitem trabalhar com arrays e objetos de forma mais flexível. O Rest é utilizado para coletar o restante dos elementos de um array ou propriedades de um objeto em uma variável, enquanto o Spread é utilizado para expandir os elementos de um array ou propriedades de um objeto em outro contexto.

## Rest

O Rest é representado por três pontos (`...`) e é utilizado para coletar o restante dos elementos de um array ou propriedades de um objeto em uma variável. Ele é comumente usado em funções para lidar com um número variável de argumentos.

```javascript
function sum(...numbers) {
  return numbers.reduce((total, num) => total + num, 0)
}
console.log(sum(1, 2, 3))
```

```output
6
```

## Spread

O Spread também é representado por três pontos (`...`) e é utilizado para expandir os elementos de um array ou propriedades de um objeto em outro contexto. Ele é comumente usado para criar cópias de arrays ou objetos, ou para combinar arrays ou objetos.

```javascript
const arr1 = [1, 2, 3]
const arr2 = [...arr1, 4, 5]
console.log(arr2)
```

```output
[ 1, 2, 3, 4, 5 ]
```
