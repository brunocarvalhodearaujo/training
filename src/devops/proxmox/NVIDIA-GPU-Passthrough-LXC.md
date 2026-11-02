# Passthrough de GPU NVIDIA no Proxmox em containers LXC

Este manual descreve o procedimento para habilitar o passthrough direto de GPU NVIDIA
para containers LXC no Proxmox VE, com foco em cenários de computação de inferência
(baseado em Ollama e NVIDIA Container Toolkit).

> **Nível:** Avançado. Exige acesso de root ao host e conhecimento de virtualização.

## 1. Visão Geral

O objetivo é disponibilizar uma GPU NVIDIA física a um único container LXC, mantendo
a GPU em execução no kernel do host (modo *mSR-IO* com `nvidia-uvm`), de forma que
soluções containerizadas (ex.: Docker com NVIDIA Container Toolkit) possam acessar o
dispositivo.

Este manual cobre três fases:

1. **Preparação do host** — habilitação do AMD-IOMMU, configuração do GRUB e instalação
   do driver NVIDIA no sistema operacional do host.
2. **Provisionamento do container** — criação do LXC com dispositivos NVIDIA anexados e
   configuração do ambiente de runtime.
3. **Configuração do software** — instalação do driver (sem módulos de kernel), do
   NVIDIA Container Toolkit e do Docker dentro do container.

## 2. Pré-requisitos

- Host Proxmox VE com kernel suportando **AMD-IOMMU** (plataforma AMD).
- GPU NVIDIA compatível (ex.: GeForce RTX 3060).
- Acesso de root e permissões de administrador.
- Driver NVIDIA correspondente ao modelo da GPU disponível para download.
- Espaço de armazenamento suficiente para o disco do container e modelos.

## 3. Preparação do Host

### 3.1 Instalação de dependências

Instale os pacotes necessários para compilar módulos DKMS e configurar o ambiente de build:

```bash
apt install pve-headers dkms pkg-config
```

### 3.2 Configuração do GRUB e habilitação do AMD-IOMMU

Edite o arquivo de configuração do GRUB:

```bash
nano /etc/default/grub
```

Adicione os parâmetros `amd_iommu=on` e `iommu=pt` à linha `GRUB_CMDLINE_LINUX_DEFAULT`:

```
GRUB_CMDLINE_LINUX_DEFAULT="amd_iommu=on iommu=pt quiet splash"
```

Atualize a configuração do GRUB:

```bash
update-grub
```

Reinicie o host:

```bash
reboot
```

> Após a reinicialização, confirme que o IOMMU está habilitado:
> ```bash
> dmesg | grep -i -E "DMAR|AMD-IOMMU"
> lsirqd
> ```

### 3.3 Instalação do driver NVIDIA no host

