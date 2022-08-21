require("vstask").setup({})
require('telescope').setup {
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
      find_command = { "fd", "--type=file", "--hidden", "--follow", "--exclude=.git" }
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
require("telescope").load_extension("yaml_schema")
require("telescope").load_extension("changes")
require('telescope').load_extension('scriptnames')
require('telescope').load_extension('goimpl')
require('telescope').load_extension('vstask')
require('telescope').load_extension('zoxide')
require('possession').setup {}
require('telescope').load_extension('possession')

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
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua require('legendary').find()<CR>", { noremap = true })

local commands = {
  { ':PackerSync', description = 'Packer Sync' },
  { ':GV', description = '(GV) Git log' },
  { ':GV!', description = '(GV) Git log buffer' },
  { ':G', description = 'Git status' },
  { ':Git blame', description = 'Git blame' },
  { ':Git! pull', description = 'Git pull' },
  { ':Git! push', description = 'Git push' },
  { ':Git! push -u origin HEAD', description = 'Git push new branch' },
  { ':Git! push --force', description = 'Git push --force' },
  { ':Git! push --force', description = 'Git push --force' },
  { ':Git rebase --interactive ', description = 'Git rebase iteractive', unfinished = true },
  { ':Git rebase --interactive main', description = 'Git rebase iteractive main' },
  { 'lua require("spectre").open()', description = 'Spectre Search Replace' },
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
  }
})

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
}, { prefix = "<Space>" }
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
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Telescope live grep", noremap = true },
    s = { "<cmd>lua require('telescope.builtin').git_stash()<cr>", "Telescope git stash", noremap = true },
    b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Telescope git branches", noremap = true },
    S = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Telescope git status", noremap = true },
    c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Telescope git commits", noremap = true },
    C = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Telescope git bcommits", noremap = true },
  },
  f = { '<cmd>NvimTreeToggle<cr>', 'Nvim Tree Toggle', noremap = true },
  F = { '<cmd>NvimTreeFindFile<cr>', 'Nvim Tree Focus File', noremap = true },
  d = {
    c = { '<cmd>Telescope dap commands', 'dap commands', noremap = true },
    o = { '<cmd>Telescope dap configurations<cr>', 'debug - dap configurations', noremap = true },
    l = { '<cmd>Telescope dap list_breakpoints<cr>', 'debug - dap list_breakpoints', noremap = true },
    v = { '<cmd>Telescope dap variables<cr>', 'debug - dap variables', noremap = true },
    f = { '<cmd>Telescope dap frames<cr>', 'debug - dap frames', noremap = true },
  },
  c = {
    a = { '<cmd>lua require("telescope").extensions.asynctasks.all()<cr>', 'Telescope AsyncTasks', noremap = true },
    b = { '<cmd>lua require("telescope.builtin").buffers()<cr>', 'Telescope buffers', noremap = true },
    i = { '<cmd>lua require("telescope").extensions.goimpl.goimpl{}<CR>', 'Telescope buffers', noremap = true },
    n = { '<Plug>(openbrowser-open)', 'Open a browser', noremap = true },
    c = { '<cmd>lua require("telescope.builtin").commands()<cr>', 'Telescope commands', noremap = true },
    C = { '<cmd>Telescope changes<cr>', 'Telescope Changes', noremap = true },
    s = { '<cmd>lua require("telescope").extensions.possession.list()<cr>', 'Telescope Possession', noremap = true },
    S = { '<cmd>Telescope scriptnames<cr>', 'Telescope Scriptnames', noremap = true },
    h = { '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Telescope help_tags', noremap = true },
    R = { '<cmd>Telescope repo list<cr>', 'Change repo', noremap = true },
    r = { '<cmd>Telescope repo cached_list<cr>', 'Change repo (cached_list)', noremap = true },
    y = { '<cmd>Telescope yaml_schema<cr>', 'Change yaml schema', noremap = true },
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
  s = {
    l = { "<cmd>Possession List", "PossessionList" },
    L = { "<cmd>Possession Load", "PossessionLoad" },
    s = { "<cmd>Possession Save", "PossessionSave" },
    S = { "<cmd>Possession Show", "PossessionShow" },
    c = { "<cmd>Possession Close", "PossessionClose" },
    m = { "<cmd>Possession Migrate", "PossessionMigrate" },
  },
  t = {
    b = { "<cmd>Telekasten browse_media<cr>", "Notes - Telekasten browse_media - Browse images / media files",
      noremap = true },
    f = {
      d = { "<cmd>Telekasten find_daily_notes<cr>",
        "Notes - Telekasten find_daily_notes - Find daily notes by title (date)", noremap = true },
      f = { "<cmd>Telekasten find_friends<cr>",
        "Notes - Telekasten find_friends - Show all notes linking to the link under the cursor", noremap = true },
      n = { "<cmd>Telekasten find_notes<cr>", "Notes - Telekasten find_notes - Find notes by title (filename)",
        noremap = true },
      w = { "<cmd>Telekasten find_weekly_notes<cr>",
        "Notes - Telekasten find_weekly_notes - Find weekly notes by title (calendar week)", noremap = true },
    },
    g = {
      l = { "<cmd>Telekasten follow_link<cr>", "Notes - Telekasten follow_link - Follow the link under the cursor",
        noremap = true },
      w = { "<cmd>Telekasten goto_thisweek<cr>", "Notes - Telekasten goto_thisweek - Open this week's weekly note",
        noremap = true },
      g = { "<cmd>Telekasten goto_today<cr>", "Notes - Telekasten goto_today - Open today's daily note", noremap = true },
    },
    i = {
      i = { "<cmd>Telekasten insert_img_link<cr>",
        "Notes - Telekasten insert_img_link - Browse images / media files and insert a link to the selected one",
        noremap = true },
      l = { "<cmd>Telekasten insert_link<cr>", "Notes - Telekasten insert_link - Insert a link to a note", noremap = true },
      p = { "<cmd>Telekasten paste_img_and_link<cr>",
        "Notes - Telekasten paste_img_and_link - Paste an image from the clipboard into a file and inserts a link to it",
        noremap = true },
    },
    n = {
      n = { "<cmd>Telekasten new_note<cr>", "Notes - Telekasten new_note - Create a new note, prompts for title",
        noremap = true },
      t = { "<cmd>Telekasten new_templated_note<cr>",
        "Notes - Telekasten new_templated_note - create a new note by template, prompts for title and template",
        noremap = true },
    },
    p = { "<cmd>Telekasten panel<cr>", "Notes - Telekasten panel - brings up the command palette", noremap = true },
    c = { "<cmd>Telekasten preview_img<cr>", "Notes - Telekasten preview_img - preview image under the cursor",
      noremap = true },
    r = { "<cmd>Telekasten rename_note<cr>",
      "Notes - Telekasten rename_note - Rename current note and update the links pointing to it", noremap = true },
    s = {
      n = { "<cmd>Telekasten search_notes<cr>", "Notes - Telekasten search_notes - Search (grep) in all notes",
        noremap = true },
      b = { "<cmd>Telekasten show_backlinks<cr>",
        "Notes - Telekasten show_backlinks - Show all notes linking to the current one", noremap = true },
      c = { "<cmd>Telekasten show_calendar<cr>", "Notes - Telekasten show_calendar - Show the calendar", noremap = true },
      t = { "<cmd>Telekasten show_tags<cr>", "Notes - Telekasten show_tags - Search through all tags", noremap = true },
    },
    t = { "<cmd>Telekasten toggle_todo<cr>", "Notes - Telekasten toggle_todo - Toggle - [ ] todo status of a line",
      noremap = true },
    y = { "<cmd>Telekasten yank_notelink<cr>",
      "Notes - Telekasten yank_notelink - Yank a link to the currently open note", noremap = true },
  },
  v = {
    a = { "<cmd>lua require('telescope').extensions.vstask.tasks()<CR>", "VsCode Tasks - Tasks" },
    i = { "<cmd>lua require('telescope').extensions.vstask.inputs()<CR>", "VsCode Tasks - Inputs" },
    t = { "<cmd>lua require('telescope').extensions.vstask.close()<CR>", "VsCode Tasks - close" },
  },
  b = {
    y = { "Neomux Yank Buffer" },
    p = { "Neomux Paste Buffer" },
  },
  u = { '<cmd>UndotreeToggle<cr>', 'Undo tree toggle', noremap = true },
}, { prefix = "<leader>" }
)

wk.register({
  t = { 'Neomux Split horizontal' },
  T = { 'Neomux Split vertical' },
  ["1"] = { "move cursor to window 1" },
  ["2"] = { "move cursor to window 2" },
  ["3"] = { "move cursor to window 3" },
  ["4"] = { "move cursor to window 4" },
  ["5"] = { "move cursor to window 5" },
  ["6"] = { "move cursor to window 6" },
  ["7"] = { "move cursor to window 7" },
  ["8"] = { "move cursor to window 8" },
  ["9"] = { "move cursor to window 9" },
}, { prefix = "<C-w>" }
)

vim.cmd [[
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
]]
