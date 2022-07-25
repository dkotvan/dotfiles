require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "c", "css", "clojure", "cpp", "dockerfile", "dot", "elixir", "erlang", "go", "gomod", "graphql", "html", "http", "java", "javascript", "json", "kotlin", "latex", "lua", "make", "perl", "php", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {enable = true},
  indentation = {enable = true},
  folding = {enable = false},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}
require('navigator').setup()
require("trouble").setup()

local wk = require("which-key")

wk.register(
{
  x = {
    name = "trouble", -- optional group name
    x = {"<cmd>Trouble<cr>", "Default Trouble Diagnostics", noremap = true},
    w = {"<cmd>Trouble workspace_diagnostics<cr>", "Trouble Workspace Diagnostics", noremap = true},
    d = {"<cmd>Trouble document_diagnostics<cr>", "Trouble Document Diagnostics", noremap = true}
  }
},
{prefix = "<leader>"}
)

vim.api.nvim_set_keymap("n", "<leader>rr", "<Cmd>lua vim.lsp.buf.rename()<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope lsp_document_symbols<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
"n",
"<leader>S",
"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
{silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<C-F2>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {silent = true, noremap = true})

require("nvim-lsp-installer").setup {
  log_level = vim.log.levels.DEBUG,
  automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
}

vim.g.symbols_outline = {
  position = "left"
}

local path = require 'nvim-lsp-installer.core.path'
local install_root_dir = path.concat {vim.fn.stdpath 'data', 'lsp_servers'}

require('go').setup({
  gopls_cmd = {install_root_dir .. '/go/gopls'},
  goimport='gopls', -- goimport command, can be gopls[default] or goimport
  fillstruct = 'gopls', -- can be nil (use fillstruct, slower) and gopls
  gofmt = 'gofumpt', --gofmt cmd,
  max_line_len = 128, -- max line length in golines format, Target maximum line length for golines
  tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
  comment_placeholder = 'ﳑ' ,  -- comment_placeholder your cool placeholder e.g. ﳑ       
  icons = {breakpoint = '🧘', currentpos = '🏃'},  -- setup to `false` to disable icons setup
  verbose = false,  -- output loginf in messages
  lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
  -- false: do nothing
  -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
  --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
  --      when lsp_cfg is true
  -- if lsp_on_attach is a function: use this function as on_attach function for gopls
  lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
  lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
  -- function(bufnr)
    --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
    -- end
    -- to setup a table of codelens
    lsp_diag_hdlr = true, -- hook lsp diag handler
    -- virtual text setup
    lsp_diag_virtual_text = { space = 0, prefix = "" },
    lsp_diag_signs = true,
    lsp_diag_update_in_insert = false,
    lsp_document_formatting = true,
    -- set to true: use gopls to format
    -- false if you want to use other formatter tool(e.g. efm, nulls)
    lsp_inlay_hints = {
      enable = true,
      -- Only show inlay hints for the current line
      only_current_line = false,
      -- Event which triggers a refersh of the inlay hints.
      -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
      -- not that this may cause higher CPU usage.
      -- This option is only respected when only_current_line and
      -- autoSetHints both are true.
      only_current_line_autocmd = "CursorHold",
      -- whether to show variable name before type hints with the inlay hints or not
      -- default: false
      show_variable_name = true,
      -- prefix for parameter hints
      parameter_hints_prefix = " ",
      show_parameter_hints = true,
      -- prefix for all the other hints (type, chaining)
      other_hints_prefix = "=> ",
      -- whether to align to the lenght of the longest line in the file
      max_len_align = false,
      -- padding from the left if max_len_align is true
      max_len_align_padding = 1,
      -- whether to align to the extreme right or not
      right_align = false,
      -- padding from the right if right_align is true
      right_align_padding = 6,
      -- The color of the hints
      highlight = "Comment",
    },
    gopls_remote_auto = true, -- add -remote=auto to gopls
    dap_debug = true, -- set to false to disable dap
    dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
    -- false: do not use keymap in go/dap.lua.  you must define your own.
    -- windows: use visual studio keymap
    dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
    dap_debug_vt = true, -- set to true to enable dap virtual text
    textobjects = true, -- enable default text jobects through treesittter-text-objects
    test_runner = 'go', -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
    verbose_tests = true, -- set to add verbose flag to tests
    run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
    -- float term recommand if you use richgo/ginkgo with terminal color

    test_efm = false, -- errorfomat for quickfix, default mix mode, set to true will be efm only
  })
