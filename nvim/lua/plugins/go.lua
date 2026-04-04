return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup({
				-- LSP: gopls is already managed by Mason + lsp/gopls.lua,
				-- so we disable go.nvim's own LSP setup to avoid conflicts.
				lsp_cfg = false,
				lsp_gofumpt = false, -- gofumpt is configured in lsp/gopls.lua
				lsp_keymaps = false, -- keymaps are managed in plugins/keys.lua
				lsp_codelens = true,
				lsp_inlay_hints = {
					enable = true,
				},
				-- Formatting: handled by conform.nvim (goimports + gofmt),
				-- so we disable go.nvim's format-on-save.
				lsp_document_formatting = false,
				-- Diagnostics
				diagnostic = {
					hdlr = false, -- use Neovim's built-in LSP diagnostics
				},
				-- Testing
				trouble = true, -- show test results in trouble.nvim
				test_runner = "gotestsum",
				run_in_floaterm = true,
				-- DAP: nvim-dap-go is already configured in plugins/debug.lua
				dap_debug = false,
			})
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod", "gosum", "gowork", "gotmpl" },
		build = ':lua require("go.install").update_all_sync()',
	},
}
