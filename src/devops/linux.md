# Linux

Este documento contém comandos úteis e informações relacionadas ao sistema operacional Linux.

## Comandos

### Reiniciar o sistema

Para reiniciar o sistema, você pode usar o seguinte comando:

```bash
sudo reboot
```

### Desligar o sistema

Para desligar o sistema, você pode usar o seguinte comando:

```bash
sudo shutdown -h now
```

### Consultar os processos em execução

Para listar os processos em execução no sistema, você pode usar o comando `htop`:

```bash
htop
```

Em alguns sistemas, pode ser necessário instalar o `htop` primeiro. No Ubuntu/Debian, você pode fazer isso com:

- Ubuntu/Debian:

    ```bash
    sudo apt-get install htop
    ```

- CentOS/RHEL:

    ```bash
    sudo yum install htop
    ```

O `htop` fornece uma interface interativa para visualizar e gerenciar processos em execução, permitindo que você veja o uso da CPU, memória e outras informações relevantes, seu resultado será semelhante a este:

```plaintext
PID USER      PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
1234 root       20   0  162M  12M  8.0M S  0.0  0.5   0:01.23 /usr/bin/someprocess
```

Os campos mais importantes são:

- `PID`: Identificador do processo.
- `USER`: Usuário que iniciou o processo.
- `CPU%`: Percentual de uso da CPU pelo processo.
- `MEM%`: Percentual de uso da memória pelo processo.

### Consultar a quanto tempo o sistema está em execução

Para verificar há quanto tempo o sistema está em execução, você pode usar o comando `uptime`:

```bash
uptime
```

Ele irá exibir uma saída semelhante a esta:

```plaintext
14:23:45 up 10 days,  4:12,  2 users,  load average: 0.15, 0.10, 0.05
```

### Consultar espaço em disco

Para verificar o uso do espaço em disco, você pode usar o comando `df -h`:

```bash
df -h
```

Ele irá exibir o uso do espaço em disco de forma legível para humanos em um formato semelhante a este:

```plaintext
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   20G   28G  42% /
tmpfs           2.0G     0  2.0G   0% /dev/shm
```

- O `-h` torna a saída mais legível, exibindo os tamanhos em KB, MB ou GB conforme apropriado.

### Configurar chave SSH

Para configurar uma chave SSH para autenticação sem senha, você pode usar o seguinte comando:

```bash
ssh-keygen -t rsa
```

- Siga as instruções para salvar a chave em um local padrão (geralmente `~/.ssh/id_rsa`) e defina uma senha se desejar.
- Esse comando gera um par de chaves: uma chave privada (que deve ser mantida em segredo) e uma chave pública (que pode ser compartilhada com servidores remotos) e que ficam localizadas por padrão em `~/.ssh/id_rsa` (chave privada) e `~/.ssh/id_rsa.pub` (chave pública).
- Lembre-se de proteger sua chave privada com uma senha forte.
- Após gerar a chave, copie a chave pública para o servidor remoto usando:

    ```bash
    ssh-copy-id user@remote_host
    ```

  - Substitua `user@remote_host` pelo seu nome de usuário e o endereço do host remoto.
- Agora você pode se conectar ao servidor remoto sem precisar digitar a senha:

    ```bash
    ssh user@remote_host
    ```

### Limpar chave SSH

Para limpar as chaves SSH conhecidas para um host específico, você pode usar o seguinte comando:

```bash
ssh-keygen -R <hostname_or_ip>
```

Substitua `<hostname_or_ip>` pelo nome do host ou endereço IP do servidor SSH cujas chaves você deseja remover (ex: `192.168.1.100`).

Este comando pode ser útil quando você está enfrentando problemas de autenticação SSH devido a mudanças nas chaves do servidor (ex: `Host key verification failed.`)

### Configuração e Montagem de NFS

Para instalar o cliente NFS no Linux, use os seguintes comandos dependendo da sua distribuição:

- Ubuntu/Debian:

    ```bash
    sudo apt-get install nfs-common
    ```

- CentOS/RHEL:

    ```bash
    sudo yum install nfs-utils
    ```

Em seguida, você pode montar um compartilhamento NFS usando o comando `mount`. Aqui está um exemplo:

