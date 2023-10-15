require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "c",
    "css",
    "clojure",
    "cpp",
    "dockerfile",
    "dot",
    "elixir",
    "erlang",
    "go",
    "gomod",
    "graphql",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "json",
    "jsonc",
    "kotlin",
    "latex",
    "lua",
    "make",
    "perl",
    "php",
    "python",
    "terraform",
    "vim",
  },
  highlight = { enable = true },
  indentation = { enable = true },
  folding = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gni",
      node_incremental = "gnn",
      scope_incremental = "gnc",
      node_decremental = "gnm",
    },
  },
})

require('ts_context_commentstring').setup {}

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "bashls", "dockerls", "lua_ls", "pyright", "tsserver", "terraformls", "tflint", "yamlls" },
})

-- Fix hcl filetype and terraformls and tflint
require("lspconfig").bashls.setup({ filetypes = { "bash", "sh" } })
require("lspconfig").terraformls.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })
require("lspconfig").tflint.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })

require("navigator").setup({
  default_mapping = false,
  mason = true,
  lsp = {
    format_on_save = false,
    disply_diagnostic_qf = false,
    disable_lsp = { "sumneko_lua" },
  },
})

vim.g.symbols_outline = {
  position = "left",
}

local cfg = require("yaml-companion").setup({
  schemas = {
    result = {
      {
        name = "OpenaAPI 3.0.x",
        uri = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.yaml",
      },
    },
  },
  -- Add any options here, or leave empty to use the default settings
  lspconfig = {
    settings = {
      yaml = { keyOrdering = false },
    }
  },
})

require("lspconfig").yamlls.setup(cfg)

require("nvim-lightbulb").setup({
  autocmd = { enabled = true }
})

