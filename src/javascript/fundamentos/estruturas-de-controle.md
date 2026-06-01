# Estruturas de controle

O JavaScript oferece várias estruturas de controle para gerenciar o fluxo de execução do código, incluindo:

## Estruturas de decisão: `if`, `else if`, `else`, `switch`

As estruturas de decisão permitem que o código execute diferentes blocos de código com base em condições específicas. O `if` é usado para verificar uma condição, o `else if` para verificar condições adicionais, e o `else` para lidar com o caso em que todas as condições anteriores são falsas. O `switch` é uma alternativa ao `if...else if...else` quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

### If...else

O `if` é usado para executar um bloco de código se uma condição for verdadeira. O `else` é usado para executar um bloco de código se a condição do `if` for falsa.

````javascript
const idade = 18

if (idade >= 18) {
  console.info("Você é maior de idade.")
} else {
  console.info("Você é menor de idade.")
}
````

```output
Você é maior de idade.
```

### Else if

O `else if` é usado para verificar múltiplas condições em sequência. Ele permite que você teste várias expressões e execute diferentes blocos de código com base no resultado de cada expressão.

```javascript
const nota = 85

if (nota >= 90) {
  console.info("Parabéns! Você tirou uma nota excelente.")
} else if (nota >= 80) {
  console.info("Bom trabalho! Você tirou uma boa nota.")
} else {
  console.info("Você precisa melhorar. Estude mais para a próxima vez.")
}
```

```output
Bom trabalho! Você tirou uma boa nota.
```

### Switch

O `switch` é uma estrutura de controle que permite executar diferentes blocos de código com base no valor de uma expressão. Ele é útil quando se tem várias condições a serem verificadas, tornando o código mais legível e organizado.

```javascript
const fruta = "maçã"

switch (fruta) {
  case "maçã":
    console.info("Você escolheu uma maçã.")
    break;
  case "banana":
    console.info("Você escolheu uma banana.")
    break;
  default:
    console.info("Você escolheu uma fruta diferente.")
}
```

```output
Você escolheu uma maçã.
```

## Estruturas de loop: `for in`, `for of`, `while`, `do...while`

Os loops são usados para executar um bloco de código repetidamente enquanto uma condição for verdadeira. O JavaScript oferece diferentes tipos de loops para atender a diferentes necessidades de iteração.

### For...in

O loop `for...in` é usado para iterar sobre as propriedades enumeráveis de um objeto. Ele percorre as chaves do objeto, permitindo acessar os valores correspondentes.

```javascript
const pessoa = { nome: "João", idade: 30 }

for (const chave in pessoa) {
  console.info(chave) // Imprime as chaves do objeto
}
```

```output
nome
idade
```

### For...of

O loop `for...of` é usado para iterar sobre objetos iteráveis, como arrays, strings, mapas, conjuntos, entre outros. Ele percorre os valores dos elementos do objeto iterável.

```javascript
const frutas = ["maçã", "banana", "laranja"]
for (const fruta of frutas) {
  console.info(fruta) // Imprime os valores do array
}
```

```output
maçã
banana
laranja
```

### While

O loop `while` executa um bloco de código enquanto uma condição especificada for verdadeira. Ele verifica a condição antes de cada iteração.

```javascript
let contador = 0
while (contador < 5) {
  console.info(contador)
  contador++
}
```

```output
0
1
2
3
4
```

### Do...while

O loop `do...while` é semelhante ao `while`, mas a condição é verificada após a execução do bloco de código, garantindo que o bloco seja executado pelo menos uma vez.

```javascript
let contador = 0
do {
  console.info(contador)
  contador++
} while (contador < 5)
```

```output
0
1
2
3
4
```

