let $MYVIMPATH=expand("<sfile>:p:h")

if &compatible
	set nocompatible
endif

let mapleader=',' " comma as leader key

source $MYVIMPATH/general.vim
hi Normal ctermbg=NONE guibg=#00000
lua require('plugins')
lua require('ui')
lua require('lsp')
lua require('completion')
lua require('finder')
