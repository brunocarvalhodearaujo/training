# Arrays e objetos

O JavaScript possui estruturas de dados fundamentais, como arrays e objetos, que permitem armazenar e organizar informações de maneira eficiente.

## Arrays

Os arrays são usados para armazenar uma coleção de elementos ordenados. Eles podem conter qualquer tipo de dado, incluindo outros arrays e objetos.

```javascript
const frutas = ["maçã", "banana", "laranja"]
console.info(frutas)
console.info(frutas[0])
console.info(frutas.length)
```

```output
[ 'maçã', 'banana', 'laranja' ]
maçã
3
```

### Métodos de manipulação de arrays

O JavaScript oferece uma variedade de métodos para manipular arrays, como `push`, `pop`, `shift`, `unshift`, `slice`, `splice`, entre outros. Esses métodos permitem adicionar, remover e modificar elementos em um array de maneira eficiente.

#### `length`

Retorna o número de elementos em um array.

```javascript
const frutas = ["maçã", "banana", "laranja"]
console.info(frutas.length) // Imprime 3
```

```output
3
```

#### `push`

Adiciona um ou mais elementos ao final de um array.

```javascript
const frutas = ["maçã", "banana"]
frutas.push("laranja")
console.info(frutas)
```

```output
[ 'maçã', 'banana', 'laranja' ]
```

#### `pop`

Remove o último elemento de um array e o retorna.

```javascript
const frutas = ["maçã", "banana", "laranja"]
const ultimaFruta = frutas.pop()
console.info(frutas)
console.info(ultimaFruta)
```

```output
[ 'maçã', 'banana' ]
laranja
```

#### `shift`

Remove o primeiro elemento de um array e o retorna.

```javascript
const frutas = ["maçã", "banana", "laranja"]
const primeiraFruta = frutas.shift()
console.info(frutas)
console.info(primeiraFruta)
```

```output
[ 'banana', 'laranja' ]
maçã
```

#### `unshift`

Adiciona um ou mais elementos ao início de um array.

```javascript
const frutas = ["banana", "laranja"]
frutas.unshift("maçã")
console.info(frutas)
```

```output
[ 'maçã', 'banana', 'laranja' ]
```

#### `slice`

Retorna uma cópia de uma parte do array dentro de um novo array, sem modificar o array original.

```javascript
const frutas = ["maçã", "banana", "laranja", "uva"]
const frutasSelecionadas = frutas.slice(1, 3)
console.info(frutasSelecionadas)
console.info(frutas)
```

```output
[ 'banana', 'laranja' ]
[ 'maçã', 'banana', 'laranja', 'uva' ]
```

#### `splice`

Altera o conteúdo de um array, adicionando, removendo ou substituindo elementos.

```javascript
const frutas = ["maçã", "banana", "laranja", "uva"]
frutas.splice(1, 2, "abacaxi") // O array agora é ["maçã", "abacaxi", "uva"] (remove "banana" e "laranja" e adiciona "abacaxi" no lugar)
console.info(frutas) // Imprime ["maçã", "abacaxi", "uva"]
```

```output
[ 'maçã', 'abacaxi', 'uva' ]
```

#### `map`

Cria um novo array com os resultados da chamada de uma função para cada elemento do array.

```javascript
const numeros = [1, 2, 3]
const quadrados = numeros.map(num => num * num) // quadrados é [1, 4, 9]
console.info(quadrados)
```

```output
[ 1, 4, 9 ]
```

#### `filter`

Cria um novo array com todos os elementos que passam no teste implementado pelo callback.

```javascript
const numeros = [1, 2, 3, 4, 5]
const pares = numeros.filter(num => num > 2) // pares é [3, 4, 5]
console.info(pares)
```

```output
[ 3, 4, 5 ]
```

#### `reduce`

Aplica uma função a um acumulador e a cada valor do array (da esquerda para a direita) para reduzi-lo a um único valor.

```javascript
const numeros = [1, 2, 3, 4]
const soma = numeros.reduce((acumulador, valor) => acumulador + valor, 0)
console.info(soma)
```

```output
10
```

