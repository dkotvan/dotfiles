# Git aliases
if [[ $OSTYPE == darwin* ]]; then
  alias prci='open `hub ci-status -f %U`'
  SED_EXEC='gsed'
else
  alias prci='xdg-open `hub ci-status -f %U`'
  SED_EXEC='sed'
fi
alias prl="hub pr list"
alias pro="hub pr show"
alias prco="hub pr checkout"
alias mrl="lab mr list"
alias mro="lab mr show"
alias mrco="lab mr checkout"
alias brdiff="git difftool --dir-diff --tool=vimdirdiff"

# Copied from https://unix.stackexchange.com/a/97922
gclonecd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# NVIM
alias update_nvim='nvim -c "try | call dein#update() | messages | finally | qall! | endtry" --headless'
alias ngst='nvim -c ":G"'
alias note='nvim -c ":SimplenoteList"'

# Tmux

alias tm="tmux attach || tmux new"

# UPdate everything

alias update_everything="antibody update && brew bundle && brew update && echo '===============' && brew outdated && brew upgrade && brew upgrade --cask"

