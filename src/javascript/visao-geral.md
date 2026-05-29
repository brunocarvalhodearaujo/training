# JavaScript e Node.js

O JavaScript® (às vezes abreviado para JS) é uma linguagem de programação amplamente utilizada para desenvolvimento web, permitindo a criação de páginas interativas e dinâmicas. Ele é executado no lado do cliente (navegador) e também pode ser utilizado no lado do servidor (Node.js). O JavaScript é uma linguagem de alto nível, interpretada e parcialmente orientada a objetos, que suporta paradigmas de programação funcional e imperativa.

Uma recomendação de leitura para se aprofundar mais sobre JavaScript é a [documentação oficial do MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript), que oferece uma ampla variedade de recursos, tutoriais e referências para desenvolvedores de todos os níveis, vale ressaltar que o MDN pode ser utilizado como uma fonte de consulta para aprender sobre as funcionalidades do JavaScript e suas APIs e é mantido pela Mozilla.

## Fundamentos do JavaScript

### Variáveis

O JavaScript utiliza `var`, `let` e `const` para declarar variáveis. `var` tem escopo de função, enquanto `let` e `const` têm escopo de bloco. `const` é usado para valores que não devem ser reatribuídos.

Você pode declarar variáveis usando:

```javascript
var nome = "João" // Variável global ou de função, não recomendado para uso moderno
let idade = 30
const PI = 3.14 // Valor constante
```

### Tipos de dados

O JavaScript possui vários tipos de dados, incluindo:

- `string`: para texto, por exemplo, `"Olá, mundo!"`
- `number`: para números, por exemplo, `42` ou `3.14`
- `boolean`: para valores verdadeiros ou falsos, por exemplo, `true` ou `false`
- `object`: para objetos, por exemplo, `{ nome: "João", idade: 30 }`
- `undefined`: para variáveis que foram declaradas mas não inicializadas
- `null`: para representar a ausência de valor

E por se tratar de uma linguagem de tipagem dinâmica, o JavaScript permite que as variáveis possam conter valores de diferentes tipos ao longo do tempo, o que pode levar a comportamentos inesperados se não for gerenciado corretamente. Além disso não é necessário declarar o tipo de uma variável, pois o JavaScript infere o tipo com base no valor atribuído a ela.


### Estruturas de controle

O JavaScript oferece várias estruturas de controle para gerenciar o fluxo de execução do código, incluindo:

#### Estruturas de decisão: `if`, `else if`, `else`, `switch`

As estruturas de decisão permitem que o código execute diferentes blocos de código com base em condições específicas. O `if` é usado para verificar uma condição, o `else if` para verificar condições adicionais, e o `else` para lidar com o caso em que todas as condições anteriores são falsas. O `switch` é uma alternativa ao `if...else if...else` quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

##### If...else

O `if` é usado para executar um bloco de código se uma condição for verdadeira. O `else` é usado para executar um bloco de código se a condição do `if` for falsa.

````javascript
const idade = 18

if (idade >= 18) {
  // código a ser executado se a condição for verdadeira
} else {
  // código a ser executado se a condição for falsa
}
````

##### Else if

O `else if` é usado para verificar múltiplas condições em sequência. Ele permite que você teste várias expressões e execute diferentes blocos de código com base no resultado de cada expressão.

```javascript
const nota = 85

if (nota >= 90) {
  // código a ser executado se a nota for maior ou igual a 90
} else if (nota >= 80) {
  // código a ser executado se a nota for maior ou igual a 80 e menor que 90
} else {
  // código a ser executado se a nota for menor que 80
}
```

##### Switch

O `switch` é uma estrutura de controle que permite executar diferentes blocos de código com base no valor de uma expressão. Ele é útil quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

```javascript
const fruta = "maçã"

switch (fruta) {
  case "maçã":
    // código a ser executado se a expressão for igual a "maçã"
    break;
  case "banana":
    // código a ser executado se a expressão for igual a "banana"
    break;
  default:
    // código a ser executado se a expressão não for igual a nenhum dos casos anteriores
}
```

#### Estruturas de loop: `for in`, `for of`, `while`, `do...while`

Os loops são usados para executar um bloco de código repetidamente enquanto uma condição for verdadeira. O JavaScript oferece diferentes tipos de loops para atender a diferentes necessidades de iteração.

##### For...in

O loop `for...in` é usado para iterar sobre as propriedades enumeráveis de um objeto. Ele percorre as chaves do objeto, permitindo acessar os valores correspondentes.

```javascript
const pessoa = { nome: "João", idade: 30 }

for (const chave in pessoa) {
  console.info(chave) // Imprime as chaves do objeto
}
```

##### For...of

O loop `for...of` é usado para iterar sobre objetos iteráveis, como arrays, strings, mapas, conjuntos, entre outros. Ele percorre os valores dos elementos do objeto iterável.

```javascript
const frutas = ["maçã", "banana", "laranja"]
for (const fruta of frutas) {
  console.info(fruta) // Imprime os valores do array
}
```

##### While

O loop `while` executa um bloco de código enquanto uma condição especificada for verdadeira. Ele verifica a condição antes de cada iteração.

```javascript
let contador = 0
while (contador < 5) {
  console.info(contador)
  contador++
}
```

##### Do...while

O loop `do...while` é semelhante ao `while`, mas a condição é verificada após a execução do bloco de código, garantindo que o bloco seja executado pelo menos uma vez.

```javascript
let contador = 0
do {
  console.info(contador)
  contador++
} while (contador < 5)
```

### Funções

