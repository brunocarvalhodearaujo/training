# Variáveis

O JavaScript utiliza `var`, `let` e `const` para declarar variáveis. `var` tem escopo de função, enquanto `let` e `const` têm escopo de bloco. `const` é usado para valores que não devem ser reatribuídos.

Você pode declarar variáveis usando:

```javascript
var nome = "João" // Variável global ou de função, não recomendado para uso moderno
let idade = 30
const PI = 3.14 // Valor constante
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
