return {
  {
	"lewis6991/gitsigns.nvim",
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
	  require("gitsigns").setup({
		current_line_blame = true,
	  })
	end,
  },

  {
	"sindrets/diffview.nvim", -- TODO: review config
  },

  -- best git plugin
  "tpope/vim-fugitive",

  -- Gbrowse open browser in Bitbucket too
  "tommcdo/vim-fubitive",

  -- Gbrowse open browser in Github too
  "tpope/vim-rhubarb",

  -- Gbrowse open browser in Gitlab. use lab command
  {
	"shumphrey/fugitive-gitlab.vim",
	config = function()
	  vim.cmd([[ let g:fugitive_gitlab_domains = {'git.ifoodcorp.com.br': "https://code.ifoodcorp.com.br"} ]])
	end,
  },

  {
	"aaronhallaert/advanced-git-search.nvim",
	dependencies = {
	  "nvim-telescope/telescope.nvim",
	  "tpope/vim-fugitive",
	  "tpope/vim-rhubarb",
	  "sindrets/diffview.nvim",
	},
	cmd = { "AdvancedGitSearch" },
	keys = {
	  { 
		"<leader>gg",
		"<cmd>AdvancedGitSearch<cr>",
		desc = "search in git",
	  },
	},
  },
}
