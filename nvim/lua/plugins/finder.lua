return {
  {
	"mrjones2014/legendary.nvim",
	dependencies = { "stevearc/dressing.nvim", 'kkharji/sqlite.lua' },
	lazy = false,
	priority = 10000,
	keys = {
	  {
		"<leader><leader>",
		'<cmd>Legendary<cr>',
		mode = { 'n' },
		desc = 'find keymaps and commands with Legendary'
	  }
	},
	config = function()
	  require('legendary').setup({
		include_builtin = true,
		extensions = {
		  lazy_nvim = true,
		  which_key = {
			auto_register = true,
		  },
		  nvim_tree = true,
		  diffview = true,
		},
		include_legendary_cmds = true,
	  })
	  -- TODO: move all comands to each plugin
	  local commands = {
		-- plugin fugitive
		{ ':GV',                            description = '(GV) Git log' },
		{ ':GV!',                           description = '(GV) Git log buffer' },
		{ ':G',                             description = 'Git status' },
		{ ':Git blame',                     description = 'Git blame' },
		{ ':Git! pull',                     description = 'Git pull' },
		{ ':Git! pull --rebase',            description = 'Git pull with rebase' },
		{ ':Git! push',                     description = 'Git push' },
		{ ':Git! push -u origin HEAD',      description = 'Git push new branch' },
		{ ':Git! push --force',             description = 'Git push --force' },
		{ ':Git rebase --interactive ',     description = 'Git rebase iteractive',                      unfinished = true },
		{ ':Git rebase --interactive main', description = 'Git rebase iteractive main' },
		{ 'lua require("spectre").open()',  description = 'spectre search replace' },
		{ ':GoInstallBinaries',             description = 'GoInstallBinaries' },
		{ ':GoUpdateBinaries',              description = 'GoUpdateBinaries' },
		{ ':GoInstallBinary',               description = 'GoInstallBinary',                            unfinished = true },
		{ ':GoUpdateBinary',                description = 'GoUpdateBinary',                             unfinished = true },
		{ ':GoCoverage',                    description = 'GoCoverage',                                 unfinished = true },
		{ ':GoImport',                      description = 'GoImport',                                   unfinished = true },
		{ ':GoBuild',                       description = 'GoBuild',                                    unfinished = true },
		{ ':GoRun',                         description = 'GoRun' },
		{ ':GoRun',                         description = 'GoRun with args',                            unfinished = true },
		{ ':GoStop',                        description = 'GoStop',                                     unfinished = true },
		{ ':GoTest',                        description = 'GoTest',                                     unfinished = true },
		{ ':GoTestFile',                    description = 'GoTestFile' },
		{ ':GoTestFunc',                    description = 'GoTestFunc' },
		{ ':GoAddTest',                     description = 'GoAddTest' },
		{ ':GoFmt',                         description = 'GoFmt' },
		{ ':GoVet',                         description = 'GoVet' },
		{ ':GoCheat',                       description = 'GoCheat',                                    unfinished = true },
		{ ':GoGet',                         description = 'GoGet',                                      unfinished = true },
		{ ':GoDebug',                       description = 'GoDebug' },
		{ ':GoDbgConfig',                   description = 'GoDbgConfig' },
		{ ':GoDbgKeys',                     description = 'GoDbgKeys' },
		{ ':GoDbgStop',                     description = 'GoDbgStop' },
		{ ':GoDbgContinue',                 description = 'GoDbgContinue' },
		{ ':GoCreateLaunch',                description = 'GoCreateLaunch' },
		{ ':GoBreakToggle',                 description = 'GoBreakToggle' },
		{ ':GoBreakSave',                   description = 'GoBreakSave' },
		{ ':GoBreakLoad',                   description = 'GoBreakLoad' },
		{ ':GoEnv',                         description = 'GoEnv',                                      unfinished = true },
		{ ':GoAlt',                         description = 'GoAlt' },
		{ ':GoDoc',                         description = 'GoDoc',                                      unfinished = true },
		{ ':GoMockGen',                     description = 'GoMockGen' },
		{ ':GoPkgOutline',                  description = 'Go Package Outline' },
		{ ':GoToggleInlay',                 description = 'GoToggleInlay' },
		{ ':GoTermClose',                   description = 'GoTermClose' },
		{ ':MakeTable',                     description = 'CSV to markdown table' },
		{ ':UnmakeTable',                   description = 'Markdow table to CSV' },
		{ ':Lazy sync',                     description = 'Lazy: Sync plugins' },
		{ 'lua require("smp").preview()',   description = 'SMP: preview current markdown file' },
		{
		  'lua require("smp").book()',
		  description =
		  'SMP: open the markdown book in a splitted window on right'
		},
		{ 'lua require("smp").expand_snippet()',      description = 'SMP: Expand current snippet in place' },
		{ 'lua require("smp").expand_all_snippets()', description = 'SMP: Expand all snippets in place' },
		{
		  'lua require("smp").breakIfLong()',
		  description =
		  'SMP: Break line length if its too long for easier editting'
		},
		{
		  'lua require("smp").insert_blank_line()',
		  description =
		  'SMP: Insert blank lines between multiple lines of text'
		},
		{ 'lua require("smp").bookthis()',                 description = 'SMP: Show book of this markdown file' },
		{
		  'lua require("smp").search_text()',
		  description =
		  'SMP: Incremental search all markdown files by content'
		},
		{ 'lua require("smp").search_tag()',               description = 'SMP: Incremental search all markdown files by tags' },
		{ 'lua require("smp").insert_toc_here()',          description = 'SMP: Insert TOC here' },
		{ 'lua require("smp").indicator_on()',             description = 'SMP: Show current line indicator in previewer' },
		{ 'lua require("smp").indicator_off()',            description = 'SMP: Dont show line indicator in previewer' },
		{ 'lua require("smp").indicator_as_config()',      description = 'SMP: Show line indicator in previewer as configured' },
		{ 'lua require("smp").wrapwiki_visual()',          description = 'SMP: Wrap selected text into a wiki link' },
		{ 'lua require("smp").wrapwiki_word()',            description = 'SMP: Wrap word under cursor into a wiki link' },
		{ 'lua require("smp").wrapwiki_line()',            description = 'SMP: Wrap current line into a wiki link' },
		{ 'lua require("smp").paste_url()',                description = 'SMP: Paste url from clipboard into a link' },
		{ 'lua require("smp").paste_wiki_word()',          description = 'SMP: Paste word from clipboard into a link' },
		{ 'lua require("smp").open_file_in_this_line()',   description = 'SMP: System open the linked file in this line' },
		{ 'lua require("smp").locate_file_in_this_line()', description = 'SMP: System locate the linked file in this line' },
		{ 'lua require("smp").gotoHeaderFromTocEntry()',   description = 'SMP: Jump to header from TOC entry' },
		{ 'lua require("smp").start()',                    description = 'SMP: Start background server' },
		{ 'lua require("smp").stop()',                     description = 'SMP: Stop background server' },
	  }

	  require('legendary').commands(commands)
	end
  },
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
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			side_by_side = true,
			layout_config = {
			  preview_height = 0.8,
			},
			diff_context_lines = vim.o.scrolloff,
			entry_format = "state #$ID, $STAT, $TIME",
			time_format = "",
			mappings = {
			  i = {
				-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
				-- you want to replicate these defaults and use the following actions. This means
				-- installing as a dependency of telescope in it's `requirements` and loading this
				-- extension from there instead of having the separate plugin definition as outlined
				-- above.
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
	  require('telescope').load_extension('dap')
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
		  require'telescope'.extensions.goimpl.goimpl{}
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
		  preserve_window_proportions = true,
		},
	  })
	end,
  },

}
