# Testes unitários

A escrita de testes unitários é uma prática essencial para garantir a qualidade do código e facilitar a manutenção. Os testes unitários verificam o comportamento de pequenas unidades de código, como funções ou métodos, isoladamente. Isso ajuda a identificar rapidamente problemas e a garantir que as mudanças no código não quebrem funcionalidades existentes.

Para garantir a qualidade do código e facilitar a manutenção, é fundamental escrever testes unitários. Os testes unitários verificam o comportamento de pequenas unidades de código, como funções ou métodos, isoladamente.

## Configurando o ambiente de testes

O Node.js possui um módulo nativo chamado `node:test` para escrever testes, e o módulo `node:assert` para fazer asserções. Para começar a escrever testes, siga os passos abaixo:

1. Crie um arquivo de teste, por exemplo, `test.js`.
2. Importe os módulos necessários:
```javascript
import test from 'node:test'
import assert from 'node:assert'
```
3. Escreva seus testes usando a função `test`:
```javascript
test('deve somar dois números corretamente', () => {
  const resultado = soma(2, 3)
  assert.strictEqual(resultado, 5)
})
```

## Exemplo completo

Vamos criar uma função simples de soma e escrever um teste para ela.

1. Crie um arquivo `soma.js` com a função de soma:
```javascript
export function soma(a, b) {
  return a + b
}
```
2. Crie um arquivo `test.js` para os testes:
```javascript
import test from 'node:test'
import assert from 'node:assert'
import { soma } from './soma.js'

test('deve somar dois números corretamente', () => {
  const resultado = soma(2, 3)
  assert.strictEqual(resultado, 5)
})
```
3. Execute os testes usando o comando:
```bash
node test.js
```
Se o teste passar, você verá uma mensagem indicando que o teste foi bem-sucedido. Caso contrário, uma mensagem de erro será exibida, indicando o que falhou.

## Dicas para escrever bons testes

- **Teste casos positivos e negativos**: Verifique se a função funciona corretamente com entradas válidas e também se lida adequadamente com entradas inválidas.
- **Mantenha os testes pequenos e focados**: Cada teste deve verificar apenas uma funcionalidade específica.
- **Use nomes descritivos para os testes**: O nome do teste deve indicar claramente o que está sendo testado e qual é o resultado esperado.
- **Automatize a execução dos testes**: Use ferramentas como `npm test` para facilitar a execução dos testes e integrá-los ao processo de desenvolvimento.
- **Cobertura de código**: Utilize ferramentas de cobertura de código para garantir que seus testes estão cobrindo todas as partes importantes do seu código.

Escrever testes unitários é uma prática essencial para garantir a qualidade do código e facilitar a manutenção. Com o módulo `node:test` e `node:assert`, você pode criar testes de forma simples e eficaz, garantindo que suas funções se comportem conforme o esperado.

## Testes utilizando o Jest

O Jest é um framework de testes popular para JavaScript, especialmente em projetos React. Ele oferece uma sintaxe simples e recursos avançados para facilitar a escrita e execução de testes.

1. Instale o Jest como dependência de desenvolvimento:
```bash
npm install --save-dev jest
```
2. Configure o Jest no seu `package.json`:
```json
{
  "scripts": {
    "test": "jest"
  }
}
```
3. Escreva seus testes em um arquivo, por exemplo, `soma.test.js`:
```javascript
import { soma } from './soma.js'
test('deve somar dois números corretamente', () => {
  expect(soma(2, 3)).toBe(5)
})
```
4. Execute os testes usando o comando:
```bash
npm test
```

O Jest executará os testes e fornecerá um relatório detalhado sobre os resultados, incluindo quais testes passaram e quais falharam, além de informações sobre a cobertura de código. O Jest também suporta recursos avançados como mocks, testes assíncronos e snapshots, tornando-o uma escolha poderosa para projetos JavaScript.
