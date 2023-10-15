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
    },
    undo = {
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = true,
      -- layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      time_format = "",
      mappings = {
        i = {
          -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
          -- you want to replicate these defaults and use the following actions. This means
          -- installing as a dependency of telescope in it's `requirements` and loading this
          -- extension from there instead of having the separate plugin definition as outlined
          -- above.
              ["<cr>"] = require("telescope-undo.actions").yank_additions,
              ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
              ["<C-cr>"] = require("telescope-undo.actions").restore,
        },
      },
    },
  },
}
require('telescope').load_extension("fzf")
require('telescope').load_extension("repo")
require('telescope').load_extension('dap')
require("telescope").load_extension("yaml_schema")
require("telescope").load_extension("changes")
require('telescope').load_extension('scriptnames')
require('telescope').load_extension('goimpl')
require('telescope').load_extension('advanced_git_search')
require('telescope').load_extension('media_files')
require("telescope").load_extension("undo")

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
  include_builtin = true,
  extensions = {
    lazy_nvim = true,
    which_key = {
      auto_register = true,
    },
    nvim_tree = true,
    diffview = true,
  },
  include_legendary_cmds = true,
}

vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>lua require('legendary').find()<CR>", { noremap = true })

local commands = {
  { ':GV',                            description = '(GV) Git log' },
  { ':GV!',                           description = '(GV) Git log buffer' },
  { ':G',                             description = 'Git status' },
  { ':Git blame',                     description = 'Git blame' },
  { ':Git! pull',                     description = 'Git pull' },
  { ':Git! pull --rebase',            description = 'Git pull with rebase' },
  { ':Git! push',                     description = 'Git push' },
  { ':Git! push -u origin HEAD',      description = 'Git push new branch' },
  { ':Git! push --force',             description = 'Git push --force' },
  { ':Git rebase --interactive ',     description = 'Git rebase iteractive',                      unfinished = true },
  { ':Git rebase --interactive main', description = 'Git rebase iteractive main' },
  { 'lua require("spectre").open()',  description = 'Spectre Search Replace' },
  { ':GoInstallBinaries',             description = 'GoInstallBinaries' },
  { ':GoUpdateBinaries',              description = 'GoUpdateBinaries' },
  { ':GoInstallBinary',               description = 'GoInstallBinary',                            unfinished = true },
  { ':GoUpdateBinary',                description = 'GoUpdateBinary',                             unfinished = true },
  { ':GoCoverage',                    description = 'GoCoverage',                                 unfinished = true },
  { ':GoImport',                      description = 'GoImport',                                   unfinished = true },
  { ':GoBuild',                       description = 'GoBuild',                                    unfinished = true },
  { ':GoRun',                         description = 'GoRun' },
  { ':GoRun',                         description = 'GoRun with args',                            unfinished = true },
  { ':GoStop',                        description = 'GoStop',                                     unfinished = true },
  { ':GoTest',                        description = 'GoTest',                                     unfinished = true },
  { ':GoTestFile',                    description = 'GoTestFile' },
  { ':GoTestFunc',                    description = 'GoTestFunc' },
  { ':GoAddTest',                     description = 'GoAddTest' },
  { ':GoFmt',                         description = 'GoFmt' },
  { ':GoVet',                         description = 'GoVet' },
  { ':GoCheat',                       description = 'GoCheat',                                    unfinished = true },
  { ':GoGet',                         description = 'GoGet',                                      unfinished = true },
  { ':GoDebug',                       description = 'GoDebug' },
  { ':GoDbgConfig',                   description = 'GoDbgConfig' },
  { ':GoDbgKeys',                     description = 'GoDbgKeys' },
  { ':GoDbgStop',                     description = 'GoDbgStop' },
  { ':GoDbgContinue',                 description = 'GoDbgContinue' },
  { ':GoCreateLaunch',                description = 'GoCreateLaunch' },
  { ':GoBreakToggle',                 description = 'GoBreakToggle' },
  { ':GoBreakSave',                   description = 'GoBreakSave' },
  { ':GoBreakLoad',                   description = 'GoBreakLoad' },
  { ':GoEnv',                         description = 'GoEnv',                                      unfinished = true },
  { ':GoAlt',                         description = 'GoAlt' },
  { ':GoDoc',                         description = 'GoDoc',                                      unfinished = true },
  { ':GoMockGen',                     description = 'GoMockGen' },
  { ':GoPkgOutline',                  description = 'Go Package Outline' },
  { ':GoImpl',                        description = 'GoImpl',                                     unfinished = true },
  { ':GoToggleInlay',                 description = 'GoToggleInlay' },
  { ':GoTermClose',                   description = 'GoTermClose' },
  { ':OpenBrowserSearch',             description = 'Search in web browser',                      unfinished = true },
  { ':MakeTable',                     description = 'CSV to markdown table' },
  { ':UnmakeTable',                   description = 'Markdow table to CSV' },
  { ':ASToggle',                      description = 'ASToggle: toggles AutoSave.nvim on and off.' },
  { ':HexToggle',                     description = 'Toggle the hex view' },
  { ':Lazy sync',                     description = 'Lazy: Sync plugins' },
  { 'lua require("smp").preview()',   description = 'SMP: preview current markdown file' },
  {
    'lua require("smp").book()',
    description =
    'SMP: open the markdown book in a splitted window on right'
  },
  { 'lua require("smp").expand_snippet()',      description = 'SMP: Expand current snippet in place' },
  { 'lua require("smp").expand_all_snippets()', description = 'SMP: Expand all snippets in place' },
  {
    'lua require("smp").breakIfLong()',
    description =
    'SMP: Break line length if its too long for easier editting'
  },
  {
    'lua require("smp").insert_blank_line()',
    description =
    'SMP: Insert blank lines between multiple lines of text'
  },
  { 'lua require("smp").bookthis()',                 description = 'SMP: Show book of this markdown file' },
  {
    'lua require("smp").search_text()',
    description =
    'SMP: Incremental search all markdown files by content'
  },
  { 'lua require("smp").search_tag()',               description = 'SMP: Incremental search all markdown files by tags' },
  { 'lua require("smp").insert_toc_here()',          description = 'SMP: Insert TOC here' },
  { 'lua require("smp").indicator_on()',             description = 'SMP: Show current line indicator in previewer' },
  { 'lua require("smp").indicator_off()',            description = 'SMP: Dont show line indicator in previewer' },
  { 'lua require("smp").indicator_as_config()',      description = 'SMP: Show line indicator in previewer as configured' },
  { 'lua require("smp").wrapwiki_visual()',          description = 'SMP: Wrap selected text into a wiki link' },
  { 'lua require("smp").wrapwiki_word()',            description = 'SMP: Wrap word under cursor into a wiki link' },
  { 'lua require("smp").wrapwiki_line()',            description = 'SMP: Wrap current line into a wiki link' },
  { 'lua require("smp").paste_url()',                description = 'SMP: Paste url from clipboard into a link' },
  { 'lua require("smp").paste_wiki_word()',          description = 'SMP: Paste word from clipboard into a link' },
  { 'lua require("smp").open_file_in_this_line()',   description = 'SMP: System open the linked file in this line' },
  { 'lua require("smp").locate_file_in_this_line()', description = 'SMP: System locate the linked file in this line' },
  { 'lua require("smp").gotoHeaderFromTocEntry()',   description = 'SMP: Jump to header from TOC entry' },
  { 'lua require("smp").start()',                    description = 'SMP: Start background server' },
  { 'lua require("smp").stop()',                     description = 'SMP: Stop background server' },
}

