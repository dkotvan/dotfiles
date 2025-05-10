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

__get_cached_results() {
  local results_cache="$HOME/.cdl_results_cache"

  if [[ -f "$results_cache" && $(find "$results_cache" -mmin -960) ]]; then
    cat "$results_cache"
  else
    local results=$(fd -t d --no-ignore --hidden --prune '\.git$' ~/Projects/ | sed -r 's/\/.git\/$//')
    echo "$results" > "$results_cache"  # Cache the results
    echo "$results"
  fi
}

__force_update_cached_results() {
  local results_cache="$HOME/.cdl_results_cache"
  rm "$results_cache"
  __get_cached_results
}

__cd_and_rename_tmux_window() {
  cd "$1"
  local pane_count=$(tmux list-panes -t "$(tmux display -p '#S:#I')" | wc -l)

  if [[ "$pane_count" -eq 1 ]]; then
    tmux rename-window "$(basename "$1")"
  fi
}

__cd_with_action() {
  local param="$1"
  local action="$2"
  local cmd="fzf"
  local results=$(__get_cached_results)

  if [[ -n "$param" ]]; then
    local matched_dir=$(echo "$results" | grep -E "/$param$")
    if [[ -n "$matched_dir" ]]; then
      eval "$action \"$matched_dir\""
      return
    fi
  fi

  if [[ -n "$param" ]]; then
    cmd="fzf -q $param"
  fi

  local selected_dir="$(echo "$results" | eval $cmd)"
  eval "$action \"$selected_dir\""
}

cdl() {
  __cd_with_action "$1" "__cd_and_rename_tmux_window"
}

cdi() {
  __cd_with_action "$1" "idea"
}

cdc() {
  __cd_with_action "$1" "cursor"
}

cdz() {
  __cd_with_action "$1" "zed"
}

cdv() {
  __cd_with_action "$1" "code"
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
