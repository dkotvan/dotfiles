vim.g.mapleader = ','

local ok, err = pcall(require, 'impatient')

if ok then
  require('impatient').enable_profile()
else
  print(('impatient not installed\n%s'):format(err))
end

require('options')

require('plugins')

if not vim.g.vscode then  
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