require('legendary').commands(commands)

require("which-key").setup({
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  }
})


local wk = require("which-key")

-- Bindings with <Space> prefix
wk.register({
  c = {
    name = "code",
    a = { require("navigator.codeAction").code_action, "code_action" },
  },
  w = {
    name = "workspace",
    a = { require("navigator.workspace").add_workspace_folder, "add_workspace_folder" },
    r = { require("navigator.workspace").remove_workspace_folder, "remove_workspace_folder" },
    l = { require("navigator.workspace").list_workspace_folders, "list_workspace_folders" },
  },
  l = {
    name = "lens",
    a = { require("navigator.codelens").run_action, "run code lens action" },
  },
  D = { vim.lsp.buf.type_definition, "type_definition" },
  f = {
    name = "format",
    f = { vim.lsp.buf.format, "format" },
  },
  m = {
    name = "navigator format",
    m = { require("navigator.formatting").range_format, "range format operator e.g gmip" },
  },
  rn = { require("navigator.rename").rename, "rename" },
}, { prefix = "<Space>" })

-- Bindings with <Leader> prefix
wk.register({
  g = {
    name = "go to",
    r = { require("navigator.reference").reference, "reference" },
    t = { require("navigator.treesitter").buf_ts, "buf_ts" },
    T = { require("navigator.treesitter").bufs_ts, "bufs_ts" },
    i = { vim.lsp.buf.incoming_calls, "incoming_calls" },
    o = { vim.lsp.buf.outgoing_calls, "outgoing_calls" },
  },
  c = {
    t = { require("navigator.ctags").ctags, "ctags" },
  },
  d = {
    t = { require("navigator.diagnostics").toggle_diagnostics, "toggle_diagnostics" },
  },
  k = { require("navigator.dochighlight").hi_symbol, "hi_symbol" },
}, { prefix = "<Leader>" })

