# Git

Guia rápido com os principais comandos de Git.

## Comandos essenciais

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

## Comandos úteis

- `git rebase <branch>`: reaplica commits em outra base.
- `git stash`: guarda mudanças temporariamente.
- `git log --oneline`: mostra histórico resumido.
- `git diff`: exibe diferenças de código.
- `git remote -v`: lista remotos configurados.
- `git tag <tag>`: cria uma tag.
- `git reset --hard <commit>`: volta para um commit e descarta alterações posteriores.

## Dicas rápidas

- Configure identidade uma vez:
	- `git config --global user.name "Seu Nome"`
	- `git config --global user.email "seu.email@example.com"`
- Use `git add -p` para adicionar mudanças por partes.
- Use `git cherry-pick <commit>` para aplicar um commit específico de outra branch.