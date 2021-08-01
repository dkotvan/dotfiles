vim.cmd [[
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>c <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bt <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
]]

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'ag',
      '-i',
      '--vimgrep',
      '--hidden',
      '--line-number',
      '--column'
    }
  }
}
