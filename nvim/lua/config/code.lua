require("nvim-treesitter.configs").setup {
  ensure_installed = { "bash", "c", "css", "clojure", "cpp",
    "dockerfile", "dot", "elixir", "erlang", "go",
    "gomod", "graphql", "hcl", "html", "http", "java",
    "javascript", "json", "jsonc", "kotlin", "latex", "lua",
    "make", "perl", "php", "python", "http" },
  highlight = { enable = true },
  indentation = { enable = true },
  folding = { enable = false },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gni",
      node_incremental = "gnn",
      scope_incremental = "gnc",
      node_decremental = "gnm"
    }
  }
}

require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = require("navigator.lspclient.attach").on_attach

require('navigator').setup({
  default_mapping = false,
  keymaps = {
    { key = 'gr', func = require('navigator.reference').async_ref, desc = 'async_ref' },
    { mode = 'i', key = '<M-k>', func = vim.lsp.signature_help, desc = 'signature_help' },
    { key = 'gk', func = vim.lsp.buf.signature_help, desc = 'signature_help' },
    { key = 'g0', func = require('navigator.symbols').document_symbols, desc = 'document_symbols' },
    { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
    { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
    { key = 'gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
    { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
    { key = 'gK', func = vim.lsp.buf.hover, desc = 'hover' },
    { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
    { key = 'gL', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
    { key = 'gG', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },
    { key = '<Space>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
    { key = '<Space>rn', func = require('navigator.rename').rename, desc = 'rename' },
    -- { key = '<Leader>gi', func = vim.lsp.buf.incoming_calls, desc = 'incoming_calls' },
    -- { key = '<Leader>go', func = vim.lsp.buf.outgoing_calls, desc = 'outgoing_calls' },
    -- { key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
    -- { key = '<Leader>dt', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'toggle_diagnostics' },
    -- { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
    -- { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },
    -- { key = ']O', func = vim.diagnostic.set_loclist, desc = 'diagnostics set loclist' },
    -- { key = '<Leader>k', func = require('navigator.dochighlight').hi_symbol, desc = 'hi_symbol' },
    -- { key = '<Space>wa', func = require('navigator.workspace').add_workspace_folder, desc = 'add_workspace_folder' },
    -- {
    --   key = '<Space>wr',L
    --   func = require('navigator.workspace').remove_workspace_folder,
    --   desc = 'remove_workspace_folder',
    -- },
    { key = '<Space>ff', func = vim.lsp.buf.format, mode = 'n', desc = 'format' },
    { key = '<Space>ff', func = vim.lsp.buf.range_formatting, mode = 'v', desc = 'range format' },
    -- { key = '<Space>rf', func = require('navigator.formatting').range_format, mode = 'n', desc = 'range_fmt_v' },
    -- { key = '<Space>wl', func = require('navigator.workspace').list_workspace_folders, desc = 'list_workspace_folders' },
    { key = '<Space>la', mode = 'n', func = require('navigator.codelens').run_action, desc = '' },
  },
  mason = true,
  lsp = {
    format_on_save = false,
    disply_diagnostic_qf = false,
  }
})

-- require("nvim-lsp-installer").setup {
--   log_level = vim.log.levels.DEBUG,
--   automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--   ui = {
--     icons = {
--       server_installed = "✓",
--       server_pending = "➜",
--       server_uninstalled = "✗"
--     }
--   }
-- }

vim.g.symbols_outline = {
  position = "left"
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
  -- lspconfig = {
  --   cmd = {"yaml-language-server"}
  -- },
})
require("lspconfig")["yamlls"].setup(cfg)
