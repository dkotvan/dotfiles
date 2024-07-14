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

cdl() {
  local cmd="fzf"
  if [[ -n "$1" ]]; then
    cmd="fzf -q $1"
  fi

  cd $(fd -t d --no-ignore --hidden --prune '\.git$' ~/Projects/ | sed -r 's/\/.git\/$//' | eval $cmd)
}

alias ngst='nvim -c ":G"'

update_nvim() {
  echo "update neovim"
  nvim --headless "+Lazy! sync" +qa
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

aws_env() {
export AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id --profile $1);
export AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key --profile $1);
export AWS_DEFAULT_REGION=$(aws configure get region --profile $1);
export AWS_SESSION_TOKEN=$(aws configure get aws_session_token --profile $1);
echo "$1 environment variables exported";
}
