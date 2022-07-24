# Load Antibody plugins
# if [[ ! -a ~/.zsh_plugins.sh   ]]; then
#    antibody bundle < $DOTFILES/zsh_plugins.txt > ~/.zsh_plugins.sh 
# fi
# source ~/.zsh_plugins.sh

autoload -Uz compinit && compinit

if [[ ! $HOME/.zsh_plugins.zsh -nt $DOTFILES/zsh_plugins.txt ]]; then
  [[ -e $HOME/.antidote ]] \
    || git clone --depth=1 https://github.com/mattmc3/antidote.git $HOME/.antidote
  [[ -e $DOTFILES/zsh_plugins.txt ]] || touch $DOTFILES/zsh_plugins.txt
  (
    source $HOME/.antidote/antidote.zsh
    antidote bundle <$DOTFILES/zsh_plugins.txt >$HOME/.zsh_plugins.zsh
  )
fi

autoload -Uz $HOME/.antidote/functions/antidote

export ZSH="$(antidote home)/https-COLON--SLASH--SLASH-github.com-SLASH-ohmyzsh-SLASH-ohmyzsh"
# source static plugins file
source $HOME/.zsh_plugins.zsh