-- Adding individual bindings (without prefix or with other prefixes)
wk.register({
  g = {
    name = "go to",
    r = { require("navigator.reference").async_ref, "async_ref" },
    ["0"] = { require("navigator.symbols").document_symbols, "document_symbols" },
    W = { require("navigator.workspace").workspace_symbol_live, "workspace_symbol_live" },
    d = { require("navigator.definition").definition, "definition" },
    D = { vim.lsp.buf.declaration, "declaration" },
    p = { require("navigator.definition").definition_preview, "definition_preview" },
    i = { vim.lsp.buf.implementation, "implementation" },
    L = { require("navigator.diagnostics").show_diagnostics, "show_diagnostics" },
    G = { require("navigator.diagnostics").show_buf_diagnostics, "show_buf_diagnostics" },
  },
  ['[d'] = { vim.diagnostic.goto_prev, "prev diagnostics" },
  [']d'] = { vim.diagnostic.goto_next, "next diagnostics" },
  ['[r'] = { require("navigator.treesitter").goto_previous_usage, "goto_previous_usage" },
  [']r'] = { require("navigator.treesitter").goto_next_usage, "goto_next_usage" },
  ['<C-k>'] = { vim.lsp.buf.signature_help, "signature_help" },
  ['<M-k>'] = { vim.lsp.signature_help, "signature_help" },
  ['<C-]>'] = { require("navigator.definition").definition, "definition" },
}, { prefix = "" })

wk.register({
  ['ca'] = { require("navigator.codeAction").range_code_action, "range code action" },
  ['ff'] = { vim.lsp.buf.range_formatting, "range format" },
}, { mode = "v", prefix = "<Space>" })

