autoload -Uz compinit && compinit

[[ -e $HOME/.antidote ]] \
  || git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
[[ -e $DOTFILES/zsh_plugins.txt ]] || touch $DOTFILES/zsh_plugins.txt

source $HOME/.antidote/antidote.zsh
[[ -e $HOME/.zsh_plugins.zsh ]] \
  || antidote bundle <$DOTFILES/zsh_plugins.txt >$HOME/.zsh_plugins.zsh

# Set ZSH path BEFORE sourcing plugins (oh-my-zsh needs this early)
export ZSH="$HOME/Library/Caches/antidote/github.com/ohmyzsh/ohmyzsh"

# source static plugins file
source $HOME/.zsh_plugins.zsh
