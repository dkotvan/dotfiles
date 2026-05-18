local _image_exts = { png=1, jpg=1, jpeg=1, gif=1, webp=1, svg=1, bmp=1, ico=1, tiff=1, avif=1 }
local _current_image = nil

local function image_file_previewer(opts)
	local previewers = require("telescope.previewers")
	local conf = require("telescope.config").values
	return previewers.new_buffer_previewer({
		title = "Preview",
		define_preview = function(self, entry, status)
			local path = entry.path or entry.filename
			if not path then return end
			local ext = (path:match("%.([^.]+)$") or ""):lower()
			if _image_exts[ext] then
				if _current_image then _current_image:clear(); _current_image = nil end
				vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, { "" })
				vim.schedule(function()
					if not vim.api.nvim_buf_is_valid(self.state.bufnr) then return end
					if not vim.api.nvim_win_is_valid(status.preview_win) then return end
					local ok, image_api = pcall(require, "image")
					if not ok then return end
					local w = vim.api.nvim_win_get_width(status.preview_win)
					local h = vim.api.nvim_win_get_height(status.preview_win)
					_current_image = image_api.from_file(path, {
						window = status.preview_win,
						buffer = self.state.bufnr,
						with_virtual_padding = true,
						x = 0, y = 0,
						width = w, height = h,
					})
					if _current_image then _current_image:render() end
				end)
			else
				if _current_image then _current_image:clear(); _current_image = nil end
				conf.buffer_previewer_maker(path, self.state.bufnr, {
					bufname = self.state.bufname,
					winid = status.preview_win,
					callback = function() end,
					ft = entry.ft,
				})
			end
		end,
	})
end

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
					file_previewer = image_file_previewer,
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
						ignore_patterns = {
							"*.git/*", "*build/*", "*debug/*",
							"*.class", "*~", "~:", "*.jar", "*.node", "*.lock",
							"*.gz", "*.zip", "*.7z", "*.rar", "*.lzma", "*.bz2",
							"*.rlib", "*.rmeta", "*.DS_Store",
							"*.ttf", "*.otf", "*.woff*", "*.sfd", "*.pcf",
							"*.ser", "*.wasm", "*.pack", "*.pyc",
							"*.apk", "*.bin", "*.dll", "*.pdb", "*.db", "*.so",
							"*.spl", "*.min.js", "*.min.gzip.js",
							"*.doc", "*.ppt", "*.xls", "*.swp", "*.bak", "*.ctags",
						},
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