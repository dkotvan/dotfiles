return {
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.opt.termguicolors = true
			vim.o.background = "dark"
			vim.cmd('colorscheme gruvbox-material')
		end,
	},
	{ "folke/tokyonight.nvim" },
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 10000,
			set_dark_mode = function()
				vim.opt.background = "dark"
			end,
			set_light_mode = function()
				vim.opt.background = "light"
			end,
		},
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = {
				enabled = true,
				scope = {
					enabled = true,
				},
			},
			picker = { enabled = true },
			dashboard = { enabled = true },
			image = { enabled = true },
		},
		keys = {
			{ "<leader><leader>", function() Snacks.picker.commands() end, desc = "Command Palette" },
		},
	},

	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		opts = {
		},
		config = function(_, opts)
			vim.opt.termguicolors = true
			require('bufferline').setup(opts)
		end,
	},

	{
		"hoob3rt/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
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
		config = function(_, opts)
			require('lualine').setup(opts)
		end,
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
		ft = { "markdown" },
		opts = {
			completions = { lsp = { enabled = true } },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
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
		config = function(_, opts)
			require('dressing').setup(opts)
		end,
	},
}