Baixe o driver mais recente a partir de [NVIDIA's website](https://www.nvidia.com/Download/index.aspx).
Por exemplo, para uma GeForce RTX 3060, o arquivo `NVIDIA-Linux-x86_64-595.84.run` pode ser usado.

```bash
chmod +x NVIDIA-Linux-x86_64-595.84.run
./NVIDIA-Linux-x86_64-595.84.run
```

Verifique o funcionamento do driver e a presença dos dispositivos NVIDIA:

```bash
nvidia-smi
```

Os dispositivos devem aparecer em:

```plaintext
root@b550m:~# ls -al /dev/nvidia*
crw-rw-rw- 1 root root 509,   0 Jun 24 16:57 /dev/nvidia-uvm
crw-rw-rw- 1 root root 509,   1 Jun 24 16:57 /dev/nvidia-uvm-tools
crw-rw-rw- 1 root root 195,   0 Jun 24 16:56 /dev/nvidia0
crw-rw-rw- 1 root root 195, 255 Jun 24 16:56 /dev/nvidiactl

/dev/nvidia-caps:
total 0
drwxr-xr-x  2 root root     80 Jun 24 16:57 .
drwxr-xr-x 20 root root   4700 Jun 24 16:57 ..
cr--------  1 root root 234, 1 Jun 24 16:57 nvidia-cap1
cr--r--r--  1 root root 234, 2 Jun 24 16:57 nvidia-cap2
```

### 3.4 Criação dos dispositivos NVIDIA no boot

Os dispositivos NVIDIA costumam ser inicializados sob demanda. Para garantir que eles
estejam presentes na inicialização do host, adicione uma entrada ao crontab:

```bash
crontab -e
```

```bash
@reboot /usr/bin/nvidia-smi > /dev/null
```

## 4. Provisionamento do Container LXC

### 4.1 Criação do container

Crie um novo container LXC no Proxmox. Este procedimento pode ser executado pela interface
web ou pela linha de comando. Por exemplo, para criar um container Ubuntu 20.04 com ID 114
e anexar os dispositivos NVIDIA:

```diff
arch: amd64
cores: 4
+dev0: /dev/nvidia0
+dev1: /dev/nvidiactl
+dev2: /dev/nvidia-uvm
+dev3: /dev/nvidia-uvm-tools
+dev4: /dev/nvidia-caps/nvidia-cap1
+dev5: /dev/nvidia-caps/nvidia-cap2
+dev6: /dev/net/tun
features: nesting=1
hostname: ollama
memory: 16384
net0: name=eth0,bridge=vmbr0,firewall=1,hwaddr=BC:24:11:AD:AB:5C,ip=dhcp,ip6=dhcp,type=veth
onboot: 1
ostype: ubuntu
rootfs: local-btrfs:114/vm-114-disk-0.raw,size=240G
startup: up=300
swap: 16384
unprivileged: 1
lxc.environment: NVIDIA_VISIBLE_DEVICES=all
lxc.environment: NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video
```

### 4.2 Inicialização e entrada no container

```bash
pct start 114
pct enter 114
```

## 5. Configuração do Software no Container

### 5.1 Instalação de dependências e driver

Atualize o repositório e instale as dependências necessárias:

```bash
apt update
apt install build-essential dkms pkg-config gnupg2
```

Instale o driver NVIDIA **sem módulos de kernel** (os módulos já estão disponíveis no
host via `nvidia-uvm`):

```bash
chmod +x NVIDIA-Linux-x86_64-595.84.run
./NVIDIA-Linux-x86_64-595.84.run --no-kernel-modules
```

### 5.2 Configuração do NVIDIA Container Toolkit

Habilite a configuração necessária para que o Docker acesse a GPU. Defina
`no-cgroups = true` no arquivo de configuração do runtime do container NVIDIA:

```
/etc/nvidia-container-runtime/config.toml
```

### 5.3 Configuração do runtime da Vulkan

Se uma advertência sobre componentes Vulkan for exibida, instale o loader e pacotes
relacionados:

```bash
apt install \
  vulkan-utils \
  vulkan-loader \
  vulkan-icd-loader \
  libvulkan1
```

### 5.4 Instalação do Docker

Instale o Docker e o Composer no container. Em seguida, aplique as variáveis de ambiente
no arquivo de configuração do container (`/etc/pve/lxc/114.conf`):

```plaintext
lxc.environment: NVIDIA_VISIBLE_DEVICES=all
lxc.environment: NVIDIA_DRIVER_CAPABILITIES=compute,graphics,utility,video
```

Reinicie o container para aplicar as alterações:

```bash
pct restart 114
```

## 6. Verificação

### 6.1 Verificação do driver após reinicialização

Confirme que o driver continua funcionando após o `pct restart`:

```bash
nvidia-smi
```

### 6.2 Instalação do serviço Ollama

Instale o Docker e o Composer, e aplique o arquivo `docker-compose` a seguir para iniciar
o serviço Ollama com suporte à GPU:

```plaintext
BC-24-11-AD-AB-5C
192.168.0.117
```

```yaml
volumes:
  ollama-data:
    driver: local
  ollama-models:
    driver: local
  ollama-tmpdir:
    driver: local

services:
  ollama:
    image: ollama/ollama:0.30.11
    restart: unless-stopped
    environment:
      - HOME=/.ollama
      - OLLAMA_MODELS=/.ollama/models
      - OLLAMA_TMPDIR=/.ollama/tmpdir
      - OLLAMA_NOPRUNE=true
      #- OLLAMA_NUM_PARALLEL=1
      #- OLLAMA_MAX_LOADED_MODELS=1
      #- OLLAMA_VULKAN=true
      - HIP_VISIBLE_DEVICES=true
      - OLLAMA_KEEP_ALIVE=-1
      - OLLAMA_CONTEXT_LENGTH=16384
    ports:
      - 11434:11434
    volumes:
      - ollama-data:/.ollama
      - ollama-models:/.ollama/models
      - ollama-tmpdir:/.ollama/tmpdir
      #- /.ollama/.ollama/id_ed25519
      #- /.ollama/.ollama/id_ed25519.pub
    deploy:
      replicas: 1
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities: [gpu]
```

## 7. Solução de Problemas

| Sintoma | Ação |
| --- | --- |
| `nvidia-smi` não responde no container | Verifique se os `devN` estão presentes e se `NVIDIA_DRIVER_CAPABILITIES` inclui `compute`. |
| Erro de acesso à GPU pelo Docker | Confirme `no-cgroups = true` em `/etc/nvidia-container-runtime/config.toml` e reinicie o container. |
| Advertência sobre Vulkan | Instale `vulkan-loader` e `libvulkan1` (ver seção 5.3). |
| GPU ausente após reboot do host | Verifique se a entrada `@reboot` no crontab está presente; confirme `amd_iommu=on` no GRUB. |

## 8. Referências

- [NVIDIA GPU Passthrough in Proxmox LXCs](https://clait.sh/posts/gpu-passthrough-proxmox/)
- [Docker is unable to access GPU in LXC GPU Passthrough](https://forum.proxmox.com/threads/docker-is-unable-to-access-gpu-in-lxc-gpu-passthrough.125066/)
- [Installing the NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