````bash
sudo mount -t nfs <NFS_SERVER_IP>:/path/to/nfs/share /mnt/nfs
````

Substitua `<NFS_SERVER_IP>` pelo endereço IP do servidor NFS e `/path/to/nfs/share` pelo caminho do compartilhamento NFS que você deseja montar. O ponto de montagem local é `/mnt/nfs`, mas você pode alterá-lo conforme necessário, como no exemplo abaixo:

```bash
sudo mount -t nfs -o resvport,rw 192.168.1.141:/mnt/hd-b550m-1/documents ./hd-b550m-1
```

### Configurar discovery de serviços com Avahi

Para configurar o Avahi para descoberta de serviços na rede local, siga os passos abaixo:

1. Instale o Avahi:

    - Ubuntu/Debian:

        ```bash
        sudo apt-get install avahi-daemon avahi-utils
        ```

    - CentOS/RHEL:

        ```bash
        sudo yum install avahi avahi-tools
        ```

2. Inicie e habilite o serviço Avahi:

    ```bash
    sudo systemctl start avahi-daemon
    sudo systemctl enable avahi-daemon
    ```

### Instalação do docker no Ubuntu/Debian via terminal

Para instalar o Docker no Ubuntu/Debian via terminal, siga os passos abaixo:

1. Atualize o índice de pacotes:

    ```bash
    sudo apt-get update
    ```

2. Instale os pacotes necessários para permitir o uso de repositórios HTTPS:

    ```bash
    sudo apt-get install curl
    ```

3. Execute o script de instalação oficial do Docker:

    ```bash
    curl -sSL https://get.docker.com | sh
    ```

4. Adicione seu usuário ao grupo `docker` para executar comandos Docker sem `sudo`:

    ```bash
    sudo usermod -aG docker $(whoami)
    ```

