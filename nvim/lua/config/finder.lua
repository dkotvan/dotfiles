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
require('telescope').load_extension('dap')

require("dressing").setup {
  input = { 
    relative = "editor",
  },
  select = {
    backend = { "telescope", "fzf", "builtin" },
    telescope = {
      prefer_width = { 0.9 }, 
      width = { 0.9 }
    },
    fzf = {
      prefer_width = { 0.9 }, 
      width = { 0.9 }
    },
    builtin = {
      prefer_width = { 0.9 }, 
      width = { 0.9 }
    },
  },
}

require("legendary").setup {
  include_builtin = true, auto_register_which_key = true,
  include_legendary_cmds = true,
}
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua require('legendary').find()<CR>", { noremap=true })

local commands = {
  { ':PackerSync', description = 'Packer Sync' },
  { ':GV', description = '(GV) Git log' },
  { ':GV!', description = '(GV) Git log buffer' },
  { ':G', description = 'Git status' },
  { ':Git blame', description = 'Git blame' },
  { ':Git pull', description = 'Git pull' },
  { ':Git push', description = 'Git push' },
  { ':Git push --force', description = 'Git push --force' },
  { ':Git rebase --interactive ', description = 'Git rebase iteractive', unfinished = true },
  { ':Git rebase --interactive main', description = 'Git rebase iteractive main' },
  { 'lua require("spectre").open()', description = 'Spectre Search Replace'},
  { ':GoInstallBinaries', description = 'GoInstallBinaries' },
  { ':GoUpdateBinaries', description = 'GoUpdateBinaries' },
  { ':GoInstallBinary', description = 'GoInstallBinary', unfinished = true },
  { ':GoUpdateBinary', description = 'GoUpdateBinary', unfinished = true },
  { ':GoCoverage', description = 'GoCoverage', unfinished = true },
  { ':GoImport', description = 'GoImport', unfinished = true },
  { ':GoBuild', description = 'GoBuild', unfinished = true },
  { ':GoRun', description = 'GoRun' },
  { ':GoRun', description = 'GoRun with args', unfinished = true },
  { ':GoStop', description = 'GoStop', unfinished = true },
  { ':GoTest', description = 'GoTest', unfinished = true },
  { ':GoTestFile', description = 'GoTestFile' },
  { ':GoTestFunc', description = 'GoTestFunc' },
  { ':GoAddTest', description = 'GoAddTest' },
  { ':GoFmt', description = 'GoFmt' },
  { ':GoVet', description = 'GoVet' },
  { ':GoCheat', description = 'GoCheat', unfinished = true },
  { ':GoGet', description = 'GoGet', unfinished = true },
  { ':GoDebug', description = 'GoDebug' },
  { ':GoDbgConfig', description = 'GoDbgConfig' },
  { ':GoDbgKeys', description = 'GoDbgKeys' },
  { ':GoDbgStop', description = 'GoDbgStop' },
  { ':GoDbgContinue', description = 'GoDbgContinue' },
  { ':GoCreateLaunch', description = 'GoCreateLaunch' },
  { ':GoBreakToggle', description = 'GoBreakToggle' },
  { ':GoBreakSave', description = 'GoBreakSave' },
  { ':GoBreakLoad', description = 'GoBreakLoad' },
  { ':GoEnv', description = 'GoEnv', unfinished = true },
  { ':GoAlt', description = 'GoAlt' },
  { ':GoDoc', description = 'GoDoc', unfinished = true },
  { ':GoMockGen', description = 'GoMockGen' },
  { ':GoPkgOutline', description = 'GoPkgOutline' },
  { ':GoImpl', description = 'GoImpl', unfinished = true },
  { ':GoToggleInlay', description = 'GoToggleInlay' },
  { ':GoTermClose', description = 'GoTermClose' },
  { ':OpenBrowserSearch', description = 'Search in web browser', unfinished = true },
  { ':MakeTable', description = 'CSV to markdown table' },
  { ':UnmakeTable', description = 'Markdow tablen to CSV' },
  { ':ASToggle', description = 'ASToggle: toggles AutoSave.nvim on and off.' },
  { ':MarkdownPreview', description = 'Start the markdown preview' },
  { ':MarkdownPreviewStop', description = 'Stop the markdown preview' },
}


