# Fundamentos

O **JavaScript®** (às vezes abreviado para JS) é uma linguagem de programação amplamente utilizada para desenvolvimento web, permitindo a criação de páginas interativas e dinâmicas. Ele é executado no lado do cliente (navegador) e também pode ser utilizado no lado do servidor (Node.js). O JavaScript é uma linguagem de alto nível, interpretada e parcialmente orientada a objetos, que suporta paradigmas de programação funcional e imperativa.

Uma recomendação é sempre que tiver dúvidas sobre algum método ou API da linguagem consultar a [documentação oficial do MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript), que oferece uma ampla variedade de recursos, tutoriais e referências para desenvolvedores de todos os níveis, vale ressaltar que ele é confiável e mantido pela Mozilla.

## EcmaScript

O **EcmaScript** é a especificação padronizada do JavaScript, que define as regras, sintaxe e funcionalidades da linguagem. Ele é desenvolvido e mantido pela Ecma International, uma organização responsável por criar padrões para tecnologias de informação e comunicação. O EcmaScript é atualizado regularmente, com novas versões introduzindo melhorias e recursos adicionais para a linguagem. A versão mais recente do EcmaScript é o ES2026, que inclui várias melhorias e novos recursos para tornar o desenvolvimento em JavaScript mais eficiente e poderoso.

## JavaScript no Navegador

O JavaScript é amplamente utilizado para criar interatividade em páginas web. Ele pode ser usado para manipular o DOM (Document Object Model), que é a estrutura hierárquica de elementos HTML em uma página, permitindo que os desenvolvedores criem efeitos visuais, validem formulários, façam requisições assíncronas (AJAX) e muito mais. O JavaScript no navegador é executado em um ambiente de sandbox, o que significa que ele tem acesso limitado ao sistema do usuário por razões de segurança. Ele é suportado por todos os navegadores modernos, tornando-se uma escolha popular para desenvolvimento web front-end.

## Node.js

O **Node.js** é um ambiente de execução JavaScript que permite executar código JavaScript fora do navegador. Ele é construído sobre o motor V8 do Google Chrome e é amplamente utilizado para desenvolvimento de aplicações web, APIs e ferramentas de linha de comando. O Node.js é conhecido por sua eficiência, escalabilidade e capacidade de lidar com operações assíncronas, tornando-o uma escolha popular para desenvolvimento de back-end.

### Instalação do Node.js

Para começar a usar o JavaScript no lado do servidor, é necessário instalar o Node.js. O Node.js é um ambiente de execução JavaScript que permite executar código JavaScript fora do navegador. Ele é amplamente utilizado para desenvolvimento de aplicações web, APIs e ferramentas de linha de comando. Para instalar o Node.js, siga os passos abaixo:

#### Ubuntu/Debian

Para instalar o Node.js em sistemas baseados em Ubuntu ou Debian, você pode usar o seguinte comando:

````bash
curl -fsSL https://deb.nodesource.com/setup_24.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt update
apt install -y nodejs
````
