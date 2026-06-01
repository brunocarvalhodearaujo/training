# Amazon Web Services (AWS)

Este documento contém informações e comandos relacionados à Amazon Web Services (AWS).

## Dúvidas Frequentes

### O que é a AWS?

Amazon Web Services (AWS) é uma plataforma de serviços de computação em nuvem oferecida pela Amazon. Ela fornece uma ampla gama de serviços, incluindo computação, armazenamento, bancos de dados, análise, redes, inteligência artificial, Internet das Coisas (IoT), segurança e muito mais. A AWS permite que empresas e desenvolvedores criem e gerenciem aplicativos e serviços na nuvem de forma escalável, flexível e econômica.

### O que é o AWS Command Line Interface (CLI)?

AWS Command Line Interface (CLI) é uma ferramenta unificada que permite gerenciar serviços da AWS por meio de comandos no terminal ou prompt de comando. Com o AWS CLI, você pode controlar vários serviços da AWS e automatizar tarefas por meio de scripts.

### O que é o Amazon Elastic Compute Cloud (EC2)?

Amazon Elastic Compute Cloud (EC2) é um serviço de computação em nuvem que fornece capacidade de computação redimensionável na nuvem. Ele permite que você execute instâncias de servidores virtuais, conhecidas como instâncias EC2, para hospedar aplicativos, sites e serviços. O EC2 oferece uma variedade de tipos de instâncias, opções de armazenamento e configurações de rede para atender às necessidades específicas de desempenho e custo dos usuários.

### O que é o Amazon Virtual Private Cloud (VPC)?

Amazon Virtual Private Cloud (VPC) é um serviço que permite provisionar uma seção isolada da nuvem AWS onde você pode lançar recursos da AWS em uma rede virtual definida por você. Com o VPC, você tem controle total sobre o ambiente de rede, incluindo a seleção do intervalo de endereços IP, a criação de sub-redes, a configuração de tabelas de roteamento e a definição de gateways de rede.

### O que é o Amazon CloudFront?

Amazon CloudFront é um serviço de rede de entrega de conteúdo (CDN) que distribui conteúdo, como arquivos estáticos e dinâmicos, vídeos, aplicativos e APIs, para usuários finais com baixa latência e alta velocidade de transferência. O CloudFront utiliza uma rede global de servidores localizados em várias regiões para entregar o conteúdo de forma eficiente.

### O que é o AWS Software Development Kit (SDK)?

AWS Software Development Kit (SDK) é um conjunto de bibliotecas e ferramentas que facilitam a integração de aplicativos com os serviços da AWS. O SDK está disponível para várias linguagens de programação, como Java, Python, JavaScript, .NET, Ruby, PHP, GoLang, entre outras, permitindo que os desenvolvedores criem aplicativos que interajam com a AWS de maneira simples e eficiente.

### O que é o Amazon Elastic Container Service (ECS)?

Amazon Elastic Container Service (ECS) é um serviço de orquestração de contêineres altamente escalável e de alto desempenho que facilita a execução, a parada e o gerenciamento de contêineres Docker em um cluster. O ECS permite que você execute aplicativos em contêineres na infraestrutura da AWS, aproveitando a integração com outros serviços da AWS para segurança, rede e armazenamento.

### O que é o Amazon Relational Database Service (RDS)?

Amazon Relational Database Service (RDS) é um serviço gerenciado que facilita a configuração, operação e escalabilidade de bancos de dados relacionais na nuvem. Ele suporta vários mecanismos de banco de dados, incluindo Amazon Aurora, PostgreSQL, MySQL, MariaDB, Oracle e Microsoft SQL Server. O RDS automatiza tarefas administrativas como backups, atualizações de software e monitoramento de desempenho.

### O que é o DataSync?

AWS DataSync é um serviço de transferência de dados que simplifica, automatiza e acelera a movimentação de dados entre armazenamento local e serviços de armazenamento na nuvem da AWS, como Amazon S3, Amazon EFS e Amazon FSx. Ele é projetado para facilitar a migração de dados, backup e recuperação, bem como a replicação de dados para análise e processamento na nuvem.

### O que é o Database Migration Service (DMS)?

AWS Database Migration Service (DMS) é um serviço gerenciado que facilita a migração de bancos de dados para a nuvem AWS. Ele suporta a migração de dados entre diferentes tipos de bancos de dados, tanto relacionais quanto não relacionais, com o mínimo de tempo de inatividade. O DMS pode ser usado para migrações homogêneas (mesmo tipo de banco de dados) e heterogêneas (diferentes tipos de banco de dados).

### O que é Simple Queue Service (SQS)?

Amazon Simple Queue Service (SQS) é um serviço de fila de mensagens totalmente gerenciado que permite desacoplar e escalar microsserviços, sistemas distribuídos e aplicativos sem servidor. Ele facilita a comunicação entre diferentes componentes de um sistema, permitindo que as mensagens sejam enviadas, armazenadas e recebidas de forma assíncrona.

### O que é o Simple Notification Service (SNS)?

Amazon Simple Notification Service (SNS) é um serviço de mensagens gerenciado que permite a publicação e entrega de mensagens para assinantes ou outros aplicativos. Ele suporta vários protocolos de entrega, como e-mail, SMS, HTTP/HTTPS e filas SQS, facilitando a comunicação entre diferentes componentes de um sistema distribuído.

### O que é Amazon ECS Anywhere?

Amazon ECS Anywhere é uma extensão do Amazon Elastic Container Service (ECS) que permite executar e gerenciar contêineres Docker em qualquer infraestrutura, seja na nuvem AWS ou em ambientes locais (on-premises). Com o ECS Anywhere, você pode aproveitar os recursos de orquestração e gerenciamento de contêineres do ECS, independentemente de onde seus contêineres estejam sendo executados.

### O que é o Amazon Simple Storage Service (S3)?

Amazon Simple Storage Service (S3) é um serviço de armazenamento de objetos escalável e durável oferecido pela Amazon Web Services (AWS). Ele permite armazenar e recuperar qualquer quantidade de dados a qualquer momento, de qualquer lugar na web. O S3 é amplamente utilizado para backup, arquivamento, hospedagem de sites estáticos, distribuição de conteúdo e muito mais.

### O que é um lambda function na AWS?

AWS Lambda é um serviço de computação sem servidor que permite executar código em resposta a eventos sem a necessidade de provisionar ou gerenciar servidores. Com o Lambda, você pode escrever funções em várias linguagens de programação, como GoLang, Python, Node.js, Java, C#, entre outras, e o serviço cuida automaticamente do dimensionamento, monitoramento e execução dessas funções conforme necessário.

### O que é o Amazon Elastic Kubernetes Service (EKS)?

Amazon Elastic Kubernetes Service (EKS) é um serviço gerenciado que facilita a execução de clusters Kubernetes na nuvem AWS. O EKS cuida da configuração, gerenciamento e escalabilidade do plano de controle do Kubernetes, permitindo que você se concentre na implantação e gerenciamento de aplicativos em contêineres. Ele oferece integração com outros serviços da AWS, como IAM, VPC e CloudWatch, para segurança, rede e monitoramento.

## Referências

- [Amazon SQS fair queues](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-fair-queues.html)
- [AWS - Introducing amazon ecs anywhere](https://aws.amazon.com/pt/blogs/containers/introducing-amazon-ecs-anywhere/)
- [AWS - Create a healthcare data hub with AWS and Mirth Connect](https://aws.amazon.com/blogs/big-data/create-a-healthcare-data-hub-with-aws-and-mirth-connect/)