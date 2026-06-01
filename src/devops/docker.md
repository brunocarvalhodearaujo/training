# Docker

O Docker é uma plataforma de software que permite criar, testar e implantar aplicações rapidamente. Ele utiliza a tecnologia de containers para empacotar uma aplicação e suas dependências em um ambiente isolado, garantindo que a aplicação funcione de forma consistente em diferentes ambientes, desde o desenvolvimento até a produção. O Docker é amplamente utilizado para facilitar o desenvolvimento, a implantação e a escalabilidade de aplicações, além de ser uma ferramenta essencial para a implementação de práticas de DevOps.

## O que é um container?

Um container é uma unidade leve e portátil que empacota uma aplicação e todas as suas dependências, incluindo bibliotecas, arquivos de configuração e outras ferramentas necessárias para a execução da aplicação. Os containers compartilham o kernel do sistema operacional host, mas são isolados uns dos outros, garantindo que cada container tenha seu próprio ambiente de execução. Isso permite que os containers sejam iniciados rapidamente e consumam menos recursos do sistema em comparação com máquinas virtuais tradicionais. Os containers são ideais para criar ambientes de desenvolvimento consistentes, implantar aplicações em diferentes ambientes e facilitar a escalabilidade de aplicações.

## O que é uma imagem?

Uma imagem Docker é um arquivo leve, independente e executável que contém tudo o que é necessário para executar uma aplicação, incluindo o código, as bibliotecas, as dependências e as configurações. As imagens são usadas para criar containers, que são instâncias em execução das imagens. As imagens Docker são construídas a partir de um arquivo chamado `Dockerfile`, que contém uma série de instruções para definir como a imagem deve ser construída. As imagens podem ser armazenadas em registros de imagens, como o Docker Hub, e compartilhadas entre diferentes ambientes e usuários. As imagens Docker são imutáveis, o que significa que uma vez criada, ela não pode ser alterada, garantindo consistência e confiabilidade na execução de aplicações em containers.

### Como funciona o Docker?

O Docker é uma plataforma que permite empacotar, distribuir e executar aplicações em containers. Containers são ambientes isolados que contêm tudo o que uma aplicação precisa para funcionar, incluindo código, bibliotecas e dependências. Isso garante que a aplicação funcione de forma consistente em diferentes ambientes, desde o desenvolvimento até a produção.

### Qual a diferença entre Docker e máquinas virtuais?

A principal diferença entre Docker e máquinas virtuais (VMs) é a forma como eles isolam os ambientes. VMs executam um sistema operacional completo em cima de um hypervisor, o que consome mais recursos do sistema. Já o Docker utiliza containers que compartilham o kernel do sistema operacional host, tornando-os mais leves e eficientes em termos de uso de recursos. Isso permite iniciar containers rapidamente e executar mais containers no mesmo hardware em comparação com VMs.

### Como funcionam as redes no Docker?

As redes no Docker permitem que os containers se comuniquem entre si e com o mundo externo. Existem diferentes tipos de redes, sendo as principais:

- `Bridge`: Rede padrão para containers em um host Docker.
- `Host`: Compartilha a rede do host, sem isolamento.
- `Overlay`: Permite comunicação entre containers em diferentes hosts Docker.
- `Macvlan`: Atribui um endereço MAC a um container, permitindo que ele apareça como um dispositivo físico na rede.

### Como funcionam os volumes no Docker?

Volumes no Docker são usados para persistir dados gerados e usados por containers. Eles permitem que os dados sejam armazenados fora do ciclo de vida do container, garantindo que os dados não sejam perdidos quando o container é removido. Volumes podem ser compartilhados entre múltiplos containers, facilitando o compartilhamento de dados.

### Como funcionam as tags de imagens no Docker?

