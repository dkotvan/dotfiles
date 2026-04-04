# Symlink everything
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/agignore ~/.fdignore
mkdir -p ~/.config
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/mise
ln -s ~/dotfiles/mise-config.toml ~/.config/mise/config.toml
ln -s ~/dotfiles/nvim/ ~/.config/nvim
ln -s ~/dotfiles/ideavimrc ~/.ideavimrc
mkdir -p ~/.config/ghostty
ln -s ~/dotfiles/ghostty.conf ~/.config/ghostty/config

# Install Homebrew and dependencies
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Instal Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
