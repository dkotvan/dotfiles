" I like to keep all my windows resized when Iḿ running tests on big screem
autocmd VimResized * :wincmd =
" let &winwidth = &columns * 7 / 10
" autocmd WinEnter * execute winnr() * 2 . 'wincmd |'
"
" Delete trailing white space on save - copied from https://github.com/gavruk/vim-config/blob/master/.vimrc.autocmd<Paste>
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

func! ReloadGStatus()
  if &ft =~ 'git\|fugitive'
    return
  endif
  call fugitive#ReloadStatus()
endfunc

autocmd BufWrite *.rb :call DeleteTrailingWS()
autocmd BufWrite *.rake :call DeleteTrailingWS()
autocmd BufWritePost * :call ReloadGStatus()
