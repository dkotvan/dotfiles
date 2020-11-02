tap "homebrew/core"
tap "homebrew/bundle"
tap "AdoptOpenJDK/openjdk"

# Prerequisites
brew "gcc"
brew "make"

# Languages
brew "python"
brew "node-build"
brew "nodenv"
brew "yarn"
brew "rust"
brew "rbenv"
brew "rbenv-binstubs"
brew "rbenv-bundler"

# Utilities
brew "bat"
brew "bzip2"
brew "curl"
brew "docker-compose" unless OS.mac?
brew "exa"
brew "fd"
brew "fzf"
brew "git"
brew "gnupg"
brew "helm"
brew "hub"
brew "htop"
brew "jq"
brew "kafkacat"
unless OS.mac?
  brew "kubernetes-cli"
end
brew "kubectx"
brew "zaquestion/tap/lab"
brew "magic-wormhole"
brew "mdcat"
brew "the_silver_searcher"
brew "unzip"
brew "yamllint"
brew "zip"

# apps
brew "neovim"
brew "pgcli"
brew "tmux"

# Better ctags
tap "universal-ctags/universal-ctags"
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD", "without-xml"]

# Shell
brew "zsh"
brew "zsh-completions"
brew "starship"
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
  cask "adoptopenjdk13"
  cask "android-file-transfer"
  cask "ccmenu"
  cask "chef-workstation"
  cask "dbeaver-community"
  cask "discord"
  cask "docker"
  cask "firefox"
  cask "google-chrome"
  cask "gifcapture"
  cask "intellij-idea-ce"
  cask "iterm2"
  cask "kitty"
  cask "lastpass"
  cask "postman"
  cask "simplenote"
  cask "skype"
  cask "slack"
  cask "seashore"
  cask "sourcetree"
  cask "tomighty"
  cask "yed"
  cask "zoomus"

  # Good font for terminal and programming
  cask "font-saucecodepro-nerd-font"
  cask "font-fira-code-nerd-font"
end
