local mapkey = vim.api.nvim_set_keymap

mapkey('n', '<Leader>w', ':set list!<CR>', {noremap = true, silent = false})

-- Mapping navigation
mapkey('n', '[b', ':bprevious<CR>', {noremap = true, silent = true})
mapkey('n', ']b', ':bnext<CR>', {noremap = true, silent = true})
mapkey('n', '[t', ':tabprevious<CR>', {noremap = true, silent = true})
mapkey('n', ']t', ':tabnext<CR>', {noremap = true, silent = true})

-- make copying to clipboard easier
mapkey('n', '<CR>', '"+y', {noremap = true, silent = false})
mapkey('v', '<CR>', '"+y', {noremap = true, silent = false})

-- making the terminal bearable
mapkey('t', '<C-w><C-w>', '<C-\\><C-N><C-w><C-w>', {noremap = true, silent = false})
mapkey('t', '<C-w><C-Up>', '<C-\\><C-N><C-w><C-Up>', {noremap = true, silent = false})
mapkey('t', '<C-w><C-Down>', '<C-\\><C-N><C-w><C-Down>', {noremap = true, silent = false})
mapkey('t', '<C-w><C-Right>', '<C-\\><C-N><C-w><C-Right>', {noremap = true, silent = false})
mapkey('t', '<C-w><C-Left>', '<C-\\><C-N><C-w><C-Left>', {noremap = true, silent = false})
mapkey('t', '<C-P>', '<C-\\><C-N><Esc><C-P>', {noremap = true, silent = false})

-- Better CTRL-L
mapkey('n', '<leader>l', ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>', {noremap = true, silent = false})

--Stuff
mapkey('n', '<leader>f', '<cmd>:NvimTreeToggle<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>F', '<cmd>:NvimTreeFindFile<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>o', '<cmd>:SymbolsOutline<CR>', {noremap = true, silent = false})
