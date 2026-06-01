# Promises e async/await para programação assíncrona

O JavaScript é uma linguagem de programação assíncrona, o que significa que ele pode executar tarefas em segundo plano sem bloquear a execução do código principal. Para lidar com operações assíncronas, como chamadas de API, leitura de arquivos ou temporizadores, o JavaScript oferece duas principais abordagens: Promises e async/await.

## Promises

Uma Promise é um objeto que representa a eventual conclusão (ou falha) de uma operação assíncrona e seu valor resultante. Ela pode estar em um dos três estados: pendente, resolvida ou rejeitada. As Promises permitem encadear operações assíncronas usando os métodos `.then()` e `.catch()`, facilitando a leitura e manutenção do código.

```javascript
function fetchData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const data = { name: 'John', age: 30 }
      resolve(data)
    }, 2000)
  })
}

fetchData()
  .then(data => {
    console.log('Data received:', data)
  })
  .catch(error => {
    console.error('Error:', error)
  })
```

```output
Data received: { name: 'John', age: 30 }
```

## Async/Await

O async/await é uma sintaxe mais moderna e elegante para lidar com operações assíncronas, construída sobre as Promises. A palavra-chave `async` é usada para declarar uma função assíncrona, enquanto `await` é usada para esperar a resolução de uma Promise dentro dessa função. Isso torna o código mais fácil de ler e escrever, especialmente quando há várias operações assíncronas encadeadas.

````javascript
async function fetchData() {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      const data = { name: 'John', age: 30 }
      resolve(data)
    }, 2000)
  })
}

async function getData() {
  try {
    const data = await fetchData()
    console.log('Data received:', data)
  } catch (error) {
    console.error('Error:', error)
  }
}

getData()
````

```output
Data received: { name: 'John', age: 30 }
```
