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
