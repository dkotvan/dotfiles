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

alias ngst='nvim -c ":G"'
alias nvimc='nvim -c "ClaudeCode"'
alias nvimcr='nvim -c "ClaudeCode --resume"'

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

# Completion function for cdl, cdc, and cdi
__cd_completion() {
  local results=$(__get_cached_results)
  local -a repos
  local query="${words[2]}"
  
  # Extract just the repo names (basenames) and store in array
  while IFS= read -r line; do
    [[ -n "$line" ]] && repos+=($(basename "$line"))
  done <<< "$results"
  
  # Standard zsh completion with filtering (works for tab completion)
  # This provides tab completion that filters as you type
  # Example: cdc service-ac<tab> will complete to service-account if unique
  _describe 'repository' repos
}

# Register completion for cdl, cdc, and cdi
compdef __cd_completion cdl cdc cdi

# Enhanced tab completion with fzf support
# When fzf is available, Tab will show fzf for cdl/cdc/cdi commands
if command -v fzf &> /dev/null; then
  # Widget that intercepts Tab and uses fzf for cdl/cdc/cdi commands
  __cd_fzf_complete_widget() {
    local cmd="${BUFFER%% *}"
    # Check if we're completing for cdl, cdc, or cdi
    if [[ "$cmd" =~ ^(cdl|cdc|cdi)$ ]]; then
      # Extract the query (everything after the command and space)
      local query="${BUFFER#${cmd} }"
      query="${query## }"  # Remove leading spaces
      
      local results=$(__get_cached_results)
      local selected=$(echo "$results" | while IFS= read -r line; do
        basename "$line"
      done | fzf -q "$query" --height=40% --reverse --border --select-1 --exit-0 2>/dev/null)
      
      if [[ -n "$selected" ]]; then
        BUFFER="${cmd} ${selected}"
        CURSOR=${#BUFFER}
        zle redisplay
        return
      fi
    fi
    
    # For other commands or if fzf was cancelled, use standard completion
    zle expand-or-complete
  }
  zle -N __cd_fzf_complete_widget
  
  # Bind Tab to use fzf for cdl/cdc/cdi commands
  # This makes Tab show fzf when typing these commands
  # Note: This only affects cdl/cdc/cdi, other commands use standard completion
  bindkey '^I' __cd_fzf_complete_widget
fi
