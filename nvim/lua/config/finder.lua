vim.cmd [[
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>c <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>bt <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>r :Telescope repo list<cr>
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
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type=file", "--hidden", "--follow", "--exclude=.git"}
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    repo = {
      list = {
        fd_opts = {
          "--no-ignore",
        },
        search_dirs = {
          "~/Projects/",
          "~/Opensource/",
        }
      }
    }
  },
}
require('telescope').load_extension("fzf")
require('telescope').load_extension("repo")

local commands = {
  { ':Git pull', description = 'Git pull' },
  { ':Git push', description = 'Git push' },
  { ':Git push --force', description = 'Git push --force' },
  { ':Git rebase --interactive ', description = 'Git rebase iteractive', unfinished = true },
  { ':Git rebase --interactive main', description = 'Git rebase iteractive main' },
  { ':Telescope repo list', description = 'Change repo' },
  { ':NvimTreeToggle', description = 'Open file tree' },
  { ':NvimTreeFindFile', description = 'Open file tree with current file focused' },
  { ':SymbolsOutline', description = 'List Symbols' },
  { 'lua require("spectre").open()', description = 'Spectre Search Replace'},
  { 'lua require("telescope.builtin").commands()', description = 'Telescope commands' },
  { 'lua require("telescope.builtin").live_grep()', description = 'Telescope live_grep' },
  { 'lua require("telescope.builtin").buffers()', description = 'Telescope buffers' },
  { 'lua require("telescope.builtin").help_tags()', description = 'Telescope help_tags' },
}
require('legendary').bind_commands(commands)
