vim.g.mapleader = ','

require('impatient').enable_profile()

require('options')

require('plugins')

-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
-- let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
-- set termguicolors " colorscheme working well on iTerm2 + tmux
-- set t_ZH=^[[3m
-- set t_ZR=^[[23m

require('config/ui')

-- highlight Normal ctermbg=NONE
-- highlight nonText ctermbg=NONE

require('config.code')
require('config.completion')
require('config.finder')
require('config.debug')
require('config.editing')
require('config.keys')

