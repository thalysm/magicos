# 🪄 MagicOS - Arch-based Distribution

MagicOS é uma distribuição Linux baseada em Arch Linux, focada em performance, estética moderna (utilizando a fonte **Geist**) e facilidade de uso com o instalador **Calamares**.

## 🚀 Como Buildar a ISO

Para gerar a ISO da MagicOS, você precisa de um ambiente Arch Linux ou uma distro derivada (como EndeavourOS) com o pacote `archiso` instalado.

### Pré-requisitos
```bash
sudo pacman -S --needed archiso base-devel
```

### Comandos de Build
Utilize o `Makefile` incluído para facilitar o processo:

- **Gerar a ISO**: `make build`
- **Limpar arquivos temporários**: `make clean`
- **Limpeza profunda (RECOMENDADO antes de novos builds)**: `make distclean`

---

## 🛠️ Estrutura do Projeto

- `airootfs/`: Conteúdo que será copiado para a raiz da ISO final.
- `packages.x86_64`: Lista de todos os pacotes que serão instalados na ISO.
- `pacman.conf`: Configurações de repositórios (Arch, EndeavourOS, Garuda e Chaotic-AUR).
- `profiledef.sh`: Definições globais da ISO (nome, label, formato da imagem).

---

## ✨ Customizações Técnicas

### Calamares Ninja
Para evitar conflitos de arquivos durante o build, os arquivos customizados do Calamares são armazenados em `airootfs/etc/calamares-custom` e restaurados automaticamente no boot da ISO através do serviço `magicos-custom.service`.

### Identidade Visual
A MagicOS utiliza a fonte **Geist** da Vercel para uma experiência tipográfica premium no terminal e na interface KDE Plasma.

---

## ⚠️ Avisos Importantes
- O build deve ser realizado com privilégios de superusuário (`sudo`).
- Certifique-se de ter pelo menos 20GB de espaço em disco livre para o diretório `work/`.
