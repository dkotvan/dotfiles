vim.g.mapleader = ','

function isVsCode()
  return vim.env.FORCE_VSCODE == 'true' or vim.fn.exists("g:vscode") == 1
end

if isVsCode() then
  require('vscode/options')
  require('vscode/plugins')
  require('vscode/keys')
else
  require('options')

  vim.cmd [[
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors " colorscheme working well on iTerm2 + tmux
  set t_ZH=^[[3m
  set t_ZR=^[[23m
  ]]

  require('plugins-lazy')
  require('config/ui')

  vim.cmd [[
  highlight Normal ctermbg=NONE
  highlight nonText ctermbg=NONE
  ]]

  require('config.code')
  require('config.tasks')
  require('config.completion')
  require('config.finder')
  require('config.debug')
  require('config.editing')
  require('config.keys')
  require('config.zettelkasten')
end
