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

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "bashls", "dockerls", "lua_ls", "pyright", "tsserver", "terraformls", "tflint", "yamlls" },
})

-- Fix hcl filetype and terraformls and tflint
require("lspconfig").bashls.setup({ filetypes = { "bash", "sh"} })
require("lspconfig").terraformls.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })
require("lspconfig").tflint.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })

require("navigator").setup({
	default_mapping = false,
	keymaps = {
		{ key = "gr", func = require("navigator.reference").async_ref, desc = "async_ref" },
		{ key = "<Leader>gr", func = require("navigator.reference").reference, desc = "reference" }, -- reference deprecated
		{ mode = "i", key = "<M-k>", func = vim.lsp.signature_help, desc = "signature_help" },
		{ key = "<c-k>", func = vim.lsp.buf.signature_help, desc = "signature_help" },
		{ key = "g0", func = require("navigator.symbols").document_symbols, desc = "document_symbols" },
		{ key = "gW", func = require("navigator.workspace").workspace_symbol_live, desc = "workspace_symbol_live" },
		{ key = "<c-]>", func = require("navigator.definition").definition, desc = "definition" },
		{ key = "gd", func = require("navigator.definition").definition, desc = "definition" },
		{ key = "gD", func = vim.lsp.buf.declaration, desc = "declaration" },
		{ key = "gp", func = require("navigator.definition").definition_preview, desc = "definition_preview" },
		{ key = "<Leader>gt", func = require("navigator.treesitter").buf_ts, desc = "buf_ts" },
		{ key = "<Leader>gT", func = require("navigator.treesitter").bufs_ts, desc = "bufs_ts" },
		{ key = "<Leader>ct", func = require("navigator.ctags").ctags, desc = "ctags" },
		{ key = "<Space>ca", mode = "n", func = require("navigator.codeAction").code_action, desc = "code_action" },
		{
			key = "<Space>ca",
			mode = "v",
			func = require("navigator.codeAction").range_code_action,
			desc = "range_code_action",
		},
		-- { key = '<Leader>re', func = 'rename()' },
		{ key = "<Space>rn", func = require("navigator.rename").rename, desc = "rename" },
		{ key = "<Leader>gi", func = vim.lsp.buf.incoming_calls, desc = "incoming_calls" },
		{ key = "<Leader>go", func = vim.lsp.buf.outgoing_calls, desc = "outgoing_calls" },
		{ key = "gi", func = vim.lsp.buf.implementation, desc = "implementation" },
		{ key = "<Space>D", func = vim.lsp.buf.type_definition, desc = "type_definition" },
		{ key = "gL", func = require("navigator.diagnostics").show_diagnostics, desc = "show_diagnostics" },
		{ key = "gG", func = require("navigator.diagnostics").show_buf_diagnostics, desc = "show_buf_diagnostics" },
		{ key = "<Leader>dt", func = require("navigator.diagnostics").toggle_diagnostics, desc = "toggle_diagnostics" },
		{ key = "]d", func = vim.diagnostic.goto_next, desc = "next diagnostics" },
		{ key = "[d", func = vim.diagnostic.goto_prev, desc = "prev diagnostics" },
		{ key = "]O", func = vim.diagnostic.set_loclist, desc = "diagnostics set loclist" },
		{ key = "]r", func = require("navigator.treesitter").goto_next_usage, desc = "goto_next_usage" },
		{ key = "[r", func = require("navigator.treesitter").goto_previous_usage, desc = "goto_previous_usage" },
		{ key = "<C-LeftMouse>", func = vim.lsp.buf.definition, desc = "definition" },
		{ key = "g<LeftMouse>", func = vim.lsp.buf.implementation, desc = "implementation" },
		{ key = "<Leader>k", func = require("navigator.dochighlight").hi_symbol, desc = "hi_symbol" },
		{
			key = "<Space>wa",
			func = require("navigator.workspace").add_workspace_folder,
			desc = "add_workspace_folder",
		},
		{
			key = "<Space>wr",
			func = require("navigator.workspace").remove_workspace_folder,
			desc = "remove_workspace_folder",
		},
		{ key = "<Space>ff", func = vim.lsp.buf.format, mode = "n", desc = "format" },
		{ key = "<Space>ff", func = vim.lsp.buf.range_formatting, mode = "v", desc = "range format" },
		{
			key = "<Space>gm",
			func = require("navigator.formatting").range_format,
			mode = "n",
			desc = "range format operator e.g gmip",
		},
		{
			key = "<Space>wl",
			func = require("navigator.workspace").list_workspace_folders,
			desc = "list_workspace_folders",
		},
		{
			key = "<Space>la",
			mode = "n",
			func = require("navigator.codelens").run_action,
			desc = "run code lens action",
		},
	},
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

-- formatter````,
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,

			-- You can also define your own configuration
			function()
				-- Supports conditional formatting
				if util.get_current_buffer_file_name() == "special.lua" then
					return nil
				end

				-- Full specification of configurations is down below and in Vim help
				-- files
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},

		hcl = {
			{
				exe = "terragrunt",
				args = {
                    "hclfmt",
					"--terragrunt-hclfmt-file",
					util.escape_path(util.get_current_buffer_file_path()),
				},
				stdin = false,
			},
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

