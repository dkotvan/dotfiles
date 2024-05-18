return {
  -- Gruvbox colorscheme with support for treesiter
  {
	"sainnhe/gruvbox-material",
	config = function()
	  vim.cmd [[
	  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
	  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
	  set termguicolors " colorscheme working well on iTerm2 + tmux
	  set t_ZH=^[[3m
	  set t_ZR=^[[23m
	  ]]

	  vim.o.background = "dark"
	  vim.cmd('colorscheme gruvbox-material')
	end,
  },

  -- guide lines
  {
	"lukas-reineke/indent-blankline.nvim",
	main = 'ibl',
	config = function()
	  local highlight = {
		"dark4",
		"dark3",
		"dark2",
	  }

	  local hooks = require "ibl.hooks"
	  -- create the highlight groups in the highlight setup hook, so they are reset
	  -- every time the colorscheme changes
	  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "dark2", { fg = '#504945' })
		vim.api.nvim_set_hl(0, "dark3", { fg = '#665c54' })
		vim.api.nvim_set_hl(0, "dark4", { fg = '#7c6f64' })
	  end)

	  require("ibl").setup({
		indent = { highlight = highlight },
		scope = { -- configure scope to higglight beginning of scope
		enabled = true,
		show_start = true,
		show_end = true,
		injected_languages = true,
		highlight = { "Function", "Label" },
		priority = 500,
	  },
	})
  end,
},

{
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
  },
  config = function(_,opts)
	vim.opt.termguicolors = true
	require('bufferline').setup(opts)
  end,
},
-- Status and tabline
{
  "hoob3rt/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts ={
	options = {
	  theme = "gruvbox-material",
	  icons_enabled = 1
	},
	extensions = { 'aerial', 'lazy', 'mason', 'fugitive', 'nvim-tree', 'quickfix', 'trouble' },
	sections = {
	  lualine_a = { 'mode' },
	  lualine_b = { 'branch', 'diagnostics' },
	  lualine_c = {
		{
		  'filename',
		  path = 1,
		  newfile_status = true,
		}
	  },
	  lualine_x = { 'encoding', 'fileformat', 'filetype' },
	  lualine_y = { '' },
	  lualine_z = { 'location', 'searchcount' }
	}
  },
  config = function(_,opts)
	require('lualine').setup(opts)
  end,
},

{
  "stevearc/dressing.nvim",
  opts = {
	input = {
	  relative = "editor",
	},
	select = {
	  backend = { "telescope", "fzf", "builtin" },
	  telescope = {
		prefer_width = { 0.9 },
		width = { 0.9 }
	  },
	  fzf = {
		prefer_width = { 0.9 },
		width = { 0.9 }
	  },
	  builtin = {
		prefer_width = { 0.9 },
		width = { 0.9 }
	  },
	},
  },
  config = function(_,opts)
	require('dressing').setup(opts)
  end,
},
}
