return {
  {
	"folke/which-key.nvim",
	lazy = true,
	init = function()
	  vim.o.timeout = true
	  vim.o.timeoutlen = 300
	end,
	config = function()
	  require('which-key').setup()

	  local wk = require("which-key")

	  wk.register({
		['<CR>'] = { '"+y', 'copy to clippboard using enter'},
	  }, { mode= 'v' })

	  wk.register({
		[']b'] = { ':bnext<cr>', 'next buffer' },
		[']t'] = { ':tabnext<cr>', 'next tab' },
		['[b'] = { ':bprevious<cr>', 'previous buffer' },
		['[t'] = { ':tabprevious<cr>', 'previous tab' },
	  }, { mode = 'n' })

	  wk.register({
		['<C-w>'] = {
		  ['<Esc>'] = { '<C-\\><C-N><Esc>', {noremap = true, silent = false}},
		  ['<C-w>'] = { '<C-\\><C-N><C-w><C-w>', {noremap = true, silent = false}},
		  ['<C-Up>'] = { '<C-\\><C-N><C-w><C-Up>', {noremap = true, silent = false}},
		  ['<C-Down>'] = { '<C-\\><C-N><C-w><C-Down>', {noremap = true, silent = false}},
		  ['<C-Right>'] = { '<C-\\><C-N><C-w><C-Right>', {noremap = true, silent = false}},
		  ['<C-Left>'] = { '<C-\\><C-N><C-w><C-Left>', {noremap = true, silent = false}},
		},
		['<C-P>'] = { '<C-\\><C-N><Esc><C-P>', {noremap = true, silent = false}},
	  }, { mode = 't' })

	  wk.register({
		w = { ':set list!<cr>', 'toggle show symbols'},
		l = { ':nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>', 'clean search'},
	  }, { prefix = "<leader>" })

	  -- TODO: move to coding.lua

	  -- Bindings with <Space> prefix
	  wk.register({
		c = {
		  name = "code",
		  a = { require("navigator.codeAction").code_action, "code_action" },
		},
		w = {
		  name = "workspace",
		  a = { require("navigator.workspace").add_workspace_folder, "add_workspace_folder" },
		  r = { require("navigator.workspace").remove_workspace_folder, "remove_workspace_folder" },
		  l = { require("navigator.workspace").list_workspace_folders, "list_workspace_folders" },
		},
		l = {
		  name = "lens",
		  a = { require("navigator.codelens").run_action, "run code lens action" },
		},
		D = { vim.lsp.buf.type_definition, "type_definition" },
		f = {
		  name = "format",
		  f = { vim.lsp.buf.format, "format" },
		},
		m = {
		  name = "navigator format",
		  m = { require("navigator.formatting").range_format, "range format operator e.g gmip" },
		},
		rn = { require("navigator.rename").rename, "rename" },
	  }, { prefix = "<Space>" })

	  -- Adding individual bindings (without prefix or with other prefixes)
	  wk.register({
		g = {
		  name = "go to",
		  r = { require('navigator.reference').async_ref, "LSP async reference (Navigator)", noremap = true },
		  ["0"] = { require("navigator.symbols").document_symbols, "LSP document symbols" },
		  W = { require("navigator.workspace").workspace_symbol_live, "LSP workspace symbols live" },
		  d = { require("navigator.definition").definition, "LSP definition" },
		  D = { vim.lsp.buf.declaration, "LSP declaration" },
		  p = { require("navigator.definition").definition_preview, "LSP definition preview" },
		  i = { vim.lsp.buf.implementation, "LSP implementation" },
		  L = { require("navigator.diagnostics").show_diagnostics, "LSP show diagnostics" },
		  G = { require("navigator.diagnostics").show_buf_diagnostics, "LSP show buf_diagnostics" },
		},
		['<F2>'] = { vim.diagnostic.goto_prev, "prev diagnostics" },
		['S-<F2>'] = { vim.diagnostic.goto_next, "next diagnostics" },
		['[d'] = { vim.diagnostic.goto_prev, "prev diagnostics" },
		[']d'] = { vim.diagnostic.goto_next, "next diagnostics" },
		['[r'] = { require("navigator.treesitter").goto_previous_usage, "goto_previous_usage" },
		[']r'] = { require("navigator.treesitter").goto_next_usage, "goto_next_usage" },
		['<C-k>'] = { vim.lsp.buf.signature_help, "lsp buf signature help" },
		['<M-k>'] = { vim.lsp.signature_help, "lsp buf signature help" },
	  }, { prefix = "" })

	  wk.register({
		x = {
		  name = 'show trouble with',
		  x = { function() require("trouble").toggle() end, "default" },
		  w = { function() require("trouble").toggle("workspace_diagnostics") end, "workspace diagnostics" },
		  d = { function() require("trouble").toggle("document_diagnostics") end, "document diagnostics" },
		  q = { function() require("trouble").toggle("quickfix") end, "quickfix" },
		  l = { function() require("trouble").toggle("loclist") end, "loclist" },
		},
	  }, { prefix = "<leader>" })

	  wk.register({
		['ca'] = { require("navigator.codeAction").range_code_action, "range code action" },
		['ff'] = { vim.lsp.buf.range_formatting, "range format" },
	  }, { mode = "v", prefix = "<space>" })
	end,
  },
}
