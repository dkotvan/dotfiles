let $MYVIMPATH=expand("<sfile>:p:h")

if &compatible
	set nocompatible
endif

let mapleader=',' " comma as leader key

lua require('options')

lua require('plugins')

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " colorscheme working well on iTerm2 + tmux
set t_ZH=^[[3m
set t_ZR=^[[23m

lua require('config/ui')

highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

lua require('config.code')
lua require('config.completion')
lua require('config.finder')
lua require('config.debug')
lua require('config.editing')

source $MYVIMPATH/keys.vim
