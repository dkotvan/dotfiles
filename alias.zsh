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
alias mro="lab mr browse"
alias mrco="lab mr checkout -t -f "
alias brdiff="git difftool --dir-diff --tool=vimdirdiff"
# Copied from https://unix.stackexchange.com/a/97922
gclonecd() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

cdp() {
  local cmd="fzf"
  if [[ -n "$1" ]]; then
    cmd="fzf -q $1"
  fi

  echo "<$1> <$cmd>"

  cd $(fd -t d --hidden --no-ignore '^\.git$' $HOME/{Projects,Opensource,dotfiles} | sed -r 's/\/.git\/$//' | eval $cmd)
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
  (cd $HOME/dotfiles && brew bundle && brew update && brew outdated && brew upgrade)
  update_nvim
}

alias nvim_server="nvim --listen /tmp/nvimsocket"

# copied from https://prefetch.net/blog/2020/07/14/decoding-json-web-tokens-jwts-from-the-linux-command-line/
jwtd() {
    if [[ -x $(command -v jq) ]]; then
         jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
         echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

