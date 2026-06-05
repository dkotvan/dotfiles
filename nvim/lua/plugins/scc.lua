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
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()

      local watcher = (vim.uv or vim.loop).new_fs_event()

      local function refresh_diffview()
        local ok, api = pcall(require, "diffview.lib")
        if not ok then return end
        local view = api.get_current_view()
        if view then view:update_files() end
      end

      watcher:start(vim.fn.getcwd(), { recursive = true }, vim.schedule_wrap(function(err, fname)
        if err or not fname then return end
        if not fname:match("node_modules") and not fname:match("%.git/objects") then
          refresh_diffview()
        end
      end))
    end,
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

  {
	"junegunn/gv.vim"
  }
}
