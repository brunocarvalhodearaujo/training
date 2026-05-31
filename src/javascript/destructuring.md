# Destructuring

O destructuring é um recurso do JavaScript que permite extrair valores de arrays ou propriedades de objetos e atribuí-los a variáveis de forma mais concisa e legível. Ele pode ser usado tanto para arrays quanto para objetos, e é especialmente útil quando queremos acessar apenas algumas partes de uma estrutura de dados complexa.

## Destructuring de Arrays

O destructuring de arrays permite extrair valores de um array e atribuí-los a variáveis correspondentes. A sintaxe é simples e direta:

```javascript
const [a, b, c] = [1, 2, 3]
console.log(a) // 1
console.log(b) // 2
console.log(c) // 3
```

```output
1
2
3
```

Neste exemplo, as variáveis `a`, `b` e `c` recebem os valores correspondentes do array `[1, 2, 3]`. Podemos também usar o destructuring para ignorar certos valores:

```javascript
const [x, , z] = [10, 20, 30]
console.log(x) // 10
console.log(z) // 30
```

```output
10
30
```

## Destructuring de Objetos

O destructuring de objetos permite extrair propriedades de um objeto e atribuí-las a variáveis correspondentes. A sintaxe é semelhante à do destructuring de arrays, mas usamos chaves em vez de colchetes:

```javascript
const { name, age } = { name: 'Alice', age: 25 }
console.log(name) // 'Alice'
console.log(age) // 25
```

```output
Alice
25
```

Neste exemplo, as variáveis `name` e `age` recebem os valores correspondentes das propriedades do objeto. Podemos também usar o destructuring para renomear as variáveis:

```javascript
const { name: fullName, age: years } = { name: 'Bob', age: 30 }
console.log(fullName) // 'Bob'
console.log(years) // 30
```

```output
Bob
30
```

O destructuring é uma ferramenta poderosa que torna o código mais limpo e fácil de entender, especialmente quando lidamos com estruturas de dados complexas. Ele é amplamente utilizado em JavaScript moderno e é uma parte essencial do desenvolvimento web.

## Referências

[MDN Web Docs - Destructuring assignment](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
