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

local lsp_installer = require("nvim-lsp-installer")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(
  function(server)
    -- the arguments to this setup() method is exactly the same as lspconfig's setup() function

    local opts = {}

    if server.name == "sumneko_lua" then
      local lua = {
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
      }

      opts = {
        settings = {Lua = lua}
      }
    end

    if server.name == "gopls" then
      opts = {
        -- settings
      }
    end

    opts['capabilities'] = capabilities

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
  end
)

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
