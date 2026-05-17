tap 'homebrew/bundle'
tap 'remotemobprogramming/brew'
tap 'hashicorp/tap'

# Prerequisites
brew 'gcc'
brew 'make'

# Languages
brew 'mise'

# Git related
brew 'git'
brew 'git-lfs'
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
brew 'wget'
brew 'awscli'

# apps - new stuff
brew "conikeec/tap/mcp-probe"
brew "bookofrat"
brew "mpryor/tap/nless"
brew "kiki-ki/tap/qo"
brew "xan"

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
brew "bash"
brew 'zsh'
brew 'zsh-completions'
brew 'starship'
brew 'brew-cask-completion'
brew 'pip-completion'
brew 'rake-completion'
brew 'bundler-completion'

if OS.mac?
  brew 'gnu-sed'
  brew 'pinentry-mac'

  cask 'clocker'
  cask 'gifcapture'
  cask 'google-chrome'
  cask 'iterm2'
  cask 'obsidian'
  cask 'postman'
  cask 'rectangle'
  cask 'slack'
  cask 'tomighty'
  cask 'visualvm'
  cask 'yed'
  cask 'zoom'

  cask 'claude-code'

  # iOS Development
  cask 'swiftformat-for-xcode'

  # Good font for terminal and programming
  cask 'font-fira-code'
  cask 'font-victor-mono'
  cask 'font-fira-code-nerd-font'
  cask 'font-victor-mono-nerd-font'
  cask "font-symbols-only-nerd-font"
end
