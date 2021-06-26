" Deoplete and stuff
let g:deoplete#sources#syntax#min_keyword_length = 2
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\ 'auto_complete_delay': 100,
\ 'camel_case': v:true,
\ 'smart_case': v:true,
\ 'nofile_complete_filetypes': [],
\ })

  call deoplete#custom#source('ruby', 'rank', 50)
  call deoplete#custom#source('auto-programming', 'rank', 1)
  call deoplete#custom#source('spell', 'filetypes', ['gitcommit', 'markdown'])

  " change conflicting marks of around source
  call deoplete#custom#var('around', {
  \   'mark_above': '[↑]',
\   'mark_below': '[↓]',
\   'mark_changes': '[*]',
\})

set completeopt=longest,menuone,preview

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

