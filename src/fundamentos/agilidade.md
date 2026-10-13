# Agilidade

Agilidade é a capacidade de se adaptar rapidamente a mudanças e entregar valor de forma contínua. No contexto de desenvolvimento de software, isso geralmente envolve práticas como metodologias ágeis, integração contínua e entrega contínua.

## Kanban

O Kanban é uma metodologia ágil que se concentra na visualização do fluxo de trabalho e na limitação do trabalho em andamento. Ele utiliza um quadro Kanban, onde as tarefas são representadas por cartões que se movem através de colunas que representam diferentes estados do processo, como "A Fazer", "Em Progresso" e "Concluído". O objetivo é melhorar a eficiência, identificar gargalos e promover a entrega contínua de valor.

### Quadro Kanban

Um quadro Kanban é uma ferramenta visual usada para gerenciar o fluxo de trabalho. Ele é dividido em colunas que representam diferentes estados do processo, como "A Fazer", "Em Progresso" e "Concluído". As tarefas são representadas por cartões que se movem de uma coluna para outra à medida que avançam no processo, permitindo que a equipe visualize o progresso e identifique gargalos de forma eficiente.

### Limites de Trabalho em Progresso (WIP)

No Kanban, é comum definir limites de trabalho em progresso (WIP) para cada coluna do quadro. Esses limites ajudam a equipe a focar nas tarefas em andamento, evitando sobrecarga e promovendo a conclusão das atividades antes de iniciar novas. Ao respeitar os limites de WIP, a equipe consegue identificar gargalos e melhorar continuamente o fluxo de trabalho.

### Benefícios do Kanban

O Kanban oferece diversos benefícios para equipes ágeis, incluindo maior visibilidade do fluxo de trabalho, identificação rápida de gargalos, melhor gerenciamento da capacidade da equipe e promoção de uma cultura de melhoria contínua. Ao adotar o Kanban, as equipes podem aumentar a eficiência, reduzir o tempo de ciclo e entregar valor de forma mais consistente.

## OnGoing

O OnGoing é uma abordagem ágil que se concentra na entrega contínua de valor, permitindo que as equipes ajustem suas prioridades e respondam rapidamente às mudanças. Ele promove a colaboração, a transparência e a adaptação contínua, garantindo que o trabalho esteja sempre alinhado com as necessidades do cliente.

## Scrum

O Scrum é uma metodologia ágil para gerenciamento de projetos que se concentra na entrega incremental de valor, promovendo a colaboração, a transparência e a adaptação contínua. Ele é estruturado em ciclos chamados sprints, que geralmente duram de uma a quatro semanas, durante os quais a equipe trabalha para completar um conjunto definido de tarefas.

### Épico, História e Tarefa

````mermaid
graph TD
  EPICO[Épico]
  HISTORIA[História A]
  HISTORIAB[História B]
  TAREFA[Tarefa A]
  TAREFAB[Tarefa B]
  TAREFAC[Tarefa C]

  EPICO --> HISTORIA
  EPICO --> HISTORIAB
  HISTORIAB --> TAREFAB
  HISTORIA --> TAREFAC
  HISTORIA --> TAREFA
````

#### Épico

Um épico é uma grande iniciativa ou funcionalidade que precisa ser dividida em histórias menores para ser implementada de forma incremental. Ele representa um objetivo de alto nível que a equipe deseja alcançar. Normalmente é criado pelo product owner.

Um exemplo de épico poderia ser "Melhorar a experiência do usuário no aplicativo". Esse épico poderia ser dividido em várias histórias, como "Redesenhar a tela inicial" e "Implementar notificações push". Cada história, por sua vez, seria dividida em tarefas específicas que a equipe precisa realizar para completar a história.

````mermaid
graph TD
  EPICO[Melhorar a experiência do usuário no aplicativo]
  HISTORIA[Redesenhar a tela inicial]
  HISTORIAB[Implementar notificações push]
  TAREFA[Criar layout da tela inicial no Figma]
  TAREFAB[Implementar tela inicial no aplicativo]
  HISTORIA --> TAREFA
  HISTORIA --> TAREFAB

  EPICO --> HISTORIA
  EPICO --> HISTORIAB
````

