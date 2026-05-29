# JavaScript e Node.js

O JavaScript® (às vezes abreviado para JS) é uma linguagem de programação amplamente utilizada para desenvolvimento web, permitindo a criação de páginas interativas e dinâmicas. Ele é executado no lado do cliente (navegador) e também pode ser utilizado no lado do servidor (Node.js). O JavaScript é uma linguagem de alto nível, interpretada e parcialmente orientada a objetos, que suporta paradigmas de programação funcional e imperativa.

Uma recomendação de leitura para se aprofundar mais sobre JavaScript é a [documentação oficial do MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript), que oferece uma ampla variedade de recursos, tutoriais e referências para desenvolvedores de todos os níveis, vale ressaltar que o MDN pode ser utilizado como uma fonte de consulta para aprender sobre as funcionalidades do JavaScript e suas APIs e é mantido pela Mozilla.

## Fundamentos do JavaScript

### Variáveis

O JavaScript utiliza `var`, `let` e `const` para declarar variáveis. `var` tem escopo de função, enquanto `let` e `const` têm escopo de bloco. `const` é usado para valores que não devem ser reatribuídos.

Você pode declarar variáveis usando:

```javascript
var nome = "João"; // Variável global ou de função, não recomendado para uso moderno
let idade = 30
const PI = 3.14; // Valor constante
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

### Estruturas de decisão: `if`, `else if`, `else`, `switch`

As estruturas de decisão permitem que o código execute diferentes blocos de código com base em condições específicas. O `if` é usado para verificar uma condição, o `else if` para verificar condições adicionais, e o `else` para lidar com o caso em que todas as condições anteriores são falsas. O `switch` é uma alternativa ao `if...else if...else` quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

#### If...else

O `if` é usado para executar um bloco de código se uma condição for verdadeira. O `else` é usado para executar um bloco de código se a condição do `if` for falsa.

````javascript
const idade = 18;

if (idade >= 18) {
  // código a ser executado se a condição for verdadeira
} else {
  // código a ser executado se a condição for falsa
}
````

#### Else if

O `else if` é usado para verificar múltiplas condições em sequência. Ele permite que você teste várias expressões e execute diferentes blocos de código com base no resultado de cada expressão.

```javascript
const nota = 85;

if (nota >= 90) {
  // código a ser executado se a nota for maior ou igual a 90
} else if (nota >= 80) {
  // código a ser executado se a nota for maior ou igual a 80 e menor que 90
} else {
  // código a ser executado se a nota for menor que 80
}
```

#### Switch

O `switch` é uma estrutura de controle que permite executar diferentes blocos de código com base no valor de uma expressão. Ele é útil quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

```javascript
const fruta = "maçã";

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

#### Loops: `for in`, `for of`, `while`, `do...while`

Os loops são usados para executar um bloco de código repetidamente enquanto uma condição for verdadeira. O JavaScript oferece diferentes tipos de loops para atender a diferentes necessidades de iteração.

##### For...in

O loop `for...in` é usado para iterar sobre as propriedades enumeráveis de um objeto. Ele percorre as chaves do objeto, permitindo acessar os valores correspondentes.

```javascript
const pessoa = { nome: "João", idade: 30 };
for (const chave in pessoa) {
  console.log(chave); // Imprime as chaves do objeto
}
```

##### For...of

O loop `for...of` é usado para iterar sobre objetos iteráveis, como arrays, strings, mapas, conjuntos, entre outros. Ele percorre os valores dos elementos do objeto iterável.

```javascript
const frutas = ["maçã", "banana", "laranja"];
for (const fruta of frutas) {
  console.log(fruta); // Imprime os valores do array
}
```

##### While

O loop `while` executa um bloco de código enquanto uma condição especificada for verdadeira. Ele verifica a condição antes de cada iteração.

```javascript
let contador = 0;
while (contador < 5) {
  console.log(contador);
  contador++;
}
```

##### Do...while

O loop `do...while` é semelhante ao `while`, mas a condição é verificada após a execução do bloco de código, garantindo que o bloco seja executado pelo menos uma vez.

```javascript
let contador = 0;
do {
  console.log(contador);
  contador++;
} while (contador < 5);
```


### Manipulação de arrays e objetos
### Promises e async/await para programação assíncrona