# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for macOS/Linux. The repository manages Zsh shell configuration, Neovim, tmux, kitty terminal, git, and Homebrew packages.

## Setup

Symlink everything to the right places using `install.sh`. Key symlinks:
- `zshrc` → `~/.zshrc`
- `nvim/` → `~/.config/nvim`
- `gitconfig` → `~/.gitconfig`
- `starship.toml` → `~/.config/starship.toml`
- `tmux.conf` → `~/.tmux.conf`

Update all tools at once: `update_everything` (zsh alias — updates antidote plugins, brew packages, and neovim plugins).

Update only neovim plugins: `update_nvim` (runs `nvim --headless "+Lazy! sync" +qa`).

## Architecture

### Zsh (`zshrc`, `antidote.zsh`, `alias.zsh`, `zsh_plugins.txt`)

- `zshrc` is the entry point; sources `antidote.zsh`, `alias.zsh`, `osx/init.zsh` (macOS only), and all `local/*.zsh` files
- `antidote.zsh` bootstraps [antidote](https://github.com/mattmc3/antidote) as the plugin manager; plugins are declared in `zsh_plugins.txt`
- `alias.zsh` contains git aliases, project navigation functions (`cdl`, `cdi`, `cdc`), and utility functions
- `local/*.zsh` — machine-local overrides that are NOT tracked in git (e.g., `local/setup.zsh` for work-specific env vars)

Project navigation: `cdl <name>` / `cdc <name>` / `cdi <name>` fuzzy-search `~/Projects/` via fd+fzf and cd/open in cursor/idea. Results are cached in `~/.cdl_results_cache`.

### Neovim (`nvim/`)

Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim). Entry point is `nvim/init.lua`, which:
- Sets leader key to `,`
- Loads `loader.lua` (bootstraps lazy.nvim, loads all `lua/plugins/*.lua` modules)
- Loads `options.lua`

Plugin files in `nvim/lua/plugins/`:
- `coding.lua` — LSP (mason + mason-lspconfig + navigator.lua), treesitter, nvim-cmp (completion), vsnip (snippets), go.nvim, neotest, claudecode.nvim
- `ui.lua` — colorscheme (gruvbox-material), lualine, bufferline, indent-blankline, dressing.nvim
- `finder.lua` — telescope.nvim (with smart-open, fzf, undo extensions), nvim-tree
- `keys.lua` — which-key.nvim with all keybindings
- `debug.lua`, `editing.lua`, `search.lua`, `scc.lua`, `utils.lua` — additional plugins

**Leader key**: `,` | **Space prefix**: LSP actions | **`<leader>a*`**: Claude Code | **`<leader>d*`**: DAP debugger | **`<leader>t*`**: neotest | **`<C-P>`**: smart file open | **`<leader><leader>`**: Legendary command palette

Claude Code in Neovim:
- `nvimc` alias opens nvim with ClaudeCode; `nvimcr` resumes
- `<leader>ac` toggle, `<leader>ar` resume, `<leader>aa/ad` accept/deny diff

Navigator.lua has a workaround in `coding.lua` to skip Claude Code diff buffers (they crash `on_filetype`).

### Homebrew (`Brewfile`)

Declares all CLI tools and macOS apps. Run `brew bundle` from the dotfiles directory to install/update.

### Other configs

- `gitconfig` — git settings with delta as pager
- `tmux.conf` — tmux with TPM plugin manager
- `kitty.conf` + `kitty-theme.conf` — Kitty terminal
- `starship.toml` — shell prompt
- `nvim/sqlfluff.toml` — SQLFluff config used by null-ls
