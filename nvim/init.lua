vim.g.mapleader = ','

function isVsCode()
  return vim.env.FORCE_VSCODE == 'true' or vim.fn.exists("g:vscode") == 1
end

local ok, err = pcall(require, 'impatient')

if ok then
  if isVsCode() then
    _G.__luacache_config = {
      chunks = {
        enable = true,
        path = vim.fn.stdpath('cache')..'/vscode_luacache_chunks',
      },
      modpaths = {
        enable = true,
        path = vim.fn.stdpath('cache')..'/vscode_luacache_modpaths',
      }
    }
  end
  require('impatient').enable_profile()
else
  print(('impatient not installed\n%s'):format(err))
end

if isVsCode() then
  require('vscode/options')
  require('vscode/plugins')
  require('vscode/keys')
else
  require('options')

  require('plugins')

  vim.cmd [[
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors " colorscheme working well on iTerm2 + tmux
  set t_ZH=^[[3m
  set t_ZR=^[[23m
  ]]

  require('config/ui')

  vim.cmd [[
  highlight Normal ctermbg=NONE
  highlight nonText ctermbg=NONE
  ]]

  require('config.code')
  require('config.completion')
  require('config.finder')
  require('config.debug')
  require('config.editing')
  require('config.keys')
end
