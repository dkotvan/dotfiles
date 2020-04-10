call denite#custom#option('default', {
      \ 'prompt': '>',
      \ 'reversed': v:true,
      \ 'auto_resize': v:true,
      \ 'start_filter': v:true,
      \ 'direction': 'belowright',
      \ 'highlight_matched_char': 'Underlined'
      \ })
call denite#custom#source('_', 'matchers', ['matcher/fruzzy'])
call denite#custom#source('_', 'max_candidates', 50000)
call denite#custom#source('file/rec', 'sorters', ['sorter_rank'])

"  fd is slightly faster too
call denite#custom#var('file/rec', 'command', ['fd', '--hidden', '--follow', '--color', 'never', '-t', 'f', ''])
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--hidden'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Denite mappings
function! s:denite_settings() abort
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <C-w>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-w>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <C-x>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> <C-x>
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> x
  \ denite#do_map('do_action', 'split')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-p>
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> <C-p>
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <C-a>
  \ denite#do_map('toggle_select_all')
  inoremap <silent><buffer><expr> <C-a>
  \ denite#do_map('toggle_select_all')

endfunction

autocmd FileType denite
\ call s:denite_settings()
