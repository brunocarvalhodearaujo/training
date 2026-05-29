# Terraform

Este documento tem como objetivo apresentar os conceitos fundamentais do Terraform, uma ferramenta de infraestrutura como código (IaC) amplamente utilizada para definir e provisionar infraestrutura de maneira eficiente e automatizada.

## O que é Terraform?

Terraform é uma ferramenta de código aberto desenvolvida pela HashiCorp que permite aos usuários definir e provisionar infraestrutura de TI usando uma linguagem de configuração declarativa chamada HashiCorp Configuration Language (HCL). Com o Terraform, é possível gerenciar recursos em diversos provedores de nuvem, como AWS, Azure, Google Cloud, entre outros, bem como recursos locais.

## Componentes Principais do Terraform

- **Providers**: Plugins que permitem ao Terraform interagir com APIs de provedores de nuvem e outros serviços.
- **Resources**: Componentes básicos que representam a infraestrutura que você deseja criar, modificar ou excluir.
- **Modules**: Conjuntos reutilizáveis de recursos que facilitam a organização e a manutenção da infraestrutura.
- **State**: Arquivo que mantém o estado atual da infraestrutura gerenciada pelo Terraform.
- **Variables**: Parâmetros que permitem a personalização das configurações do Terraform.
- **Outputs**: Valores retornados após a aplicação da infraestrutura, que podem ser usados em outros módulos ou scripts.

## Comandos Básicos do Terraform

### Inicializar um diretório de trabalho do Terraform

Para iniciar um diretório de trabalho do Terraform, você pode usar o seguinte comando:

```sh
terraform init
```

Este comando baixa os plugins necessários para os provedores especificados na configuração do Terraform.

### Planejar as mudanças na infraestrutura

Para visualizar as mudanças que serão aplicadas à infraestrutura, utilize o comando:

```sh
terraform plan
```

Este comando gera um plano de execução, mostrando quais recursos serão criados, modificados ou destruídos.

### Aplicar as mudanças na infraestrutura

Para aplicar as mudanças planejadas à infraestrutura, execute o comando:

```sh
terraform apply
```

Este comando solicita confirmação antes de aplicar as mudanças, mas você pode usar a opção `-auto-approve` para pular essa etapa.

### Destruir a infraestrutura gerenciada pelo Terraform

Para destruir todos os recursos gerenciados pelo Terraform, utilize o comando:

```sh
terraform destroy
```

Este comando também solicita confirmação antes de destruir os recursos, mas você pode usar a opção `-auto-approve` para pular essa etapa.