# Módulos

Em JavaScript, os módulos são uma forma de organizar e reutilizar código. Eles permitem que você divida seu código em arquivos menores e mais gerenciáveis, facilitando a manutenção e a colaboração em projetos maiores.

## Importação e Exportação

A sintaxe de módulos ES6 é a forma mais moderna de trabalhar com módulos em JavaScript. Ela utiliza as palavras-chave `import` e `export` para definir e usar módulos.

### Exportação

Existem duas formas principais de exportar código em um módulo: exportação nomeada e exportação padrão.

#### Exportação Nomeada

````javascript
// math.js
export function add(a, b) {
  return a + b
}

export function subtract(a, b) {
  return a - b
}
````

#### Exportação Padrão

````javascript
// math.js
export default function multiply(a, b) {
  return a * b
}
````

### Importação

Para importar um módulo, você pode usar a sintaxe de importação correspondente ao tipo de exportação.

#### Importação de Exportação Nomeada

````javascript
// main.js
import { add, subtract } from './math.js'

console.log(add(2, 3))
console.log(subtract(5, 2))
````

````output
5
3
````

#### Importação de Exportação Padrão

````javascript
// main.js
import multiply from './math.js'

console.log(multiply(2, 3))
````

````output
6
````

## Referências

- [MDN Web Docs - Módulos JavaScript](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Guide/Modules)
