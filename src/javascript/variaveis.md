# Variáveis

O JavaScript utiliza `var`, `let` e `const` para declarar variáveis. `var` tem escopo de função, enquanto `let` e `const` têm escopo de bloco. `const` é usado para valores que não devem ser reatribuídos.

Você pode declarar variáveis usando:

```javascript
var nome = "João" // Variável global ou de função
let idade = 30
const PI = 3.14 // Valor constante
```

O `var` é considerado obsoleto em muitos casos devido a problemas de escopo e hoisting, e é recomendado usar `let` e `const` para evitar esses problemas. O `let` permite que você reatribua valores, enquanto o `const` garante que o valor não seja alterado após a atribuição inicial. Por exemplo:

```javascript
let idade = 30
idade = 31 // Isso é permitido
```

```javascript
const PI = 3.14
PI = 3.14159 // Isso causará um erro, pois PI é uma constante
```

## Tipos de dados

O JavaScript possui vários tipos de dados, incluindo:

- `string`: para texto, por exemplo, `"Olá, mundo!"`
- `number`: para números, por exemplo, `42` ou `3.14`
- `boolean`: para valores verdadeiros ou falsos, por exemplo, `true` ou `false`
- `object`: para objetos, por exemplo, `{ nome: "João", idade: 30 }`
- `undefined`: para variáveis que foram declaradas mas não inicializadas
- `null`: para representar a ausência de valor
- `array`: para listas de valores, por exemplo, `[1, 2, 3]`
- `symbol`: para valores únicos e imutáveis, introduzido no ES6

E por se tratar de uma linguagem de tipagem dinâmica, o JavaScript permite que as variáveis possam conter valores de diferentes tipos ao longo do tempo, o que pode levar a comportamentos inesperados se não for gerenciado corretamente. Além disso não é necessário declarar o tipo de uma variável, pois o JavaScript infere o tipo com base no valor atribuído a ela.
