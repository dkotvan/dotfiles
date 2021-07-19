nnoremap <Leader>w :set list!<CR>

" Mapping navigation
nmap <silent> [b :bprevious<CR>
nmap <silent> ]b :bnext<CR>
nmap <silent> [t :tabprevious<CR>
nmap <silent> ]t :tabnext<CR>

" make copying to clipboard easier
nnoremap <CR> "+y
vnoremap <CR> "+y

" making the terminal bearable
tnoremap <C-w><C-w> <C-\><C-N><C-w><C-w>
tnoremap <C-w><C-Up> <C-\><C-N><C-w><C-Up>
tnoremap <C-w><C-Down> <C-\><C-N><C-w><C-Down>
tnoremap <C-w><C-Right> <C-\><C-N><C-w><C-Right>
tnoremap <C-w><C-Left> <C-\><C-N><C-w><C-Left>
tnoremap <C-P> <C-\><C-N><Esc><C-P>
tnoremap <C-_> <C-\><C-N><C-_>

" Better CTRL-L
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" LSP

nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>

" Stuff

nnoremap <leader>f <cmd>:NvimTreeToggle<CR>:wq
