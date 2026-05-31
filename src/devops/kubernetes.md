# Kubernetes

Neste documento, abordaremos os conceitos fundamentais do Kubernetes, uma plataforma de orquestração de contêineres amplamente utilizada para automatizar a implantação, o dimensionamento e o gerenciamento de aplicativos em contêineres.

## O que é Kubernetes?

Kubernetes, frequentemente abreviado como K8s, é um sistema de código aberto para automatizar a implantação, o dimensionamento e o gerenciamento de aplicativos em contêineres. Ele foi originalmente desenvolvido pelo Google e agora é mantido pela Cloud Native Computing Foundation (CNCF).

## Componentes Principais do Kubernetes

- **Cluster**: Conjunto de máquinas (nós) que executam aplicativos em contêineres gerenciados pelo Kubernetes.
- **Nó (Node)**: Máquina individual dentro do cluster que pode ser um nó mestre ou um nó de trabalho.
- **Pod**: A menor unidade implantável que pode ser criada e gerenciada pelo Kubernetes, geralmente contendo um ou mais contêineres.
- **Serviço (Service)**: Abstração que define um conjunto lógico de pods e uma política para acessá-los.
- **Namespace**: Mecanismo para isolar recursos dentro de um cluster Kubernetes.
- **Deployment**: Controlador que gerencia a implantação e o dimensionamento de conjuntos de pods.
- **ConfigMap**: Objeto que permite armazenar dados de configuração em pares chave-valor.
- **Secret**: Objeto usado para armazenar informações sensíveis, como senhas e tokens.
- **Ingress**: Recurso que gerencia o acesso externo aos serviços no cluster, geralmente HTTP.

## Comandos Básicos do Kubernetes

### Aplicar uma configuração a um recurso no cluster

Você pode aplicar uma configuração definida em um arquivo YAML usando o seguinte comando:

```sh
kubectl apply -f [arquivo_de_configuração].yaml
```

É possível também aplicar diretamente de uma URL:

```sh
kubectl apply -f https://exemplo.com/arquivo_de_configuração.yaml
```

Ou utilizando um bloco de texto inline:

````bash
kubectl apply -n argocd -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: argocd-server-http-ingress
  namespace: argocd
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/force-ssl-redirect: "true"
    nginx.ingress.kubernetes.io/ssl-passthrough: "true"
    nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"
spec:
  ingressClassName: "nginx"
  rules:
    - host: argocd.example.com
      http:
        paths:
          - pathType: Prefix
            path: /
            backend:
              service:
                name: argocd-server
                port:
                  name: https
EOF
````

### Verificar os recursos no cluster

Para listar os pods em um namespace específico, você pode usar:

```sh
kubectl get pods -n [nome_do_namespace]
```

### Obter detalhes de um recurso específico

Para obter detalhes sobre um pod específico, utilize:

```sh
kubectl describe pod [nome_do_pod] -n [nome_do_namespace]
```

### Excluir um recurso do cluster

Para excluir um recurso, como um pod ou serviço, use:

```sh
kubectl delete [tipo_de_recurso] [nome_do_recurso] -n [nome_do_namespace]
```

## Dúvidas frequentes

### O que é um namespace no Kubernetes?

Um namespace é uma forma de dividir recursos dentro de um cluster Kubernetes, permitindo a criação de ambientes isolados para diferentes equipes ou projetos.

### O que é o helm no contexto do Kubernetes?

Helm é um gerenciador de pacotes para Kubernetes que facilita a implantação e o gerenciamento de aplicativos complexos, utilizando "charts" que definem os recursos necessários.

### O que é o ArgoCD?

ArgoCD é uma ferramenta de entrega contínua (CD) para Kubernetes que permite a implantação automática de aplicativos a partir de repositórios Git, facilitando o gerenciamento de configurações e versões.

## Referências

- [Documentação Oficial do Kubernetes](https://kubernetes.io/docs/home/)
- [Guia de Introdução ao Kubernetes](https://kubernetes.io/docs/tutorials/kubernetes-basics/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
