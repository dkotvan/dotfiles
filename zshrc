export RPS1='' # purer and vim mode will not conflict anymore
# Initialize Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Load Antibody plugins
if [[ ! -a ~/.zsh_plugins.sh   ]]; then
   antibody bundle < ~/dotfiles/zsh_plugins.txt > ~/.zsh_plugins.sh 
fi
export ZSH="$(antibody home)/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh"
source ~/.zsh_plugins.sh

export EDITOR='nvim'

# Homebrew Support
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
fpath=(/home/linuxbrew/.linuxbrew/share/zsh-completions $fpath)

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"

bindkey -v

source ~/dotfiles/alias.zsh

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

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a0a0a0,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

FZF_WIDGET_TMUX=1
FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
FZF_CTRL_T_OPTS="--border --preview='bat --paging=never {}'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/home/linuxbrew/.linuxbrew/opt/jdk@8/bin:$PATH"

