return {
	-- Parser manager for Neovim 0.12+ (nvim-treesitter is archived)
	{
		"romus204/tree-sitter-manager.nvim",
		config = function()
			require("tree-sitter-manager").setup({
				auto_install = true,
				ensure_installed = {
					"bash",
					"c",
					"comment",
					"css",
					"cpp",
					"diff",
					"dockerfile",
					"elixir",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"gomod",
					"gosum",
					"gowork",
					"gotmpl",
					"graphql",
					"hcl",
					"html",
					"http",
					"java",
					"javascript",
					"json",
					"json5",
					"kotlin",
					"lua",
					"make",
					"markdown",
					"markdown_inline",
					"python",
					"regex",
					"ruby",
					"scss",
					"sql",
					"svelte",
					"terraform",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"vue",
					"xml",
					"yaml",
					"zig",
				},
			})
		end,
	},
	-- Stub: go.nvim and other plugins still declare nvim-treesitter as a dependency
	{ "nvim-treesitter/nvim-treesitter" },

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- LSP Servers
					"autotools-language-server",
					"bashls",
					"docker-compose-language-service",
					"dockerls",
					"gopls",
					"jqls",
					"lua_ls",
					"pyright",
					"solargraph",
					"terraformls",
					"tflint",
					"yamlls",
					-- Linters
					"eslint_d",
					"shellcheck",
					"vacuum",
					-- Formatters
					"cbfmt",
					"jq",
					"shfmt",
					"sqlfluff",
					"stylua",
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 10000,
				debounce_hours = 8,
			})

			-- Enable LSP servers — config is loaded from nvim/lsp/<server>.lua
			vim.lsp.enable({ "gopls", "lua_ls", "bashls", "terraformls", "tflint" })
		end,
	},

	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "lewis6991/gitsigns.nvim" },
		config = function()
			local nls = require("null-ls")
			nls.setup({
				debug = false,
				sources = {
					-- Code Actions
					nls.builtins.code_actions.gitrebase,
					nls.builtins.code_actions.gitsigns,
					-- Diagnostics (formatting handled by conform.nvim)
					-- vacuum runs as LSP server already, no need to duplicate here
					nls.builtins.diagnostics.zsh,
				},
			})

			-- Suppress diagnostics for .env files
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("EnvFileDiagnostics", { clear = true }),
				pattern = "sh",
				callback = function(args)
					local filename = vim.fn.expand("%:t")
					if filename:match("^%.env") or filename:match("%.env$") then
						vim.diagnostic.disable(args.buf)
					end
				end,
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					sh = { "shfmt" },
					bash = { "shfmt" },
					sql = { "sqlfluff" },
					go = { "goimports", "gofmt" },
				},
				formatters = {
					sqlfluff = {
						args = {
							"format",
							"--dialect=postgres",
							"--config",
							vim.fn.expand("$HOME/dotfiles/nvim/sqlfluff.toml"),
							"-",
						},
						require_cwd = false,
					},
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			auto_jump = {},
			auto_preview = false,
		},
	},

	-- Supports bundler in vim
	{
		"tpope/vim-bundler",
		ft = { "ruby" },
	},

	{
		"saghen/blink.cmp",
		version = "*",
		dependencies = "rafamadriz/friendly-snippets",
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },
		},
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			-- "nvim-treesitter/nvim-treesitter",
			{
				"fredrikaverpil/neotest-golang",
				version = "*",
				dependencies = {
					"leoluz/nvim-dap-go",
				},
			}, -- Installation
		},
		config = function()
			local neotest_golang_opts = {
				runner = "gotestsum",
				recursive_run = true, -- Enable recursive testing for all subdirectories
			} -- Specify custom configuration
			require("neotest").setup({
				adapters = {
					require("neotest-golang")(neotest_golang_opts), -- Registration
				},
			})
		end,
		keys = {
			{
				"<leader>td",
				function()
					require("neotest").run.run({ suite = false, strategy = "dap" })
				end,
				desc = "Debug nearest test",
			},
			{
				"<leader>tr",
				function()
					require("neotest").run.run()
				end,
				desc = "Run nearest test",
			},
			{
				"<leader>tf",
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Run current file",
			},
			{
				"<leader>ts",
				function()
					require("neotest").run.stop()
				end,
				desc = "Stop nearest test",
			},
			{
				"<leader>ta",
				function()
					require("neotest").run.attach()
				end,
				desc = "Attach to nearest test",
			},
			{
				"<leader>tt",
				function()
					require("neotest").run.run(vim.fn.getcwd())
					require("neotest").summary.open()
				end,
				desc = "Run all tests",
			},
		},
	},
}
