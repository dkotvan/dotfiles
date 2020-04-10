let $MYVIMPATH=expand('<sfile>:p:h')
let $BUNDLES_FOLDER=$MYVIMPATH . '/bundles'
let $DEIN_FOLDER=$BUNDLES_FOLDER . '/repos/github.com/Shougo/dein.vim'

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'
let g:dein#enable_notification = 0

if has('vim_starting')
  set nocompatible
  set runtimepath+=$DEIN_FOLDER
endif

call dein#begin($BUNDLES_FOLDER)

call dein#load_toml($MYVIMPATH . '/dein.toml', {'lazy': 0})
call dein#load_toml($MYVIMPATH . '/dein_lazy.toml', {'lazy' : 1})

call dein#end()
call dein#save_state()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

call dein#call_hook('source')
call dein#call_hook('post_source')

" command to remove and purge packages
function! UninstallStuff()
	call map(dein#check_clean(), "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endfunction
command! UninstallStuff call UninstallStuff()
