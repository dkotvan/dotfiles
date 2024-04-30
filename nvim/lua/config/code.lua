require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash", "c", "css", "csv", "clojure", "cpp", "diff", "dockerfile", "dot", "elixir",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gomod", "gosum", "gowork", "graphql", "hcl", "html", "http", "hurl", "java", "javascript",
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

local go_home = vim.fn.expand("$HOME/go")

require('go').setup({
  gopls_cmd = { go_home .. '/bin/gopls' },
  goimports = 'gopls', -- if set to 'gopls' will use golsp format
  gofmt = 'gopls',    -- if set to gopls will use golsp format
  -- max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  lsp_cfg = true,      -- false: use your own lspconfig
  lsp_gofumpt = true,   -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  lsp_keymaps = false, -- use our keymaps instead
  dap_debug = true,
  trouble = true,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
require('lspconfig').gopls.setup(cfg)

local nls = require("null-ls")

local sqlfluff_with = {
    extra_args = { "--config", vim.fn.expand("$HOME/dotfiles/nvim/sqlfluff.toml") },
  }

local sources = {
  -- Code Actions
  nls.builtins.code_actions.gitrebase,
  nls.builtins.code_actions.gitsigns,
  -- Diagnostics
  nls.builtins.diagnostics.sqlfluff.with(sqlfluff_with),
  nls.builtins.diagnostics.vacuum,   -- TODO: create a recomended ruleset
  nls.builtins.diagnostics.zsh,
  -- Formatting.
  nls.builtins.formatting.cbfmt,
  nls.builtins.formatting.shfmt,
  nls.builtins.formatting.sqlfluff.with(sqlfluff_with),
}
-- local gotest = require("go.null_ls").gotest()
-- local gotest_codeaction = require("go.null_ls").gotest_action()
-- table.insert(sources, gotest)
-- table.insert(sources, gotest_codeaction)
nls.setup({
  debug = false,
  sources = sources,
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