As tags de imagens no Docker são usadas para identificar versões específicas de uma imagem. Uma imagem pode ter várias tags associadas a ela, permitindo que os usuários escolham qual versão da imagem desejam usar. A tag padrão é `latest`, mas é recomendável usar tags específicas (como números de versão) para garantir consistência e evitar problemas causados por atualizações inesperadas da imagem.

### O que é um registro de imagens Docker?

Um registro de imagens Docker é um serviço que armazena e distribui imagens Docker. Ele permite que os usuários façam upload (push) e download (pull) de imagens Docker para facilitar o compartilhamento e a implantação de aplicações em diferentes ambientes. Existem registros públicos, como o Docker Hub, e registros privados, que podem ser configurados para uso interno em organizações. Os registros ajudam a gerenciar versões de imagens e facilitam a automação de processos de construção e implantação de containers.

### O que é o Docker Hub?

O Docker Hub é um serviço de registro de imagens Docker público e gratuito, mantido pela Docker Inc. Ele permite que os usuários armazenem, compartilhem e gerenciem imagens Docker. O Docker Hub oferece uma vasta biblioteca de imagens oficiais e comunitárias, facilitando o acesso a aplicações populares e ferramentas de desenvolvimento. Além disso, o Docker Hub suporta repositórios privados, permitindo que organizações armazenem imagens de forma segura. Ele também oferece recursos como integração com sistemas de CI/CD, webhooks e automação de builds.

## Instalação

Para instalar o Docker, siga as instruções de acordo com o sistema operacional utilizado:

### Ubuntu

````bash
curl -sSL https://get.docker.com | sh
````

## Estrutura de um arquivo `Dockerfile`

Um arquivo `Dockerfile` é um script de texto que contém uma série de instruções para construir uma imagem Docker. Abaixo está um exemplo básico da estrutura de um arquivo `Dockerfile`:

````Dockerfile
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
ENV NODE_ENV=production
CMD ["node", "app.js"]
````

- `FROM`: Especifica a imagem base a partir da qual a nova imagem será construída.
- `WORKDIR`: Define o diretório de trabalho dentro do container.
- `COPY`: Copia arquivos ou diretórios do sistema host para o sistema de arquivos do container.
- `RUN`: Executa comandos no container durante a construção da imagem.
- `EXPOSE`: Informa ao Docker que o container escutará na porta especificada em tempo de execução.
- `ENV`: Define variáveis de ambiente dentro do container.
- `CMD`: Especifica o comando padrão a ser executado quando o container for iniciado.

É possível criar imagens multilayer (com várias camadas) utilizando múltiplas instruções `FROM` em um único `Dockerfile`. Cada instrução `FROM` inicia uma nova etapa de construção, permitindo que você crie imagens mais complexas e otimizadas como no exemplo abaixo:

````Dockerfile
FROM node:14 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
````

- Neste exemplo, a primeira etapa (`build`) constrói a aplicação Node.js, enquanto a segunda etapa utiliza a imagem Nginx para servir os arquivos estáticos gerados na etapa de build. Isso resulta em uma imagem final mais leve, contendo apenas o necessário para executar a aplicação.
- O comando `COPY --from=build` é usado para copiar arquivos da etapa de construção anterior para a imagem final.
- O comando `AS build` nomeia a etapa de construção, facilitando a referência a ela posteriormente.
- O comando `FROM` pode ser utilizado múltiplas vezes para criar imagens com várias camadas, otimizando o tamanho e a eficiência da imagem final.

## Como incluir um registro inseguro no Docker?

Para incluir um registro inseguro no Docker, você precisa editar o arquivo de configuração do Docker, geralmente localizado em `/etc/docker/daemon.json`. Adicione a seguinte configuração, substituindo `[endereço_do_registro]` pelo endereço do seu registro inseguro:

````json
{
  "insecure-registries": ["[endereço_do_registro]"]
}
````

Por exemplo, se o endereço do registro for `myregistry.local:5000`, a configuração ficaria assim:

````json
{
  "insecure-registries": ["myregistry.local:5000"]
}
````