As funções são blocos de código reutilizáveis que realizam uma tarefa específica. Elas podem ser declaradas usando a palavra-chave `function` ou como expressões de função. As funções podem receber parâmetros e retornar valores.

```javascript
function saudacao(nome) {
  return `Olá, ${nome}!`
}
const mensagem = saudacao("João") // mensagem é "Olá, João!"
```

#### Funções em flecha (arrow functions)

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

#### Funções anônimas

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

### Arrays e objetos

O JavaScript possui estruturas de dados fundamentais, como arrays e objetos, que permitem armazenar e organizar informações de maneira eficiente.

#### Arrays

Os arrays são usados para armazenar uma coleção de elementos ordenados. Eles podem conter qualquer tipo de dado, incluindo outros arrays e objetos.

```javascript
const frutas = ["maçã", "banana", "laranja"]
console.info(frutas) // Imprime ["maçã", "banana", "laranja"]
console.info(frutas[0]) // Imprime "maçã"
console.info(frutas.length) // Imprime 3
```

##### Métodos de manipulação de arrays

O JavaScript oferece uma variedade de métodos para manipular arrays, como `push`, `pop`, `shift`, `unshift`, `slice`, `splice`, entre outros. Esses métodos permitem adicionar, remover e modificar elementos em um array de maneira eficiente.

- `length`: Retorna o número de elementos em um array.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    console.info(frutas.length) // Imprime 3
    ```
- `push`: Adiciona um ou mais elementos ao final de um array.
    ````javascript
    const frutas = ["maçã", "banana"]
    frutas.push("laranja") // O array agora é ["maçã", "banana", "laranja"]
    ````
- `pop`: Remove o último elemento de um array e o retorna.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    const ultimaFruta = frutas.pop() // O array agora é ["maçã", "banana"] e ultimaFruta é "laranja"
    ```
- `shift`: Remove o primeiro elemento de um array e o retorna.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    const primeiraFruta = frutas.shift() // O array agora é ["banana", "laranja"] e primeiraFruta é "maçã"
    ```
- `unshift`: Adiciona um ou mais elementos ao início de um array.
    ```javascript
    const frutas = ["banana", "laranja"]
    frutas.unshift("maçã") // O array agora é ["maçã", "banana", "laranja"]
    ```
- `slice`: Retorna uma cópia de uma parte do array dentro de um novo array, sem modificar o array original.
    ```javascript
    const frutas = ["maçã", "banana", "laranja", "uva"]
    const frutasSelecionadas = frutas.slice(1, 3) // frutasSelecionadas é ["banana", "laranja"] e o array original permanece ["maçã", "banana", "laranja", "uva"]
    ```
- `splice`: Altera o conteúdo de um array, adicionando, removendo ou substituindo elementos.
    ```javascript
    const frutas = ["maçã", "banana", "laranja", "uva"]
    frutas.splice(1, 2, "abacaxi") // O array agora é ["maçã", "abacaxi", "uva"] (remove "banana" e "laranja" e adiciona "abacaxi" no lugar)
    ```
- `map`: Cria um novo array com os resultados da chamada de uma função para cada elemento do array.
    ```javascript
    const numeros = [1, 2, 3]
    const quadrados = numeros.map(num => num * num) // quadrados é [1, 4, 9]
    ```
- `filter`: Cria um novo array com todos os elementos que passam no teste implementado pelo callback.
    ```javascript
    const numeros = [1, 2, 3, 4, 5]
    const pares = numeros.filter(num => num > 2) // pares é [3, 4, 5]
    ```
- `reduce`: Aplica uma função a um acumulador e a cada valor do array (da esquerda para a direita) para reduzi-lo a um único valor.
    ```javascript
    const numeros = [1, 2, 3, 4]
    const soma = numeros.reduce((acumulador, valor) => acumulador + valor, 0) // soma é 10
    ```
- `forEach`: Executa uma função para cada elemento do array.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    frutas.forEach(fruta => console.info(fruta)) // Imprime cada fruta no console
    ```
- `find`: Retorna o valor do primeiro elemento do array que satisfaz a função de teste fornecida.
    ```javascript
    const numeros = [1, 2, 3, 4]
    const numeroPar = numeros.find(num => num % 2 === 0) // numeroPar é 2
    ```
- `findIndex`: Retorna o índice do primeiro elemento do array que satisfaz a função de teste fornecida, ou -1 se nenhum elemento satisfizer a função de teste.
    ```javascript
    const numeros = [1, 2, 3, 4]
    const indiceNumeroPar = numeros.findIndex(num => num % 2 === 0) // indiceNumeroPar é 1
    ```
- `includes`: Verifica se um array inclui um determinado elemento, retornando true ou false.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    const temBanana = frutas.includes("banana") // temBanana é true
    ```
- `concat`: Retorna um novo array que é a combinação de dois ou mais arrays.
    ```javascript
    const array1 = [1, 2]
    const array2 = [3, 4]
    const arrayConcatenado = array1.concat(array2) // arrayConcatenado é [1, 2, 3, 4]
    ```
- `some`: Verifica se pelo menos um elemento do array satisfaz a função de teste fornecida.
    ```javascript
    const numeros = [1, 2, 3, 4]
    const temNumeroPar = numeros.some(num => num % 2 === 0) // temNumeroPar é true
    ```
- `every`: Verifica se todos os elementos do array satisfazem a função de teste fornecida.
    ```javascript
    const numeros = [2, 4, 6]
    const todosPares = numeros.every(num => num % 2 === 0) // todosPares é true
    ```

### Promises e async/await para programação assíncrona
