# Mise migration

This repo now uses Homebrew to install `mise` and uses it for language runtimes
like Node.js, Go, and Ruby.

## One-time migration

1) Install mise with Homebrew:

```sh
brew install mise
```

2) Remove asdf and other version managers (only if installed):

```sh
brew uninstall --force asdf pyenv goenv rbenv nodenv jenv
rm -rf ~/.asdf ~/.tool-versions ~/.asdfrc
```

3) Clean Homebrew packages not in `Brewfile`:

```sh
cd ~/dotfiles
brew bundle --cleanup
```

## Install global runtimes with mise

```sh
mise use -g node@latest
mise use -g go@latest
mise use -g ruby@latest
```

Notes:
- `node` installs npm automatically and includes corepack for yarn.
- If you want Java from mise instead of Homebrew, run `mise use -g java@latest`
  and remove any Homebrew JDK casks from `Brewfile`.

## IDE integration

### IntelliJ IDEA

Option A: launch from a terminal so it inherits your shell PATH:

```sh
idea
```

Option B: point toolchains/SDKs at mise-managed binaries:

```sh
mise which node
mise which go
mise which ruby
```

Use the resolved paths in IntelliJ's SDK/Toolchain settings.

### Cursor

Option A: launch from a terminal so it inherits your shell PATH:

```sh
cursor
```

Option B: configure tools using mise paths:

```sh
mise which node
mise which go
mise which ruby
```

## Shell setup

`zshrc` activates mise with:

```sh
eval "$(mise activate zsh)"
```

If the oh-my-zsh `mise` plugin is not available in your installed version,
remove it from `zsh_plugins.txt`.
