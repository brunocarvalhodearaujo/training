# Git

![Git Logo](https://git-scm.com/images/logos/downloads/Git-Logo-2Color.png)

O Git é um sistema de controle de versão distribuído amplamente utilizado para gerenciar projetos de software. Ele permite que os desenvolvedores acompanhem as mudanças no código-fonte ao longo do tempo, colaborem com outros desenvolvedores e mantenham um histórico completo do desenvolvimento do projeto.

## Principais comandos

Abaixo estão alguns dos principais comandos do Git que são essenciais para o uso diário:

### Comandos essenciais

Os comandos a seguir são fundamentais para trabalhar com repositórios Git:

- `git init`: cria um repositório local.
- `git clone <url>`: baixa um repositório remoto.
- `git status`: mostra o estado atual dos arquivos.
- `git add <arquivo>`: prepara um arquivo para commit.
- `git commit -m "mensagem"`: registra as mudanças.
- `git push`: envia commits para o remoto.
- `git pull`: traz e integra mudanças do remoto.
- `git branch`: lista branches.
- `git checkout <branch>`: troca de branch.
- `git merge <branch>`: junta outra branch na atual.

### Comandos úteis

Os comandos a seguir são úteis para tarefas mais avançadas e para melhorar a eficiência no uso do Git:

- `git rebase <branch>`: reaplica commits em outra base.
- `git stash`: guarda mudanças temporariamente.
- `git log --oneline`: mostra histórico resumido.
- `git diff`: exibe diferenças de código.
- `git remote -v`: lista remotos configurados.
- `git tag <tag>`: cria uma tag.
- `git reset --hard <commit>`: volta para um commit e descarta alterações posteriores.

### Dicas rápidas

As seguintes dicas podem ajudar a melhorar a experiência de uso do Git:

- Configure identidade uma vez:
  - `git config --global user.name "Seu Nome"`
  - `git config --global user.email "seu.email@example.com"`
- Use `git add -p` para adicionar mudanças por partes.
- Use `git cherry-pick <commit>` para aplicar um commit específico de outra branch.
