require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash", "c", "css", "csv", "clojure", "cpp", "diff", "dockerfile", "dot", "elixir",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gomod", "gosum", "gowork", "graphql", "hcl", "html", "http", "java", "javascript",
    "jq", "json", "json5", "jsonc", "kotlin", "latex", "lua", "make", "markdown_inline",
    "perl", "php", "python", "ruby", "sql", "terraform", "toml",
    "typescript", "vim", "xml", "yaml", "zig"
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
require("mason-lspconfig").setup()
require('mason-tool-installer').setup {
  ensure_installed = {
    -- LSP Servers
    "bashls", "docker_compose_language_service", "dockerls", "gradle_ls",
    "graphql", "jqls", "lua_ls", "pyright", "tsserver", "terraformls",
    "tflint", "yamlls",
    -- Linters
    "eslint_d", "shellcheck", "vacuum",
    -- Format
    "cbfmt", "jq", "shfmt", "sqlfluff",
  },
  auto_update = true,
  run_on_start = true,
  start_delay = 10000,
  debounce_hours = 8,
}

local nls = require("null-ls")

nls.setup({
  debug = false,
  sources = {
    -- Code Actions
    nls.builtins.code_actions.eslint_d,
    nls.builtins.code_actions.gitrebase,
    nls.builtins.code_actions.gitsigns,
    -- Diagnostics
    nls.builtins.diagnostics.eslint_d,
    nls.builtins.diagnostics.shellcheck,
    nls.builtins.diagnostics.sqlfluff.with({
        extra_args = { "--config", "/home/dkotvan/dotfiles/nvim/sqlfluff.toml" },
    }),
    nls.builtins.diagnostics.vacuum, -- TODO: create a recomended ruleset
    nls.builtins.diagnostics.zsh,
    -- Formatting.
    nls.builtins.formatting.beautysh,
    nls.builtins.formatting.cbfmt,
    nls.builtins.formatting.eslint_d,
    nls.builtins.formatting.jq,
    nls.builtins.formatting.shfmt,
    nls.builtins.formatting.sqlfluff.with({
        extra_args = { "--config", "/home/dkotvan/dotfiles/nvim/sqlfluff.toml" },
    }),
  },
})

-- Fix hcl filetype and terraformls and tflint
require("lspconfig").bashls.setup({ filetypes = { "bash", "sh" } })
require("lspconfig").terraformls.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })
require("lspconfig").tflint.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })

require("navigator").setup({
  debug = false,
  default_mapping = false,
  keymaps = {},
  mason = true,
  lines_show_prompt = 20,
  lsp = {
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true, virtual_text_icon = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    format_on_save = false,
    display_diagnostic_qf = 'trouble',
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
