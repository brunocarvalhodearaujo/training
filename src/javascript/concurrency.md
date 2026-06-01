## Limitando a concorrência com `Readable.map`

As vezes, é necessário limitar a quantidade de tarefas assíncronas que estão sendo executadas simultaneamente. O método `map` do `Readable` aceita uma opção `concurrency` que define o número máximo de tarefas que podem ser executadas ao mesmo tempo.

No node.js 24 foi adicionado o `Readable.map` que aceita a opção `concurrency` para limitar a quantidade de tarefas assíncronas que estão sendo executadas simultaneamente. O exemplo abaixo mostra como usar essa opção para limitar a concorrência a 10 tarefas:

````js
import console from 'node:console'
import { Readable } from 'node:stream'
import { setTimeout } from 'node:timers/promises'

/**
 * @param {number} ms 
 * @returns {Promise<{ms: number, time: string}>}
 */
async function fakeProcess(ms) {
  await setTimeout(ms * 1000)
  return { ms, time: new Date().toISOString() }
}

/**
 * @type {number[]}
 */
const rows = [1, 2, 1, 3, 4, 5]
const chunks =  Readable
  .from(rows)
  .map(fakeProcess, { concurrency: 10, signal: AbortSignal.timeout(10000) })

for await (const chunk of chunks) {
  console.info(chunk, 'is a chunk')
}
````

````output
{ ms: 1, time: '2024-06-01T12:00:00.000Z' } is a chunk
{ ms: 2, time: '2024-06-01T12:00:01.000Z' } is a chunk
{ ms: 1, time: '2024-06-01T12:00:02.000Z' } is a chunk
{ ms: 3, time: '2024-06-01T12:00:03.000Z' } is a chunk
{ ms: 4, time: '2024-06-01T12:00:04.000Z' } is a chunk
{ ms: 5, time: '2024-06-01T12:00:05.000Z' } is a chunk
````

## Entendendo o código

- A função `fakeProcess` é uma função assíncrona que simula uma operação que leva um certo tempo para ser concluída. Ela recebe um número de segundos, aguarda esse tempo usando `setTimeout`, e retorna um objeto com o tempo em milissegundos e a hora atual.
- O array `rows` contém os números que serão processados. Cada número representa o tempo que a função `fakeProcess` levará para ser concluída.
- O método `Readable.from(rows)` cria um stream legível a partir do array `rows`.
- O método `map` é usado para aplicar a função `fakeProcess` a cada elemento do stream. A opção `concurrency: 10` limita o número de tarefas assíncronas que podem ser executadas simultaneamente a 10. A opção `signal: AbortSignal.timeout(10000)` define um tempo limite de 10 segundos para a operação.
- O loop `for await` é usado para iterar sobre os chunks processados e imprimir o resultado no console.

## Conclusão

O método `Readable.map` com a opção `concurrency` é uma maneira eficiente de controlar a quantidade de tarefas assíncronas que estão sendo executadas simultaneamente, evitando sobrecarregar o sistema e garantindo que as operações sejam concluídas dentro de um tempo razoável.
