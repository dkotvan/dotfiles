export DOTFILES=$HOME/dotfiles

if [[ $OSTYPE == linux* ]]; then
  # Initialize Homebrew
  eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi

DISABLE_AUTO_TITLE=”true”
DISABLE_AUTO_UPDATE=true

source $DOTFILES/antidote.zsh

export EDITOR="${EDITOR:-nvim}"

bindkey -v

if [[ $OSTYPE == darwin* ]]; then
  source $DOTFILES/osx/init.zsh
fi
source $DOTFILES/alias.zsh
for file in $DOTFILES/local/*.zsh; do
    source "$file"
done

eval "$(nodenv init -)"

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt bang_hist                 # Treat the '!' character specially during expansion.
setopt extended_history          # Write the history file in the ":start:elapsed;command" format.
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire duplicate entries first when trimming history.
setopt hist_ignore_dups          # Don't record an entry that was just recorded again.
setopt hist_ignore_all_dups      # Delete old recorded entry if new entry is a duplicate.
setopt hist_find_no_dups         # Do not display a line previously found.
setopt hist_ignore_space         # Don't record an entry starting with a space.
setopt hist_reduce_blanks        # Remove superfluous blanks before recording entry.
setopt auto_cd                   # Don't need to chdir to directory

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#11cca0,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true
export ZSH_AUTOSUGGEST_COMPLETION_IGNORE='brew *'

# Fix Kitty wih ZSH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

FZF_WIDGET_TMUX=1
FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="--border --preview='bat --paging=never {}'"

 source <(fzf --zsh)

MODE_CURSOR_VIINS="#00ff00 blinking block"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

if [[ $OSTYPE == darwin* ]]; then
  export GPG_TTY=`tty` # Makes gpg and git works well
fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

zmodload zsh/zpty

eval "$(rbenv init -)"

eval "$(starship init zsh)"

export GOENV_ROOT=$HOME/.goenv
export PATH="$GOENV_ROOT/bin:$HOME/go/bin:$PATH" 

eval "$(goenv init -)" 

export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"

export PATH="/usr/local/sbin:$PATH"
export PATH="${HOME}/.local/bin:${PATH}"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"

eval "$(zoxide init zsh)"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# . $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh
eval "$(atuin init zsh --disable-up-arrow)"

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc
