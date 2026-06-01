# React

O React é uma biblioteca JavaScript de código aberto para a construção de interfaces de usuário. Ele foi desenvolvido pelo Facebook e é amplamente utilizado para criar aplicações web interativas e responsivas. O React utiliza um modelo de componentes, onde cada componente é uma parte reutilizável da interface do usuário. Ele também utiliza um conceito chamado Virtual DOM, que permite atualizar apenas as partes da interface que foram alteradas, melhorando o desempenho da aplicação. O React é frequentemente usado em conjunto com outras bibliotecas e frameworks, como Redux para gerenciamento de estado e React Router para navegação entre páginas.

## Componentes

Os componentes são a base do React. Eles são blocos de construção reutilizáveis que representam partes da interface do usuário. Existem dois tipos principais de componentes: componentes de classe e componentes funcionais.

### Componentes de Classe

Os componentes de classe são definidos usando a sintaxe de classe do JavaScript. Eles possuem um método `render()` que retorna o JSX (uma extensão de sintaxe que permite escrever HTML dentro do JavaScript) que representa a interface do usuário.

```jsx
import React, { Component } from 'react'

class MyComponent extends Component {
  render() {
    return (
      <div>
        <h1>Hello, World!</h1>
      </div>
    )
  }
}
```

### Componentes Funcionais

Os componentes funcionais são definidos como funções JavaScript. Eles também retornam JSX, mas não possuem um método `render()`. Com a introdução dos Hooks, os componentes funcionais se tornaram mais poderosos e são agora a forma preferida de criar componentes no React.

```jsx
import React from 'react'

function MyComponent() {
  return (
    <div>
      <h1>Hello, World!</h1>
    </div>
  )
}
```

## Props e State

As props (propriedades) são usadas para passar dados de um componente pai para um componente filho. Elas são imutáveis, o que significa que um componente filho não pode alterar as props que recebe.

O state (estado) é usado para armazenar dados que podem mudar ao longo do tempo. Ele é gerenciado dentro do componente e pode ser atualizado usando o método `setState()` em componentes de classe ou usando o Hook `useState` em componentes funcionais.

```jsx
import React, { useState } from 'react'

function Counter() {
  const [count, setCount] = useState(0)

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  )
}
```

## Virtual DOM

O Virtual DOM é uma representação leve do DOM real. Quando o estado de um componente muda, o React cria uma nova árvore do Virtual DOM e a compara com a árvore anterior. Ele então calcula as mudanças necessárias para atualizar o DOM real de forma eficiente, minimizando as operações de manipulação do DOM, que podem ser lentas.

## Hooks

Os Hooks são uma adição ao React que permitem usar o estado e outras funcionalidades do React em componentes funcionais. Eles foram introduzidos na versão 16.8 do React e incluem Hooks como `useState`, `useEffect`, `useContext`, entre outros.

```jsx
import React, { useState, useEffect } from 'react'

function Timer() {
  const [seconds, setSeconds] = useState(0)

  useEffect(() => {
    const interval = setInterval(() => {
      setSeconds(seconds => seconds + 1)
    }, 1000)

    return () => clearInterval(interval)
  }, [])

  return (
    <div>
      <p>Seconds: {seconds}</p>
    </div>
  )
}
```

### useEffect

O Hook `useEffect` é usado para realizar efeitos colaterais em componentes funcionais, como buscar dados, configurar assinaturas ou limpar recursos. Ele é executado após a renderização do componente e pode ser configurado para ser executado apenas quando certas dependências mudarem.

```jsx
import React, { useState, useEffect } from 'react'

function DataFetcher() {
  const [data, setData] = useState(null)

  useEffect(() => {
    fetch('https://api.example.com/data')
      .then(response => response.json())
      .then(data => setData(data))
  }, [])

  return (
    <div>
      {data ? <pre>{JSON.stringify(data, null, 2)}</pre> : 'Loading...'}
    </div>
  )
}
```

### useContext

O Hook `useContext` é usado para acessar o contexto em componentes funcionais. O contexto é uma maneira de passar dados através da árvore de componentes sem precisar passar props manualmente em cada nível.

```jsx
import React, { createContext, useContext } from 'react'

const ThemeContext = createContext('light')

function ThemedButton() {
  const theme = useContext(ThemeContext)
  return <button className={theme}>I am a {theme} button</button>
}

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <ThemedButton />
    </ThemeContext.Provider>
  )
}
```

### useReducer

O Hook `useReducer` é uma alternativa ao `useState` para gerenciar estados mais complexos. Ele é inspirado no padrão de design de reducer, onde o estado é atualizado com base em ações e um reducer function.

```jsx
import React, { useReducer } from 'react'

const initialState = { count: 0 }

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 }
    case 'decrement':
      return { count: state.count - 1 }
    default:
      throw new Error()
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, initialState)

  return (
    <div>
      <p>Count: {state.count}</p>
      <button onClick={() => dispatch({ type: 'increment' })}>Increment</button>
      <button onClick={() => dispatch({ type: 'decrement' })}>Decrement</button>
    </div>
  )
}
```

### useMemo

O Hook `useMemo` é usado para memorizar valores calculados, evitando cálculos desnecessários em cada renderização. Ele é útil para otimizar o desempenho de componentes que realizam cálculos complexos.

```jsx
import React, { useState, useMemo } from 'react'

function ExpensiveCalculation({ num }) {
  const result = useMemo(() => {
    // Simula um cálculo caro
    let total = 0
    for (let i = 0; i < 1000000000; i++) {
      total += num
    }
    return total
  }, [num])

  return <div>Result: {result}</div>
}
```

### useCallback

O Hook `useCallback` é usado para memorizar funções, evitando a criação de novas instâncias de funções em cada renderização. Ele é útil para otimizar o desempenho de componentes que dependem de funções como props.

```jsx
import React, { useState, useCallback } from 'react'

function Button({ onClick, children }) {
  return <button onClick={onClick}>{children}</button>
}

function App() {
  const [count, setCount] = useState(0)

  const handleClick = useCallback(() => {
    setCount(count + 1)
  }, [count])

  return (
    <div>
      <p>Count: {count}</p>
      <Button onClick={handleClick}>Increment</Button>
    </div>
  )
}
```

### useRef

O Hook `useRef` é usado para criar uma referência mutável que persiste durante toda a vida do componente. Ele é útil para acessar elementos DOM diretamente ou para armazenar valores que não causam re-renderizações quando atualizados.

```jsx
import React, { useRef } from 'react'

function TextInput() {
  const inputRef = useRef(null)

  const focusInput = () => {
    inputRef.current.focus()
  }

  return (
    <div>
      <input ref={inputRef} type="text" />
      <button onClick={focusInput}>Focus Input</button>
    </div>
  )
}
```

## Rotas usando React Router

O React Router é uma biblioteca de roteamento para React que permite criar rotas e navegação em aplicações de página única (SPA). Ele fornece componentes como `BrowserRouter`, `Route`, `Link` e `Switch` para definir rotas e navegar entre elas.

Para instalar o React Router, você pode usar o seguinte comando:

```bash
npm install react-router-dom
```

```jsx
import React from 'react'
import { BrowserRouter as Router, Route, Link, Switch } from 'react-router-dom'

function Home() {
  return <h2>Home</h2>
}

function About() {
  return <h2>About</h2>
}

function App() {
  return (
    <Router>
      <div>
        <nav>
          <ul>
            <li>
              <Link to="/">Home</Link>
            </li>
            <li>
              <Link to="/about">About</Link>
            </li>
          </ul>
        </nav>

        <Switch>
          <Route path="/about">
            <About />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </div>
    </Router>
  )
}
```
