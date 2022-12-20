tap 'homebrew/core'
tap 'homebrew/bundle'
tap 'golangci/tap'
tap 'remotemobprogramming/brew'

# Prerequisites
brew 'gcc'
brew 'make'

# Languages
brew 'python'
brew 'node-build'
brew 'nodenv'
brew 'pyenv'
brew 'yarn'
brew 'rust'
brew 'rbenv'
brew 'rbenv-binstubs'
brew 'rbenv-bundler'
brew 'go'
brew 'golangci/tap/golangci-lint'
brew 'lua'
brew 'luarocks'
unless OS.mac?
  brew 'openjdk@11'
  brew 'openjdk@17'
end

# Git related
brew 'git'
brew 'gnupg'
brew 'hub'
brew 'glab'
brew 'lab'
brew 'tig'
brew 'mob'
brew 'gitter-cli'
brew 'pre-commit'

# Docker & Kubernetes Related
brew 'colima' if OS.mac?
brew 'docker'
brew 'docker-compose'
brew 'helm', branch: 'add-include-file'
brew 'kubernetes-cli'
brew 'krew'
brew 'kubectx'
brew 'k9s'
tap 'int128/kubelogin'
brew 'int128/kubelogin/kubelogin'
brew 'stern'
brew 'lazydocker'
brew 'ctop'

# IaC
brew 'shellcheck'
brew 'terragrunt'
brew 'terraform-docs'
brew 'terraform'

# Utilities
brew 'bat'
brew 'bzip2'
brew 'curl'
brew 'csvkit'
brew 'exa'
brew 'fd'
brew 'findutils' if OS.mac?
brew 'fzf'
brew 'glow'
brew 'htop'
brew 'jq'
brew 'kcat'
brew 'magic-wormhole'
brew 'mdcat'
brew 'the_silver_searcher'
brew 'unzip'
brew 'yamllint'
brew 'zip'
brew 'parquet-cli'
brew 'yq'
brew 'zoxide'
brew 'cookiecutter'

# apps
brew 'ghostscript'
brew 'imagemagick'
brew 'neovim'
brew 'octosql'
brew 'pgcli'
brew 'litecli'
brew 'tmux'
brew 'vault'

# Better ctags
tap 'universal-ctags/universal-ctags'
brew 'universal-ctags/universal-ctags/universal-ctags', args: ['HEAD']

# Shell and Completions
brew 'zsh'
brew 'zsh-completions'
brew 'starship'
brew 'brew-cask-completion'
brew 'pip-completion'
brew 'rake-completion'
brew 'bundler-completion'

if OS.mac?
  tap 'homebrew/cask-fonts'

  brew 'gnu-sed'
  brew 'pinentry-mac'

  cask 'authy'

  tap 'homebrew/cask-versions'
  cask 'temurin8'
  cask 'temurin11'
  cask 'temurin17'
  cask 'dbeaver-community'
  cask 'discord'
  cask 'drawio'
  cask 'firefox'
  cask 'gifcapture'
  cask 'google-chrome'
  cask 'intellij-idea-ce'
  cask 'iterm2'
  cask 'lastpass'
  cask 'postman'
  cask 'rectangle'
  cask 'skype'
  cask 'tomighty'
  cask 'visual-studio-code'
  cask 'visualvm'
  cask 'yed'
  cask 'zoom'

  # Good font for terminal and programming
  cask 'font-fira-code-nerd-font'
  cask 'font-victor-mono-nerd-font'
end
