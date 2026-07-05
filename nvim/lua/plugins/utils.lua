return {
	-- Sudo that works with neovim
	-- SudaRead / SudaWrite
	"lambdalisue/suda.vim",
	--  {
	-- "jellydn/hurl.nvim",
	-- dependencies = { "MunifTanjim/nui.nvim" },
	-- ft = "hurl",
	-- opts = {
	--   -- Show debugging info
	--   debug = false,
	--   -- Show notification on run
	--   show_notification = false,
	--   -- Show response in popup or split
	--   mode = "split",
	--   -- Default formatter
	--   formatters = {
	-- 	json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
	--   },
	-- },
	-- keys = {
	--   -- Run API request
	--   { "<leader>A",  "<cmd>HurlRunner<CR>",        desc = "HURL: Run All requests" },
	--   { "<leader>a",  "<cmd>HurlRunnerAt<CR>",      desc = "HURL: Run Api request" },
	--   { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "HURL: Run Api request to entry" },
	--   { "<leader>tm", "<cmd>HurlToggleMode<CR>",    desc = "HURL: Hurl Toggle Mode" },
	--   { "<leader>tv", "<cmd>HurlVerbose<CR>",       desc = "HURL: Run Api in verbose mode" },
	--   -- Run Hurl request in visual mode
	--   { "<leader>h",  ":HurlRunner<CR>",            desc = "HURL: Hurl Runner",             mode = "v" },
	-- },
	--  },

	{
		"airblade/vim-rooter",
		config = function()
			vim.g.rooter_patterns = { "_git/", "go.mod" }
			vim.g.rooter_cd_cmd = "tcd" -- change the location of the tab
		end,
	},

	{
		"klen/nvim-config-local",
		config = function()
			require("config-local").setup({
				-- Default configuration (optional)
				config_files = { ".vimrc.lua", ".vimrc" },      -- Config file patterns to load (lua supported)
				hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
				autocommands_create = true,                     -- Create autocommands (VimEnter, DirectoryChanged)
				commands_create = true,                         -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
				silent = false,                                 -- Disable plugin messages (Config loaded/ignored)
				lookup_parents = false,                         -- Lookup config files in parent directories
			})
		end,
	},

	-- BW kill buffer without closing window, BUN, BD, BW, BB, BF
	{
		"qpkorr/vim-bufkill",
		config = function()
			vim.g.BufKillCreateMappings = 0
		end,
	},

	"tpope/vim-eunuch",

	-- MakeTable! -> csv to markdown table
	-- UnmakeTable  -> markdown to csv
	"mattn/vim-maketable",

	-- compare directories
	{
		"will133/vim-dirdiff",
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "DirDiff",
				callback = function()
					-- vim-dirdiff uses <LocalLeader> (defaults to \)
					-- built-in mappings inside the DirDiff listing:
					--   <LocalLeader>j  → next diff group
					--   <LocalLeader>k  → prev diff group
					--   <LocalLeader>g  → diffget
					--   <LocalLeader>p  → diffput
					--   Enter / o        → open diff for file under cursor
					--   s                → sync (refresh listing)
					--
					-- Inside an opened diff (standard vim diff mode):
					--   ]c → next hunk,  [c → prev hunk
					--   do → diff obtain, dp → diff put
				end,
			})
		end,
	},

	-- kill all buffers except the current
	"duff/vim-bufonly",

	"AndrewRadev/linediff.vim",

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	--  {
	-- 'cnshsliu/smp.nvim',
	-- build = "cd lua/server && npm install", -- yes, we should have node & npm installed.
	-- dependencies = {
	--   "nvim-telescope/telescope.nvim",
	--   "MunifTanjim/nui.nvim",
	-- },
	-- },

  {
    "diogo464/hotreload.nvim",
    opts = { silent = true },
  },

}
