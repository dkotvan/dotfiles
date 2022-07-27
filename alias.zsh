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
alias mrco="lab mr checkout -t -f "
alias brdiff="git difftool --dir-diff --tool=vimdirdiff"

# Copied from https://unix.stackexchange.com/a/97922
gclonecd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

alias ngst='nvim -c ":G"'

update_nvim() {
  echo "update vim"
  FORCE_VSCODE=true nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

update_everything() {
  echo "update zsh plugins"
  rm ~/.zsh_plugins.zsh && antidote update
  echo "update brew packages"
  brew bundle && brew update && brew outdated && brew upgrade
  update_nvim
}
