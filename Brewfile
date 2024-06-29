tap 'homebrew/bundle'
tap 'remotemobprogramming/brew'
tap 'hashicorp/tap'

# Prerequisites
brew 'gcc'
brew 'make'

# Languages
brew 'asdf'
brew 'python'
brew 'node-build'
brew 'nodenv'
brew 'virtualenv'
brew 'yarn'
brew 'rust'
brew 'rbenv'
brew 'rbenv-binstubs'
brew 'rbenv-bundler'
brew 'go'
brew 'lua'
brew 'luarocks'
unless OS.mac?
  brew 'openjdk@11'
  brew 'openjdk@17'
end

# Git related
brew 'git'
brew 'gnupg'
brew 'gh'
brew 'glab'
brew 'git-delta'
brew 'lab'
brew 'tig'
brew 'mob'
brew 'pre-commit'
brew 'lazygit'

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
brew 'hashicorp/tap/vault'
brew 'terraform-docs'
brew 'hashicorp/tap/terraform'
brew 'terracognita'

# Utilities
brew 'bat'
brew 'bzip2'
brew 'curl'
brew 'csvkit'
brew 'fd'
brew 'findutils' if OS.mac?
brew 'atuin'
brew 'fzf'
brew 'htop'
brew 'jq'
brew 'kcat'
brew 'magic-wormhole'
brew 'ripgrep'
brew 'the_silver_searcher'
brew 'unzip'
brew 'yamllint'
brew 'zip'
brew 'watch'
brew 'yq'
brew 'zoxide'
brew 'cookiecutter'
brew 'hurl'
brew 'lsd'

# apps
brew 'ghostscript'
brew 'imagemagick'
brew 'neovim'
brew 'octosql'
brew 'pgcli'
brew 'litecli'
brew 'tmux'
brew 'vault'

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

  cask 'zulu@8'
  cask 'zulu@17'
  cask 'temurin@11'
  cask 'temurin@17'
  cask 'temurin@21'
  cask 'dbeaver-community'
  cask 'discord'
  cask 'drawio'
  cask 'firefox'
  cask 'gifcapture'
  cask 'google-chrome'
  cask 'kitty'
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
  cask 'font-fira-code'
  cask 'font-victor-mono'
  cask 'font-fira-code-nerd-font'
  cask 'font-victor-mono-nerd-font'
  cask "font-symbols-only-nerd-font"
end
