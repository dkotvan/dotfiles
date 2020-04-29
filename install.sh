# Symlink everything
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/gitconfig ~/.gitconfig
ln -s ~/dotfiles/gitignore ~/.gitignore
ln -s ~/dotfiles/agignore ~/.agignore
ln -s ~/dotfiles/fdignore ~/.fdignore
mkdir -p ~/.config
ln -s ~/dotfiles/nvim/ ~/.config/nvim
ln -s ~/dotfiles/ideavimrc ~/.ideavimrc

# Install Homerew and all the hoebrew dependencies
sudo apt install -y --quiet gcc
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" </dev/null
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew bundle

# Install nodejs
nodenv install 13.7.0
nodenv global 13.7.0

# Fonts to allow
sudo apt install -y --quiet fonts-powerline fonts-hack

# Install Shouo Dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
sh /tmp/installer.sh ~/dotfiles/nvim/bundles
nvim +q

# Install nvim requirements 
yarn global add neovim
pip install neovim
pip3 install neovim

# Change default shell
sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

# Instal Tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
