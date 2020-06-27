tap "homebrew/core"
tap "homebrew/bundle"

# Prerequisites
brew "gcc"
brew "make"

# Languages
brew "python"
brew "pyenv"
brew "pyenv-virtualenv"
brew "node-build"
brew "nodenv"
brew "yarn"
brew "rust"
brew "openjdk@11"

# Utilities
brew "bat"
brew "bzip2"
brew "curl"
brew "docker-compose" unless OS.mac?
brew "exa"
brew "fd"
brew "fzf"
brew "fasd"
brew "git"
brew "gnupg"
brew "hub"
brew "htop"
brew "jq"
brew "kafkacat"
brew "kubernetes-cli"
brew "magic-wormhole"
brew "the_silver_searcher"
brew "unzip"
brew "yamllint"
brew "zip"

# apps
brew "neovim"
brew "pgcli"
brew "tmux"
brew "kubectl"

# Better ctags
tap "universal-ctags/universal-ctags"
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD", "without-xml"]

# Shell
brew "zsh"
brew "zsh-completions"
brew "brew-cask-completion"
brew "pip-completion"
brew "rake-completion"
brew "bundler-completion"

# Antibody to install ZSH plugins fast
tap "getantibody/tap"
brew "getantibody/tap/antibody"

if OS.mac?
  tap "homebrew/cask-fonts"

  brew "pinentry-mac"

  cask "adoptopenjdk8"
  cask "ccmenu"
  cask "chef-workstation"
  cask "dbeaver-community"
  cask "discord"
  cask "docker"
  cask "firefox"
  cask "gifcapture"
  cask "intellij-idea-ce"
  cask "iterm2"
  cask "lastpass"
  cask "postman"
  cask "simplenote"
  cask "skype"
  cask "slack"
  cask "sourcetree"
  cask "tomighty"
  cask "yed"
  cask "zoomus"

  # Good font for terminal and programming
  cask "font-saucecodepro-nerd-font"
end