É importante que um épico tenha inicio, meio e fim bem definidos, mesmo que os detalhes sejam refinados ao longo do tempo. Isso ajuda a equipe a manter o foco nos objetivos de alto nível e a planejar o trabalho de forma incremental.

#### História

Uma história é uma unidade de trabalho menor que descreve uma funcionalidade do ponto de vista do usuário. As histórias são planejadas e implementadas dentro de sprints. Um épico pode conter várias histórias. Normalmente é criada pelo product owner.

#### Tarefa

Uma tarefa é uma unidade de trabalho ainda menor, derivada de uma história, que detalha as atividades específicas que precisam ser realizadas para completar a história. Uma história pode conter várias tarefas. Normalmente é criada pelo membro da equipe responsável pela execução.

### Sprint

Uma sprint é um período de tempo fixo, geralmente duas semanas, durante o qual a equipe trabalha para completar um conjunto definido de tarefas. Cada sprint começa com uma reunião de planejamento e termina com uma revisão e retrospectiva, permitindo que a equipe entregue valor de forma incremental e melhore continuamente seu processo.

### Daily

A daily é uma reunião diária de curta duração, geralmente de 15 minutos, onde a equipe sincroniza o progresso, identifica impedimentos e planeja o trabalho do dia. Cada membro da equipe compartilha o que fez no dia anterior, o que fará no dia atual e quaisquer obstáculos que esteja enfrentando.

No time o scrum master costuma ser o responsável por apresentar a daily, garantindo que todos os membros da equipe tenham a oportunidade de compartilhar seu progresso e identificar impedimentos. Ele também ajuda a manter a reunião focada e dentro do tempo previsto.

### Review

A review é uma reunião realizada ao final de cada sprint, onde a equipe apresenta o trabalho concluído para as partes interessadas, recebe feedback e discute possíveis ajustes para as próximas sprints. O objetivo é garantir que o produto esteja alinhado com as expectativas e necessidades do cliente.

No time o scrum master costuma ser o responsável por criar a apresentação e conduzir a review, garantindo que todas as partes interessadas tenham a oportunidade de fornecer feedback e que a reunião seja produtiva e focada nos objetivos da sprint.

### Retrospectiva

A retrospectiva é uma reunião realizada ao final de cada sprint, onde a equipe reflete sobre o processo, identifica pontos de melhoria e define ações para aprimorar continuamente seu desempenho e colaboração.

No time o scrum master costuma ser o responsável por conduzir a retrospectiva, garantindo que todos os membros da equipe tenham a oportunidade de compartilhar suas opiniões e que a reunião resulte em ações concretas para melhorar o processo.

## Papéis

### Product Owner

O product owner é responsável por maximizar o valor do produto resultante do trabalho da equipe de desenvolvimento. Ele gerencia o backlog do produto, define prioridades e garante que a equipe esteja trabalhando nas funcionalidades mais importantes para o negócio.

#### Responsabilidades

- Definir e comunicar a visão do produto para a equipe e as partes interessadas.
- Gerenciar o backlog do produto, incluindo a criação, priorização e detalhamento dos itens.
- Garantir que a equipe de desenvolvimento compreenda os requisitos e objetivos do produto.
- Tomar decisões sobre o escopo e prioridades do produto com base no valor para o negócio.
- Colaborar com as partes interessadas para obter feedback contínuo e ajustar o backlog conforme necessário.

### Scrum Master

O scrum master atua como um facilitador dentro da equipe que segue a metodologia Scrum, garantindo que os princípios ágeis sejam aplicados corretamente e ajudando a remover obstáculos que possam impedir o progresso do time.

#### Responsabilidades

- Facilitar as cerimônias Scrum, como planning, daily, review e retrospectiva.
- Ajudar a equipe a remover impedimentos que possam atrapalhar o progresso das atividades.
- Garantir que a equipe siga as práticas ágeis e os princípios do Scrum.
- Proteger a equipe de interferências externas e distrações.
- Promover a melhoria contínua dentro da equipe.

### Equipe de Desenvolvimento

A equipe de desenvolvimento é composta pelos profissionais responsáveis por entregar incrementos de produto potencialmente utilizáveis ao final de cada sprint. Eles possuem todas as habilidades necessárias para transformar os itens do backlog em funcionalidades funcionando.
