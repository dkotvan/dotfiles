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

require("trouble").setup()

local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

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
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent = true, noremap = true})
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


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').dockerls.setup{
  capabilities = capabilities
}
require('lspconfig').jsonls.setup{
  capabilities = capabilities
}
require('lspconfig').yamlls.setup{
  capabilities = capabilities
}
require('lspconfig').bashls.setup{
  capabilities = capabilities
}
require('lspconfig').gopls.setup{
  capabilities = capabilities
}
require('lspconfig').sumneko_lua.setup{
  settings = {Lua = {
    runtime = {
      version = "LuaJIT",
      path = vim.split(package.path, ";")
    },
    diagnostics = {
      globals = {"vim"}
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      -- library = vim.api.nvim_get_runtime_file("", true),
      library = {
        [vim.fn.expand "$VIMRUNTIME/lua"] = true,
        [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true
      },
      maxPreload = 100000,
      preloadFileSize = 1000
    }
  }},
  capabilities = capabilities
}
require('lspconfig').kotlin_language_server.setup{
  capabilities = capabilities
}

require "formatter".setup {
  filetype = {
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    },
    sh = {
      -- Shell Script Formatter
      function()
        return {
          exe = "shfmt",
          args = {"-i", 2},
          stdin = true
        }
      end
    },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
          stdin = true
        }
      end
    }
  }
}

vim.g.symbols_outline = {
  position = "left"
}

-- vim.opt.expandtab = true