wk.register({
  g = {
    g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Telescope live grep", noremap = true },
    f = { "<cmd>Telescope advanced_git_search show_custom_functions<cr>", "Telescope advanced git search", noremap = true },
    s = { "<cmd>lua require('telescope.builtin').git_stash()<cr>", "Telescope git stash", noremap = true },
    b = { "<cmd>lua require('telescope.builtin').git_branches()<cr>", "Telescope git branches", noremap = true },
    S = { "<cmd>lua require('telescope.builtin').git_status()<cr>", "Telescope git status", noremap = true },
    c = { "<cmd>lua require('telescope.builtin').git_commits()<cr>", "Telescope git commits", noremap = true },
    C = { "<cmd>lua require('telescope.builtin').git_bcommits()<cr>", "Telescope git bcommits", noremap = true },
  },
  f = { '<cmd>NvimTreeToggle<cr>', 'Nvim Tree Toggle', noremap = true },
  F = { '<cmd>NvimTreeFindFile<cr>', 'Nvim Tree Focus File', noremap = true },
  d = {
    c = { '<cmd>Telescope dap commands<cr>', 'dap commands', noremap = true },
    l = { '<cmd>Telescope dap list_breakpoints<cr>', 'debug - dap list_breakpoints', noremap = true },
    v = { '<cmd>Telescope dap variables<cr>', 'debug - dap variables', noremap = true },
    f = { '<cmd>Telescope dap frames<cr>', 'debug - dap frames', noremap = true },
    b = { '<cmd>lua require("dap").toggle_breakpoint()<cr>', 'debug - toggle breakpoint', noremap = true },
    t = { '<cmd>lua require("dap-go").debug_test()<cr>', 'debug go test', noremap = true },
  },
  c = {
    b = { '<cmd>lua require("telescope.builtin").buffers()<cr>', 'Telescope buffers', noremap = true },
    i = { '<cmd>lua require("telescope").extensions.goimpl.goimpl{}<CR>', 'Golang implementations', noremap = true },
    f = { '<cmd>Flashcards<CR>', 'Flashcard', noremap = true },
    n = { '<Plug>(openbrowser-open)', 'Open a browser', noremap = true },
    c = { '<cmd>lua require("telescope.builtin").commands()<cr>', 'Telescope commands', noremap = true },
    C = { '<cmd>Telescope changes<cr>', 'Telescope Changes', noremap = true },
    R = { '<cmd>Telescope repo list<cr>', 'Change repo', noremap = true },
    r = { '<cmd>Telescope repo cached_list<cr>', 'Change repo (cached_list)', noremap = true },
    S = { '<cmd>Telescope scriptnames<cr>', 'Telescope Scriptnames', noremap = true },
    h = { '<cmd>lua require("telescope.builtin").help_tags()<cr>', 'Telescope help_tags', noremap = true },
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
    R = { '<Plug>RestNvim', 'RestNvim - the request under the cursor', noremap = true },
    C = { '<Plug>RestNvimPreview', 'RestNvim - preview the request cURL command', noremap = true },
    L = { '<Plug>RestNvimLast', 'RestNvim - re-run the last request', noremap = true },
  },
  q = {
    b = {
      "<cmd>Telekasten browse_media<cr>",
      "Notes - Telekasten browse_media - Browse images / media files",
      noremap = true
    },
    f = {
      f = {
        "<cmd>Telekasten find_friends<cr>",
        "Notes - Telekasten find_friends - Show all notes linking to the link under the cursor",
        noremap = true
      },
    },
    g = {
      l = {
        "<cmd>Telekasten follow_link<cr>",
        "Notes - Telekasten follow_link - Follow the link under the cursor",
        noremap = true
      },
      w = {
        "<cmd>Telekasten goto_thisweek<cr>",
        "Notes - Telekasten goto_thisweek - Open this week's weekly note",
        noremap = true
      },
      g = { "<cmd>Telekasten goto_today<cr>", "Notes - Telekasten goto_today - Open today's daily note", noremap = true },
    },
    i = {
      i = {
        "<cmd>Telekasten insert_img_link<cr>",
        "Notes - Telekasten insert_img_link - Browse images / media files and insert a link to the selected one",
        noremap = true
      },
      l = { "<cmd>Telekasten insert_link<cr>", "Notes - Telekasten insert_link - Insert a link to a note", noremap = true },
      p = {
        "<cmd>Telekasten paste_img_and_link<cr>",
        "Notes - Telekasten paste_img_and_link - Paste an image from the clipboard into a file and inserts a link to it",
        noremap = true
      },
    },
    n = {
      n = {
        "<cmd>Telekasten new_note<cr>",
        "Notes - Telekasten new_note - Create a new note, prompts for title",
        noremap = true
      },
      t = {
        "<cmd>Telekasten new_templated_note<cr>",
        "Notes - Telekasten new_templated_note - create a new note by template, prompts for title and template",
        noremap = true
      },
    },
    p = { "<cmd>Telekasten panel<cr>", "Notes - Telekasten panel - brings up the command palette", noremap = true },
    c = {
      "<cmd>Telekasten preview_img<cr>",
      "Notes - Telekasten preview_img - preview image under the cursor",
      noremap = true
    },
    r = {
      "<cmd>Telekasten rename_note<cr>",
      "Notes - Telekasten rename_note - Rename current note and update the links pointing to it",
      noremap = true
    },
    s = {
      n = {
        "<cmd>Telekasten search_notes<cr>",
        "Notes - Telekasten search_notes - Search (grep) in all notes",
        noremap = true
      },
      b = {
        "<cmd>Telekasten show_backlinks<cr>",
        "Notes - Telekasten show_backlinks - Show all notes linking to the current one",
        noremap = true
      },
      c = { "<cmd>Telekasten show_calendar<cr>", "Notes - Telekasten show_calendar - Show the calendar", noremap = true },
      t = { "<cmd>Telekasten show_tags<cr>", "Notes - Telekasten show_tags - Search through all tags", noremap = true },
    },
    t = {
      "<cmd>Telekasten toggle_todo<cr>",
      "Notes - Telekasten toggle_todo - Toggle - [ ] todo status of a line",
      noremap = true
    },
    y = {
      "<cmd>Telekasten yank_notelink<cr>",
      "Notes - Telekasten yank_notelink - Yank a link to the currently open note",
      noremap = true
    },
  },
  u = { '<cmd>Telescope undo<cr>', 'Telescope undo', noremap = true },
  M = { '<cmd>Smp<cr>', "SMP Panel", noremap = true },
}, { prefix = "<leader>" }
)

wk.register({
  t = { "<cmd>lua require('FTerm').toggle()<CR>", "Toggle FTerm" },
}, { prefix = "<C-w>" }
)

wk.register({
  t = { "<cmd>lua require('FTerm').toggle()<CR>", "Toggle FTerm" },
}, { prefix = "<C-w>", mode = "t" }
)

wk.register({
      ["<F12>"] = { "<cmd>lua require('dap_ui').toggle()<CR>", "Toggle FTerm" }
})

vim.cmd [[
nnoremap <C-P> <cmd>lua require('telescope.builtin').find_files()<cr>
]]