## Comandos do Docker

Abaixo estão alguns dos principais comandos para manipulação de imagens e containers Docker:

### Criar tag de uma imagem

Para criar uma tag de uma imagem existente, utilize o comando abaixo:

````sh
docker tag [id_da_imagem] [nome_para_a_image]:[tag]
````

### Persistir uma imagem

Para salvar uma imagem em um arquivo TAR, utilize o comando abaixo:

````sh
docker save [nome_da_imagem] > [arquivo_tar]
````

### Persistir um container

Para salvar um container em um arquivo TAR, utilize o comando abaixo:

````sh
docker export [id_do_container] > [arquivo_tar]
````

### Carregar imagens de um arquivo TAR

Para carregar uma imagem a partir de um arquivo TAR, utilize o comando abaixo:

````sh
docker load < [arquivo_tar]
````

### Visualizar histórico de uma imagem

Para visualizar o histórico de uma imagem, utilize o comando abaixo:

````sh
docker history [nome_da_imagem]
````

> Caso queira obter mais detalhes sobre os passos (containers intermediários) é necessário construir (build) a imagem.

### Criar um container a partir de uma imagem

Para criar um container a partir de uma imagem, utilize o comando abaixo:

````sh
docker run -d [nome_da_imagem] -p [porta_do_host:porta_do_container]  
````

### Compressão (squashing) de uma imagem

Para criar um container a partir de uma imagem e depois o exporta criando um container simples (flat) deixando em apenas uma camada na imagem, utilize o comando abaixo:

````sh
docker export [id_da_imagem] | sudo docker import - [nome_da_imagem]:[tag_da_imagem]
````

### Acessar uma imagem através de SSH

Para acessar um container em execução via terminal bash, utilize o comando abaixo:

````sh
docker exec -it [nome_do_container] bash
````

### Publicar uma imagem no DockerHub

Para publicar uma imagem no DockerHub, utilize os comandos abaixo:

1. Primeiro crie uma conta no [DockerHub](https://hub.docker.com/)

2. Depois utilize os comandos abaixo para fazer login no DockerHub:

    ````sh
    docker login # É necessário informar o usuário e senha do DockerHub
    ````

3. Por fim utilize o comando abaixo para enviar a imagem para o DockerHub:

    ````sh
    docker push [nome_da_imagem]
    ````

### Listar todos os containers

Para listar todos os containers em execução, utilize o comando abaixo:

````sh
docker ps
````

### Listar todas as imagens

Para listar todas as imagens disponíveis localmente, utilize o comando abaixo:

````sh
docker images
````

### Encerrar um container

Para encerrar um container em execução, utilize o comando abaixo:

````sh
docker kill [nome_do_container]
````

### Excluir um container

Para excluir um container, utilize o comando abaixo:

````sh
docker rm [nome_do_container]
````

- É possível listar todos os containers (inclusive os parados) usando o comando `docker ps -a`
- Caso o container esteja em execução, é necessário pará-lo antes de excluí-lo.
- Para parar o container, utilize o comando `docker stop [nome_do_container]`
- Para forçar a exclusão do container em execução, utilize o comando `docker rm -f [nome_do_container]`

### Excluir todos os containers parados

Para excluir todos os containers parados, utilize o comando abaixo:

````sh
docker rm $(docker ps -a -q)
````

- É possível forçar a exclusão usando o comando `-f`

### Excluir todos os containers sem tag `<none>`

Para excluir todas as imagens sem tag `<none>`, utilize o comando abaixo:

````sh
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
````

- É possível forçar a exclusão usando o comando `-f`

### Criar o container atual

Para criar uma imagem a partir do Dockerfile na pasta atual, utilize o comando abaixo:

````sh
docker build .
````

- É possível adicionar o parâmetro `-t [nome_da_imagem]:[tag_da_imagem]` para nomear a imagem criada

- o ponto pode ser trocado pelo endereço da pasta contendo o Dockerfile

### Remover uma imagem a partir do id

Para remover uma imagem a partir do id, utilize o comando abaixo:

````sh
docker rmi [id_da_imagem]
````

- É possível forçar a exclusão usando o comando `-f`

### Criar uma Tag

Para criar uma tag de uma imagem existente, utilize o comando abaixo:

````sh
docker tag [id_da_imagem] [nome_da_tag]:[tag]
````

- A tag é uma forma de identificar versões diferentes de uma mesma imagem.

### Limpar todo o ambiente Docker

Para limpar todo o ambiente Docker, removendo containers parados, redes não utilizadas, imagens pendentes e caches de build, utilize o comando abaixo:

````sh
docker system prune
````

- Caso este comando seja executado, o downtime será maior que o simples restart, pois todas as imagens serão baixadas novamente do Nexus, todas as redes serão recriadas, etc...

### Excluir todos os dados do Docker

Para excluir todos os dados do Docker, incluindo containers, imagens, volumes e redes, utilize o comando abaixo:

````sh
docker system prune -a --volumes
````

### Remover todas as redes Docker

Para remover todas as redes Docker, utilize o comando abaixo:

````bash
docker network rm -f $(docker network ls -q)
````

# Docker compose

O Docker compose é uma ferramenta que permite definir e gerenciar múltiplos containers Docker como um único serviço. Ele utiliza um arquivo de configuração YAML para definir os serviços, redes e volumes necessários para a aplicação. O Docker compose facilita a orquestração de containers, permitindo que você inicie, pare e gerencie todo o ambiente de forma simples e eficiente. Ele é especialmente útil para ambientes de desenvolvimento, testes e implantação de aplicações em produção.

## Comandos do Docker compose

Esta seção contém os principais comandos para manipulação de projetos Docker compose.

Vale lembrar que nas versões mais recentes do Docker, o compose já vem integrado como um plugin do Docker, então os comandos podem ser executados tanto com `docker-compose` quanto com `docker compose`.

### Parar um Container e/ou Projeto

Para parar um container ou o projeto como um todo, devemos executar o seguinte comando:

````sh
docker compose down
````

Em alguns casos vai ser interessante realizar a limpeza dos volumes do docker. Neste caso podemos executar da seguinte forma:

````sh
docker compose down -v
````

Caso desejamos parar apenas uma aplicação, podemos utilizar o seguinte comando:

````sh
docker compose stop [ContainerName]
````

- Neste caso, o ContainerName pode ser compressor, por exemplo.

### Iniciar os Containers e/ou Projeto

Para iniciar um container ou o projeto como um todo, devemos executar o seguinte comando:

````sh
docker compose up -d
````

- Este comando irá inicializar todos os containers. Ele também irá reiniciar um determinado container caso ele identifique alterações nos arquivos de configuração daquele container.

### Verificar Configurações do Projeto

Em alguns casos, se faz necessário a leitura das configurações e/ou variáveis de ambiente que foram passados para dentro do container. Neste caso podemos utilizar o seguinte comando:

````sh
docker compose config
````

- Este comando vai exibir todas as configurações que as imagens estão recebendo para funcionar.

### Visualizar Logs

Para que consigamos ver os logs que o container expõe é necessário executar o seguinte comando:

````sh
docker compose logs -f --tail 100
````

Caso seja desejado visualizar os logs de um determinado container, podemos usar o seguinte comando:

````sh
docker compose logs -f --tail 100 [ContainerName]
````

### Ativar docker-compose

Existem situações onde ainda não foi criado o atalho do docker-compose para o usuário, nestes casos, podemos executar o seguinte comando:

`````sh
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
`````

## Estrutura de um arquivo `docker-compose.yml`

Um arquivo `docker-compose.yml` é utilizado para definir e gerenciar múltiplos containers Docker como um único serviço. Abaixo está um exemplo básico da estrutura de um arquivo `docker-compose.yml`:

````yaml
networks:      # Define redes personalizadas para os containers
  external: # Nome da rede
    driver: bridge  # Tipo de driver da rede

volumes:       # Define volumes que podem ser compartilhados entre containers
  db_data:    # Nome do volume
    driver: local  # Tipo de driver do volume

services:       # Define os serviços (containers) que serão criados
  database:    # Nome do serviço
    image: mysql:5.7  # Imagem Docker a ser utilizada
    restart: always  # Política de reinício do container (em caso de falha)
    environment: # Variáveis de ambiente
      MYSQL_ROOT_PASSWORD: example  # Define a senha do root do MySQL
      MYSQL_DATABASE: mydb           # Define o nome do banco de dados
    ports:      # Mapeamento de portas
      - "3306:3306/tcp" # Mapeia a porta 3306 do host para a porta 3306 do container
    volumes:    # Montagem de volumes
      - db_data:/var/lib/mysql  # Monta o volume db_data no diretório do container
    networks:   # Redes associadas ao serviço
      - external
  web:          # Nome do serviço
    image: nginx:latest  # Imagem Docker a ser utilizada
    ports:      # Mapeamento de portas
      - "80:80" # Mapeia a porta 80 do host para a porta 80 do container
    volumes:    # Montagem de volumes
      - ./html:/usr/share/nginx/html  # Monta o diretório local ./html no diretório do container
    environment: # Variáveis de ambiente
      - NGINX_HOST=localhost
      - NGINX_PORT=80 
    networks:   # Redes associadas ao serviço
      - external
    depends_on: # Define dependências entre serviços
      - database  # O serviço web depende do serviço database
    deploy:     # Configurações de deploy (opcional)
      replicas: 3  # Número de réplicas do serviço
      resources:   # Recursos alocados
        limits:
          cpus: "0.5" # Limite de CPU
          memory: "512M" # Limite de memória
````

- Vale lembrar que é possível declarar as variáveis de ambiente (environment) de duas formas diferentes:

  - Como lista:

      ````yaml
      environment:
        - NGINX_HOST=localhost
        - NGINX_PORT=80
      ````

  - Como chave e valor:

      ````yaml
      environment:
        NGINX_HOST: localhost
        NGINX_PORT: 80
      ````

- A política de reinício (restart) pode ser ajustada conforme a necessidade do serviço e pode ser:
  - `no`: Não reinicia o container automaticamente.
  - `always`: Sempre reinicia o container se ele parar.
  - `on-failure`: Reinicia o container apenas se ele sair com um código de erro.
  - `unless-stopped`: Reinicia o container a menos que ele tenha sido parado manualmente.

## Dúvidas Frequentes

### Como incluir um usuário em um grupo do Docker?

Para incluir um usuário em um grupo do Docker, você pode usar o comando `usermod` no terminal. O comando abaixo adiciona o usuário ao grupo `docker`, permitindo que ele execute comandos do Docker sem precisar de privilégios de superusuário (sudo):

````sh
sudo usermod -aG docker [nome_do_usuario]
````

É necessário substituir `[nome_do_usuario]` pelo nome do usuário que você deseja adicionar ao grupo do Docker. Após executar este comando, é recomendado fazer logout e login novamente para que as alterações tenham efeito.

## Referências

- [O que é Docker?](http://www.mundodocker.com.br/o-que-e-docker)
- [Tips & Tricks with Docker & Docker compose](http://blog.zot24.com/tips-tricks-docker)
- [Passos pós-instalação Docker](https://docs.docker.com/engine/install/linux-postinstall/)
- [Permission denied Docker daemon](https://newbedev.com/shell-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket-at-unix-var-run-docker-sock-get-http-2fvar-2frun-2fdocker-sock-v1-24-containers-json-all-1-dial-unix-var-run-docker-sock-connect-permission-denied-code-example)
