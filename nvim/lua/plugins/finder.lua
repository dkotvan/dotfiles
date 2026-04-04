return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		keys = {
			{
				"<leader>gh",
				'<cmd>lua require("telescope.builtin").help_tags()<cr>',
				desc = "search help tags",
			},
			{
				"<leader>gb",
				'<cmd>lua require("telescope.builtin").git_branches()<cr>',
				desc = "show git branches",
			},
			{
				"<leader>gl",
				'<cmd>lua require("telescope.builtin").live_grep()<cr>',
				desc = "show git branches",
			},
		},
		config = function()
			require('telescope').setup {
				defaults = {
					vimgrep_arguments = {
						'ag',
						'-i',
						'--vimgrep',
						'--hidden',
						'--line-number',
						'--column'
					}
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type=file", "--hidden", "--follow", "--exclude=.git" }
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					smart_open = {
						match_algorithm = "fzf",
					},
					undo = {
						use_delta = true,
						use_custom_command = nil,
						side_by_side = true,
						layout_config = {
							preview_height = 0.8,
						},
						vim_diff_opts = { ctxlen = 0 },
						entry_format = "state #$ID, $STAT, $TIME",
						time_format = "",
						mappings = {
							i = {
								["<cr>"] = require("telescope-undo.actions").yank_additions,
								["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
								["<C-cr>"] = require("telescope-undo.actions").restore,
							},
						},
					},
				},
			}
			require('telescope').load_extension("fzf")
			require("telescope").load_extension("smart_open")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("advanced_git_search")
			require('telescope').load_extension('goimpl')
		end
	},

	{
		"edolphin-ydf/goimpl.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-treesitter/nvim-treesitter',
		},
		keys = {
			{
				"<space>ci",
				function()
					require 'telescope'.extensions.goimpl.goimpl {}
				end,
				desc = "goimpl generate stub implementation for interfaces"
			},
		},
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	{
		"debugloop/telescope-undo.nvim",
		keys = {
			{
				"<leader>u",
				"<cmd>Telescope undo<cr>",
				desc = "undo history",
			},
		},
	},

	{
		"danielfalk/smart-open.nvim",
		branch = "0.2.x",
		config = function()
		end,
		dependencies = {
			"kkharji/sqlite.lua",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		keys = {
			{
				"<C-P>",
				function()
					require('telescope').extensions.smart_open.smart_open({ cwd_only = true })
				end,
				mode = { 'n' },
				desc = 'find files using telescope'
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{
				"<leader>F",
				'<cmd>NvimTreeFindFile<cr>',
				mode = { 'n' },
				desc = 'open current file in NvimTree'
			},
			{
				"<leader>f",
				'<cmd>NvimTreeToggle<cr>',
				mode = { 'n' },
				desc = 'toggle NvimTree'
			},
		},
		config = function()
			require("nvim-tree").setup({
				disable_netrw = false,
				hijack_netrw = true,
				view = {
					preserve_window_proportions = false,
				},
			})
		end,
	},
}