- [https://docs.docker.com/engine/install/linux-postinstall/](https://docs.docker.com/engine/install/linux-postinstall/)
- [Permission denied Docker daemon](https://newbedev.com/shell-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket-at-unix-var-run-docker-sock-get-http-2fvar-2frun-2fdocker-sock-v1-24-containers-json-all-1-dial-unix-var-run-docker-sock-connect-permission-denied-code-example)

### Criar proxy SOCKS via SSH

Para criar um proxy SOCKS via SSH, você pode usar o seguinte comando:

```bash
ssh -D 8080 -q -C -N user@remote_host
```

Substitua `user@remote_host` pelo seu nome de usuário e o endereço do host remoto. O proxy SOCKS será criado na porta `8080` do seu computador local.

- [Como configurar Chrome e Firefox para usar SSH Tunnel](https://taniguti.blog/ssh-tunnels-firefox-chrome)

### Não solicitar senha ao usar sudo

Para configurar o sudo para não solicitar senha ao executar comandos, você pode editar o arquivo sudoers usando o comando `visudo`:

```bash
sudo visudo
```

Adicione a seguinte linha ao final do arquivo, substituindo `seu_usuario` pelo seu nome de usuário:

```plaintext
seu_usuario ALL=(ALL) NOPASSWD: ALL
```

### Copiar arquivos via SCP recursivamente

Para copiar arquivos e diretórios de forma recursiva usando SCP (Secure Copy), você pode usar a opção `-r`. Aqui está um exemplo de como fazer isso:

```bash
scp -r /caminho/local/do/diretorio usuario@host_remoto:/caminho/remoto/do/diretorio
```

Por exemplo, para copiar o diretório `homebridge` do servidor `b550mk` para o servidor `homebridge.local`, você pode usar o seguinte comando:

````bash
scp -r root@b550mk:/mnt/documents/homebridge root@homebridge.local:/root
````

### Obter IP e MAC do servidor

Para obter o endereço IP e o endereço MAC do servidor, você pode usar o comando `ip` ou `ifconfig`. Aqui estão os exemplos para ambos:

1. Instalando o net-tools (se necessário):

    ````bash
    apt install -y net-tools
    ````

2. Usando o comando `ifconfig`:

    ```bash
    /sbin/ifconfig -a
    ```

### Instalação do OpenRGB no Ubuntu/Debian via terminal

Para instalar o OpenRGB no Ubuntu/Debian via terminal, siga os passos abaixo:

1. Baixe o pacote .deb mais recente do OpenRGB:

    ```bash
    wget https://openrgb.org/releases/release_0.9/openrgb_0.9_amd64_bookworm_b5f46e3.deb
    ```

2. Instale o pacote usando o `dpkg`:

    ```bash
    sudo dpkg -i openrgb_0.9_amd64_bookworm_b5f46e3.deb
    ```

3. Caso queira ativar a inicialização automática do OpenRGB na inicialização do sistema, crie um serviço systemd conforme descrito na proxima anterior.

- [OpenRGB em Proxmox](https://forum.proxmox.com/threads/openrgb-container.121435/)

### Criar um serviço para ser iniciado na inicialização do sistema

Para criar um serviço que seja iniciado automaticamente na inicialização do sistema, você pode criar um arquivo de unidade do systemd. Aqui está um exemplo básico:

````ini
[Unit]
Description=OpenRGB control

[Service]
Type=oneshot
ExecStart=/usr/bin/openrgb --server --noautoconnect --autostart-enable --startminimized
User=root
Group=root

[Install]
WantedBy=multi-user.target
````

Salve este arquivo como `/etc/systemd/system/openrgb.service`. Depois, habilite o serviço para iniciar na inicialização com o seguinte comando:

```bash
systemctl enable openrgb.service
```

## Dúvidas frequentes

### O que é um servidor de salto (jump server)?

Um servidor de salto (jump server) é um servidor intermediário usado para acessar outros servidores em uma rede segura. Ele atua como um ponto de entrada controlado, permitindo que os administradores se conectem a servidores internos sem expor diretamente esses servidores à internet. O jump server geralmente possui medidas de segurança adicionais, como autenticação multifator e monitoramento de acesso.

### O que é o SSH (Secure Shell)?

SSH (Secure Shell) é um protocolo de rede criptografado usado para comunicação segura entre computadores. Ele permite que os usuários se conectem remotamente a servidores e dispositivos de rede, executem comandos e transfiram arquivos de forma segura. O SSH é amplamente utilizado para administração remota de sistemas e é conhecido por sua segurança e confiabilidade.

### O que é o NFS (Network File System)?

NFS (Network File System) é um protocolo de compartilhamento de arquivos que permite que sistemas em uma rede compartilhem arquivos e diretórios de forma transparente. Com o NFS, os usuários podem montar sistemas de arquivos remotos em seus próprios sistemas, permitindo o acesso e a manipulação de arquivos como se estivessem localmente armazenados. O NFS é amplamente utilizado em ambientes Unix/Linux para facilitar o compartilhamento de dados entre servidores e clientes.

### O que é o Avahi?

Avahi é uma implementação de código aberto do protocolo mDNS/DNS-SD (Multicast DNS/Service Discovery) que permite a descoberta automática de serviços e dispositivos em redes locais. Ele facilita a comunicação entre dispositivos sem a necessidade de configuração manual, permitindo que serviços como impressoras, compartilhamentos de arquivos e outros dispositivos sejam encontrados facilmente por outros dispositivos na mesma rede. O Avahi é amplamente utilizado em sistemas Linux para habilitar a descoberta de serviços em redes domésticas e corporativas.

### O que é o SCP (Secure Copy)?

SCP (Secure Copy) é um protocolo de rede usado para transferir arquivos de forma segura entre computadores em uma rede. Ele utiliza o protocolo SSH (Secure Shell) para fornecer autenticação e criptografia durante a transferência de arquivos, garantindo que os dados sejam protegidos contra interceptação e acesso não autorizado. O SCP é amplamente utilizado para copiar arquivos entre sistemas locais e remotos, bem como entre dois sistemas remotos.

### O que é o systemd?

systemd é um sistema de inicialização e gerenciamento de serviços para sistemas operacionais Linux. Ele é responsável por iniciar, parar e gerenciar processos e serviços durante a inicialização do sistema e ao longo do tempo de execução. O systemd utiliza arquivos de unidade (unit files) para definir como os serviços devem ser iniciados, parados e monitorados. Ele oferece recursos avançados, como paralelismo na inicialização, gerenciamento de dependências entre serviços e monitoramento de processos, tornando-o uma parte fundamental da infraestrutura de muitos sistemas Linux modernos.

### O que é o comando sudo?

O comando `sudo` (superuser do) é uma ferramenta de linha de comando usada em sistemas operacionais Unix/Linux para executar comandos com privilégios elevados, geralmente como o usuário root (superusuário). Ele permite que usuários autorizados executem tarefas administrativas e comandos que exigem permissões especiais, sem a necessidade de fazer login diretamente como root. O `sudo` também registra as atividades dos usuários, proporcionando um nível adicional de segurança e auditoria.

### O que o unix?

Unix é um sistema operacional multitarefa e multiusuário desenvolvido originalmente na década de 1970. Ele é conhecido por sua estabilidade, segurança e flexibilidade, sendo amplamente utilizado em servidores, mainframes e estações de trabalho. O Unix introduziu muitos conceitos fundamentais que influenciaram o desenvolvimento de outros sistemas operacionais, como o uso de arquivos como dispositivos, a hierarquia de diretórios e a filosofia de "fazer uma coisa e fazê-la bem". Variantes modernas do Unix incluem sistemas como Linux, BSD e macOS.

### Quem é Linus Torvalds?

Linus Torvalds é um engenheiro de software finlandês-americano, mais conhecido por ser o criador do kernel Linux, o núcleo do sistema operacional Linux. Ele iniciou o desenvolvimento do Linux em 1991 como um projeto pessoal enquanto era estudante na Universidade de Helsinque. Desde então, o Linux cresceu para se tornar um dos sistemas operacionais mais populares do mundo, especialmente em servidores, dispositivos embarcados e supercomputadores. Torvalds também é conhecido por seu papel no desenvolvimento do sistema de controle de versão Git, amplamente utilizado na indústria de software.

### O que é o kernel Linux?

O kernel Linux é o núcleo do sistema operacional Linux, responsável por gerenciar os recursos do sistema, como memória, processos, dispositivos de hardware e sistemas de arquivos. Ele atua como uma ponte entre o software e o hardware, permitindo que os aplicativos interajam com os componentes físicos do computador de maneira eficiente e segura. O kernel Linux é modular, o que significa que ele pode ser estendido com módulos adicionais para suportar novos dispositivos e funcionalidades sem a necessidade de recompilar o kernel inteiro. Ele é desenvolvido como um projeto de código aberto, com contribuições de desenvolvedores em todo o mundo.

### O que são distribuições Linux?

Distribuições Linux, ou distros, são versões do sistema operacional Linux que incluem o kernel Linux juntamente com um conjunto de software adicional, como bibliotecas, aplicativos e ferramentas de gerenciamento. Cada distribuição é projetada para atender a diferentes necessidades e preferências dos usuários, oferecendo variações em termos de interface de usuário, gerenciamento de pacotes, segurança e suporte a hardware. Exemplos populares de distribuições Linux incluem Ubuntu, Fedora, Debian, CentOS e Arch Linux. As distribuições podem ser usadas em uma variedade de dispositivos, desde computadores pessoais até servidores e dispositivos embarcados.

### O que são gerenciadores de pacotes no Linux?

Gerenciadores de pacotes no Linux são ferramentas que facilitam a instalação, atualização, remoção e gerenciamento de software em distribuições Linux. Eles automatizam o processo de download e instalação de pacotes de software, resolvendo dependências e garantindo que os aplicativos funcionem corretamente. Cada distribuição Linux geralmente possui seu próprio gerenciador de pacotes, como o APT (Advanced Package Tool) para distribuições baseadas em Debian (como Ubuntu), YUM/DNF para distribuições baseadas em Red Hat (como CentOS e Fedora) e Pacman para Arch Linux. Os gerenciadores de pacotes simplificam a administração do sistema, tornando mais fácil para os usuários manterem seus sistemas atualizados e seguros.

### O Android é baseado no kernel Linux?

Sim, o Android é baseado no kernel Linux. O sistema operacional Android utiliza uma versão modificada do kernel Linux como seu núcleo, aproveitando os recursos e a estabilidade do Linux para gerenciar o hardware do dispositivo, como processadores, memória, armazenamento e periféricos. No entanto, o Android inclui várias camadas adicionais de software, como a máquina virtual Dalvik (ou ART nas versões mais recentes), bibliotecas específicas do Android e uma interface de usuário personalizada, que diferenciam o Android de outras distribuições Linux tradicionais.

## Referências

- [A taxa de quadros é limitada a 30 FPS em sessões remotas baseadas no Windows](https://learn.microsoft.com/pt-br/troubleshoot/windows-server/remote/frame-rate-limited-to-30-fps)
- [Is it possible to copy files to QEMU image without running QEMU](https://stackoverflow.com/questions/70351250/is-it-possible-to-copy-files-to-qemu-image-without-running-qemu)
- [The Ultimate Beginner's Guide to GPU Passthrough Proxmox, Windows 10](https://www.reddit.com/r/homelab/comments/b5xpua/the_ultimate_beginners_guide_to_gpu_passthrough/)
- [How to login windows remote desktop (RDP) in windows 11 when Microsoft account and Hello Pin enabled?](https://superuser.com/questions/1715525/how-to-login-windows-remote-desktop-rdp-in-windows-11-when-microsoft-account-a)
- [Proxmox VE - Fedora CoreOS : Un mariage presque parfait / An almost perfect Union](https://wiki.geco-it.net/public:pve_fcos)
- [Accessing an LXC container](https://subscription.packtpub.com/book/cloud-and-networking/9781788397605/7/ch07lvl1sec42/accessing-an-lxc-container)
- [Instalando e Configurando o ZSH no Ubuntu 20.04](https://medium.com/@gutoinfo.ribeiro/instalando-e-configurando-o-zsh-no-ubuntu-20-04-4ef8a2499ed5)
- [Configurando o systemd-resolved para resolução DNS usando os servidores da nordvpn](https://plus.diolinux.com.br/t/configurando-o-systemd-resolved-para-resolucao-dns-usando-os-servidores-da-nordvpn/51530)
- [Network File System (NFS)](https://ubuntu.com/server/docs/network-file-system-nfs)
- [Google Cloud Platform - Regions and zones](https://cloud.google.com/compute/docs/regions-zones)
- [automated-kubernetes-proxmox](https://github.com/matthieuml/automated-kubernetes-proxmox/blob/main/packer-image/ubuntu.pkr.hcl)
- [Terraform Dynamic Blocks](https://www.cloudbolt.io/terraform-best-practices/terraform-dynamic-blocks/)
- [Basic Authentication for ingress host](https://medium.com/@athulmve/basic-authentication-for-ingress-host-9abeef927902)
- [Step By Step Guide for Proxmox GPU Passthrough!](https://akashrajvanshi.medium.com/step-by-step-guide-for-proxmox-gpu-passthrough-6e885898fdae)
- [Use hostPath volumes](https://www.alibabacloud.com/help/en/ack/ack-managed-and-ack-dedicated/user-guide/use-hostpath-volumes)
- [Basic Authentication for ingress host](https://medium.com/@athulmve/basic-authentication-for-ingress-host-9abeef927902)
- [microsoft/bringing-old-photos-back-to-life](https://replicate.com/microsoft/bringing-old-photos-back-to-life?input=docker)
- [Leveraging LLMs in your Obsidian Notes](https://ollama.com/blog/llms-in-obsidian)
- [sync-elasticsearch-mysql](https://github.com/brunocarvalhodearaujo/sync-elasticsearch-mysql/blob/main/docker-compose.yaml)
- [NVIDIA GPU Passthrough in Proxmox LXCs](https://clait.sh/posts/gpu-passthrough-proxmox/)
- [node-cloud-blobstore-wrapper](https://github.com/adobe/node-cloud-blobstore-wrapper/blob/master/lib/aws.js)
- [argo-tunnel-examples](https://github.com/cloudflare/argo-tunnel-examples/blob/master/sharing-k8s-dashboard/dashboard-auth-proxy/deployment.yaml)
- [oss gallery](https://oss.gallery/?q=s3)
- [umbrel apps](https://apps.umbrel.com/app/maybe)
- [Hiden Storage Local dan Local-Lvm](https://dev.to/seno21/hiden-storage-local-dan-local-lvm-273a)
- [Deploying Amazon API Gateway and Lambda with Terraform](https://dev.to/aws-builders/deploying-amazon-api-gateway-and-lambda-with-terraform-1i2o)
- [FUSE-based file system backed by Amazon S3](https://github.com/s3fs-fuse/s3fs-fuse)
- [Lose Network After Installing PCI NIC](https://forum.proxmox.com/threads/lose-network-after-installing-pci-nic.144611/)
- [Passthrough Physical Disk to Virtual Machine (VM)](https://pve.proxmox.com/wiki/Passthrough_Physical_Disk_to_Virtual_Machine_(VM))
- [Blocos CIDR da VPC](https://docs.aws.amazon.com/pt_br/vpc/latest/userguide/vpc-cidr-blocks.html)
- [pfsense openvpn](https://simplificandoredes.com/instalar-e-configurar-servidor-openvpn-no-pfsense/#google_vignette)
- [Replace your Homelab VPN with Cloudflare Zero Trust](https://medium.com/@sirkirby/replace-your-homelab-vpn-with-cloudflare-zero-trust-8416a1d7045e)
- [Cloud-Init Support](https://pve.proxmox.com/wiki/Cloud-Init_Support)
- [Step by Step process of how to add and mount EBS Volume on Ubuntu EC2 Linux Instance](https://medium.com/@mudasirhaji/step-by-step-process-of-how-to-add-and-mount-ebs-volume-on-ubuntu-ec2-linux-instance-a4be8870a4dd)
- [az-devops-agents-k8s](https://github.com/anveshmuppeda/az-devops-agents-k8s/blob/main/helm-charts/az-selfhosted-agents/templates/_helpers.tpl)
- [pmint93\helm-charts](https://github.com/pmint93/helm-charts/tree/master)
- [Building Container-Optimized OS from source](https://cloud.google.com/container-optimized-os/docs/how-to/building-from-open-source)
- [EAP no desenvolvimento de software](https://dev.to/yuripeixinho/eap-desenvolvimento-de-softwa-509o)
- [Node.JS-ADS-System](https://github.com/MohamedAlabasy/Node.JS-ADS-System/blob/main/src/controllers/adsController.ts)
- [Desenvolva um código melhor com Object Calisthenics](https://medium.com/@rafaelcruz_48213/desenvolva-um-código-melhor-com-object-calisthenics-d5364767a9ba)
- [Next.js 14+ Performance Optimization: Modern Approaches for Production Applications](https://dev.to/hijazi313/nextjs-14-performance-optimization-modern-approaches-for-production-applications-3n65)
- [Gemini Code Assist: AI coding assistance for any language](https://codeassist.google)
- [Medium | itautecnologia](https://medium.com/@itautecnologia)
- [OSS | gallery](https://oss.gallery)
- [Reduce memory usage using NodeJs Stream API and Generator in IO intensive application](https://medium.com/@yiqun.rong2/reduce-memory-usage-using-nodejs-stream-api-and-generator-in-io-intensive-application-23e84735a523)
- [opentelemetry-operations-js](https://github.com/GoogleCloudPlatform/opentelemetry-operations-js/blob/b08a217bc40a4a7e69aae311b24f050d85a9bc6c/samples/instrumentation-quickstart/src/util.ts)
- [NodeJS graphql Client usage with Promise](https://the-guild.dev/graphql/ws/recipes)
- [opentelemetry-operations-js](https://github.com/GoogleCloudPlatform/opentelemetry-operations-js/blob/b08a217bc40a4a7e69aae311b24f050d85a9bc6c/samples/instrumentation-quickstart/Dockerfile)
- [Proxmox - BTRFS](https://pve.proxmox.com/wiki/BTRFS)
- [External secrets](https://external-secrets.io)
- [External Basic Authentication](https://kubernetes.github.io/ingress-nginx/examples/auth/external-auth/)
- [Fix for Remote Desktop Error code 0x207 on Mac for Ubuntu](https://dev.to/emile1636/rdp-error-code-0x207-on-mac-for-ubuntu-24-d6d)