# Fundamentos

O **JavaScript®** (às vezes abreviado para JS) é uma linguagem de programação amplamente utilizada para desenvolvimento web, permitindo a criação de páginas interativas e dinâmicas. Ele é executado no lado do cliente (navegador) e também pode ser utilizado no lado do servidor (Node.js). O JavaScript é uma linguagem de alto nível, interpretada e parcialmente orientada a objetos, que suporta paradigmas de programação funcional e imperativa.

Uma recomendação é sempre que tiver dúvidas sobre algum método ou API da linguagem consultar a [documentação oficial do MDN Web Docs](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript), que oferece uma ampla variedade de recursos, tutoriais e referências para desenvolvedores de todos os níveis, vale ressaltar que ele é confiável e mantido pela Mozilla.

## Instalação do Node.js

Para começar a usar o JavaScript no lado do servidor, é necessário instalar o Node.js. O Node.js é um ambiente de execução JavaScript que permite executar código JavaScript fora do navegador. Ele é amplamente utilizado para desenvolvimento de aplicações web, APIs e ferramentas de linha de comando. Para instalar o Node.js, siga os passos abaixo:

### Ubuntu/Debian

Para instalar o Node.js em sistemas baseados em Ubuntu ou Debian, você pode usar o seguinte comando:

````sh
curl -fsSL https://deb.nodesource.com/setup_24.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt update
apt install -y nodejs
````