#### `forEach`

Executa uma função para cada elemento do array.

```javascript
const frutas = ["maçã", "banana", "laranja"]
frutas.forEach(fruta => console.info(fruta)) // Imprime cada fruta no console
```

```output
maçã
banana
laranja
```

#### `find`

Retorna o valor do primeiro elemento do array que satisfaz a função de teste fornecida.

```javascript
const numeros = [1, 2, 3, 4]
const numeroPar = numeros.find(num => num % 2 === 0) // numeroPar é 2
console.info(numeroPar)
```

```output
2
```

#### `findIndex`

Retorna o índice do primeiro elemento do array que satisfaz a função de teste fornecida, ou -1 se nenhum elemento satisfizer a função de teste.

```javascript
const numeros = [1, 2, 3, 4]
const indiceNumeroPar = numeros.findIndex(num => num % 2 === 0) // indiceNumeroPar é 1
console.info(indiceNumeroPar)
```

```output
1
```

#### `includes`

Verifica se um array inclui um determinado elemento, retornando true ou false.

```javascript
const frutas = ["maçã", "banana", "laranja"]
const temBanana = frutas.includes("banana") // temBanana é true
console.info(temBanana)
```

```output
true
```

#### `concat`

Retorna um novo array que é a combinação de dois ou mais arrays.

```javascript
const array1 = [1, 2]
const array2 = [3, 4]
const arrayConcatenado = array1.concat(array2)
console.info(arrayConcatenado)
```

```output
[ 1, 2, 3, 4 ]
```

#### `some`

Verifica se pelo menos um elemento do array satisfaz a função de teste fornecida.

```javascript
const numeros = [1, 2, 3, 4]
const temNumeroPar = numeros.some(num => num % 2 === 0)
console.info(temNumeroPar)
```

```output
true
```

#### `every`

Verifica se todos os elementos do array satisfazem a função de teste fornecida.

```javascript
const numeros = [2, 4, 6]
const todosPares = numeros.every(num => num % 2 === 0)
console.info(todosPares)
```

```output
true
```

#### `sort`

Ordena os elementos de um array in-place e retorna o array.

```javascript
const frutas = ["banana", "maçã", "laranja"]
frutas.sort()
console.info(frutas)
```

```output
[ 'banana', 'laranja', 'maçã' ]
```

#### `reverse`

Inverte a ordem dos elementos de um array in-place e retorna o array.

```javascript
const numeros = [1, 2, 3, 4]
numeros.reverse()
console.info(numeros)
```

```output
[ 4, 3, 2, 1 ]
```

#### `join`

Une todos os elementos de um array em uma string, usando um separador especificado.

```javascript
const frutas = ["maçã", "banana", "laranja"]
const frutasString = frutas.join(", ")
console.info(frutasString)
```

```output
maçã, banana, laranja
```

#### `split`

Divide uma string em um array de substrings, usando um separador especificado.

```javascript
const frutasString = "maçã, banana, laranja"
const frutasArray = frutasString.split(", ")
console.info(frutasArray)
```

```output
[ 'maçã', 'banana', 'laranja' ]
```

#### `indexOf`

Retorna o primeiro índice em que um elemento pode ser encontrado no array, ou -1 se não estiver presente.

```javascript
const frutas = ["maçã", "banana", "laranja"]
const indiceBanana = frutas.indexOf("banana")
console.info(indiceBanana)
```

```output
1
```

#### `lastIndexOf`

Retorna o último índice em que um elemento pode ser encontrado no array, ou -1 se não estiver presente.

```javascript
const frutas = ["maçã", "banana", "laranja", "banana"]
const ultimoIndiceBanana = frutas.lastIndexOf("banana")
console.info(ultimoIndiceBanana)
```

```output
3
```

#### `length`

Retorna o número de elementos em um array.

```javascript
const frutas = ["maçã", "banana", "laranja"]
console.info(frutas.length)
```

```output
3
```

> Vale ressaltar que as funções de manipulação de arrays também podem ser usadas em objetos do tipo `String`, pois as strings são tratadas como arrays de caracteres em JavaScript.