require('legendary').bind_commands(commands)

require("which-key").setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  }})

  local wk = require("which-key")

  wk.register({
    f = {
      name = "lsp format",
      f = { 'LSP Navigator format' },
    },
    r = {
      name = "lsp rename",
      n = { 'LSP Navigator format' },
    },
  }, {prefix = "<Space>"}
  )
  wk.register({
    g = {
      ["0"] = { "LSP Navigator list document symbols" },
      r = { 'LSP Navigator reference' },
      k = { 'LSP Navigator signature_help' },
      W = { 'LSP Navigator workspace_symbol_live' },
      d = { 'LSP Navigator definition' },
      D = { 'LSP Navigator declaration' },
      p = { 'LSP Navigator definition_preview' },
      K = { 'LSP Navigator hover' },
      i = { 'LSP Navigator implementation' },
      L = { 'LSP Navigator diagnostics' },
      G = { 'LSP Navigator buffer diagnostics' },
    },
  }, {}
  )
  wk.register({
    g = {
      name = "grep",
      g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Telescope live grep", noremap = true },
    },
    [","] = { "Toggle terminal" },
    ["1"] = { "Go to terminal 1" },
    ["2"] = { "Go to terminal 2" },
    ["3"] = { "Go to terminal 3" },
    ["4"] = { "Go to terminal 4" },
    ["5"] = { "Go to terminal 5" },
    f = { '<cmd>NvimTreeToggle<cr>', 'Nvim Tree Toggle', noremap = true},
    F = { '<cmd>NvimTreeFindFile<cr>', 'Nvim Tree Focus File', noremap = true},
    b = {
      b = { '<cmd>lua require("telescope.builtin").buffers()<cr>', 'Telescope buffers', noremap = true },
      n = { '<Plug>(openbrowser-open)', 'Open a browser', noremap = true },
    },
    d = {
      c = { '<cmd>Telescope dap commands', 'dap commands', noremap = true },
      o = { '<cmd>Telescope dap configurations<cr>', 'debug - dap configurations', noremap = true },
      l = { '<cmd>Telescope dap list_breakpoints<cr>', 'debug - dap list_breakpoints', noremap = true },
      v = { '<cmd>Telescope dap variables<cr>', 'debug - dap variables', noremap = true },
      f = { '<cmd>Telescope dap frames<cr>', 'debug - dap frames', noremap = true },
    },
    c = {
      c = { '<cmd>lua require("telescope.builtin").commands()<cr>', 'Telescope commands', noremap = true },
      h = { '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Telescope help_tags', noremap = true },
      r = { '<cmd>Telescope repo list<cr>', 'Change repo', noremap = true },
    },
    r = {
      b = { '<cmd>:BuildImage<cr>', 'DevContainer Build Image', noremap = true },
      a = { '<cmd>:AttachToContainer<cr>', 'DevContainer Attach to container', noremap = true },
      s = { '<cmd>:StartImage<cr>', 'DevContainer Start image', noremap = true },
      u = { '<cmd>:ComposeUp<cr>', 'DevContainer Docker compose up', noremap = true },
      d = { '<cmd>:ComposeDown<cr>', 'DevContainer Docker compose Down', noremap = true },
      e = { '<cmd>:ComposeDestroy<cr>', 'DevContainer Docker compose Destroy', noremap = true },
    },
    R = {
      R = { '<Plug>RestNvim', 'run the request under the cursor', noremap = true },
      C = { '<Plug>RestNvimPreview', 'preview the request cURL command', noremap = true },
      L = { '<Plug>RestNvimLast', 're-run the last request', noremap = true },
    },
    u = { '<cmd>UndotreeToggle<cr>', 'Undo tree toggle', noremap = true },
  }, {prefix = "<leader>"}
  )

vim.cmd [[
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
]]

