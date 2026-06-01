# Arrays e objetos

O JavaScript possui estruturas de dados fundamentais, como arrays e objetos, que permitem armazenar e organizar informações de maneira eficiente.

## Arrays

Os arrays são usados para armazenar uma coleção de elementos ordenados. Eles podem conter qualquer tipo de dado, incluindo outros arrays e objetos.

```javascript
const frutas = ["maçã", "banana", "laranja"]
console.info(frutas) // Imprime ["maçã", "banana", "laranja"]
console.info(frutas[0]) // Imprime "maçã"
console.info(frutas.length) // Imprime 3
```

### Métodos de manipulação de arrays

O JavaScript oferece uma variedade de métodos para manipular arrays, como `push`, `pop`, `shift`, `unshift`, `slice`, `splice`, entre outros. Esses métodos permitem adicionar, remover e modificar elementos em um array de maneira eficiente.

- `length`: Retorna o número de elementos em um array.
    ```javascript
    const frutas = ["maçã", "banana", "laranja"]
    console.info(frutas.length) // Imprime 3
    ```
- `push`: Adiciona um ou mais elementos ao final de um array.
    ```javascript
    const frutas = ["maçã", "banana"]
    frutas.push("laranja") // O array agora é ["maçã", "banana", "laranja"]
    ```
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
