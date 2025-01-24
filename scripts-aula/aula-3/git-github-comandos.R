# ctrl + shift + R para criar a linha divisoria

# exemplo -----------------------------------------------------------------


# Configuração ----------------------------------------
# install.packages("usethis")

# Situation report
usethis::git_sitrep()

# Configurar nome e email -----------------------------------------------------
# ── Git global (user)
# • Name: "Beatriz Milz"
# • Email: "milz.bea@gmail.com"

usethis::use_git_config(
  user.name = "SEU NOME",
  user.email = "EMAIL QUE VOCE USA NO GITHUB"
)

# Verificar se deu certo no situation report
usethis::git_sitrep()

# Configurar token -------------------------------------
# Personal access token for "https://github.com":
#  <unset>

usethis::create_github_token()

# Configurar credenciais ------------------------------
gitcreds::gitcreds_set()

# reiniciar a sessão do RStudio

# Verificar se deu certo no situation report

usethis::git_sitrep()

# • Personal access token for "https://github.com":
#   <discovered>


# Começar a usar o git em um projeto  --------------
# ctrl + shift + R para criar a linha divisoria

# Iniciar o git no projeto
usethis::use_git()

usethis::use_github() # público

usethis::use_github(private = TRUE) # privado

# comandos de git (para usar no terminal)
# adicionar um arquivo específico em staged
# git add git-github-comandos.R

# adicionar todos os arquivos em staged
# git add .

# ver o status do meu projeto
# git status

# commitar as mudanças
# commit -m "mensagem de commit"

# enviar as mudanças
# git push

# buscar mudanças
# git pull

# Exemplo de commit pelo GitHub desktop

# ver o histórico de commits
# git log

# criar um novo branch
# git checkout -b nome-do-branch

# mudar para um branch existente
# git checkout nome-do-branch

# mesclar um branch com o branch atual
# git merge nome-do-branch

# ver os branches existentes
# git branch

# deletar um branch
# git branch -d nome-do-branch

# clonar um repositório remoto
# git clone url-do-repositorio

# ver as diferenças entre o código atual e o último commit
# git diff

# reverter um arquivo para o estado do último commit
# git checkout -- nome-do-arquivo

# reverter o repositório para um commit específico
# git reset --hard id-do-commit

# criar um tag
# git tag -a v1.0 -m "Versão 1.0"

# enviar tags para o repositório remoto
# git push --tags
