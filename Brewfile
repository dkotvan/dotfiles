tap "homebrew/core"
tap "homebrew/bundle"
tap "AdoptOpenJDK/openjdk"
tap "golangci/tap"
tap "remotemobprogramming/brew"

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
brew "go"
brew "golangci/tap/golangci-lint"
brew "lua"
brew "luarocks"

# Git related
brew "git"
brew "gnupg"
brew "hub"
brew "lab"
brew "tig"
brew "mob"

# Docker & Kubernetes Related
brew "docker-compose" unless OS.mac?
brew "helm", branch: "add-include-file"
unless OS.mac?\
  brew "kubernetes-cli"
end
brew "kubectx"
brew "int128/kubelogin/kubelogin"
brew "stern"

# Utilities
brew "bat"
brew "bzip2"
brew "curl"
brew "csvkit"
brew "exa"
brew "fd"
brew "fzf"
brew "htop"
brew "jq"
brew "kcat"
brew "magic-wormhole"
brew "mdcat"
brew "the_silver_searcher"
brew "unzip"
brew "yamllint"
brew "zip"

# apps
brew "neovim"
brew "pgcli"
brew "litecli"
brew "tmux"

# Better ctags
tap "universal-ctags/universal-ctags"
brew "universal-ctags/universal-ctags/universal-ctags", args: ["HEAD"]

# Shell and Completions
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

  cask "temurin8"
  cask "adoptopenjdk11"
  cask "adoptopenjdk"
  cask "dbeaver-community"
  cask "discord"
  cask "docker"
  cask "firefox"
  cask "gifcapture"
  cask "intellij-idea-ce"
  cask "iterm2"
  cask "lastpass"
  cask "postman"
  cask "rectangle"
  cask "tomighty"
  cask "visual-studio-code"
  cask "visualvm"
  cask "yed"
  cask "zoom"

  # Good font for terminal and programming
  cask "font-saucecodepro-nerd-font"
  cask "font-fira-code-nerd-font"
end
