let $MYVIMPATH=expand("<sfile>:p:h")

if &compatible
	set nocompatible
endif

let mapleader=","                                " comma as leader key

source $MYVIMPATH/general.vim
source $MYVIMPATH/addons.vim
source $MYVIMPATH/keys.vim
source $MYVIMPATH/custom.vim

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " colorscheme working well on iTerm2 + tmux
set t_ZH=^[[3m
set t_ZR=^[[23m
if $ITERM_PROFILE ==? "night"
	set background=dark
else 
	set background=light
endif
let g:gruvbox_italic=1
colorscheme gruvbox
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
