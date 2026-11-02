# OpenRGB no Proxmox

Manual de configuração e utilização do [OpenRGB](https://openrgb.org/) em um ambiente [Proxmox VE](https://www.proxmox.com/).

> O OpenRGB é uma ferramenta para controlar dispositivos de iluminação RGB conectados por USB (teclados, mouses, ventoinhas, caixas de som, etc.). Este manual descreve como instalar o serviço em um nó Proxmox e mantê-lo rodando de forma persistente.

## 1. Requisitos

- Nó Proxmox VE com acesso `root` por SSH.
- Dispositivos RGB conectados e reconhecidos pelo sistema (USB).
- Acesso de administrador (sudo) à máquina hospedeira.

## 2. Download e Instalação

Baixe o pacote `.deb` compatível com sua distribuição e instale-o localmente.

### 2.1 Download

```sh
wget https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_candidate_1.0rc2/openrgb_1.0rc2_amd64_trixie_0fca93e.deb
```

> Substitua o arquivo pela versão compatível com sua distribuição (ex.: `bookworm` para Debian 12, `trixie` para Debian 13).

### 2.2 Instalação

```sh
apt install ./openrgb_1.0rc2_amd64_trixie_0fca93e.deb
```

## 3. Configuração do Serviço

Crie o arquivo de serviço no diretório de sistemas do systemd:

```sh
sudo mkdir -p /etc/systemd/system
sudo nano /etc/systemd/system/openrgb.service
```

Cole a seguinte configuração:

```ini
[Unit]
Description=OpenRGB control

[Service]
Type=oneshot
ExecStart=/usr/bin/openrgb --server --noautoconnect --autostart-enable --startminimized
User=root
Group=root

[Install]
WantedBy=multi-user.target
```

## 4. Habilitando o Serviço

Ative o serviço para que ele seja inicializado automaticamente na inicialização do sistema:

```sh
sudo systemctl enable openrgb.service
```

## 5. Gerenciamento do Serviço

Com o serviço registrado no systemd, é possível controlá-lo pelos comandos padrão:

```sh
# Iniciar o serviço
sudo systemctl start openrgb.service

# Parar o serviço
sudo systemctl stop openrgb.service

# Verificar o status
systemctl status openrgb.service

# Reiniciar o serviço
sudo systemctl restart openrgb.service
```

## 6. Verificando a Conexão

Para confirmar que o servidor OpenRGB está rodando e detectando seus dispositivos, execute:

```sh
openrgb --list-devices
```

## 7. Referências

- [Fórum Proxmox — OpenRGB em Container](https://forum.proxmox.com/threads/openrgb-container.121435/)
- [Site Oficial do OpenRGB](https://openrgb.org/)
