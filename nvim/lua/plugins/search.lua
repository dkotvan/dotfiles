return {
  {
	"kevinhwang91/nvim-hlslens",
	config = function()
	  require("hlslens").setup({
		calm_down = true,
	  })
	  vim.cmd([[
	  noremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
	  noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
	  noremap * *<Cmd>lua require('hlslens').start()<CR>
	  noremap # #<Cmd>lua require('hlslens').start()<CR>
	  noremap g* g*<Cmd>lua require('hlslens').start()<CR>
	  noremap g# g#<Cmd>lua require('hlslens').start()<CR>
	  ]])
	end,
  },

  {
	"windwp/nvim-spectre",
	dependecies = { 'nvim-lua/plenary.nvim' },
	keys = {
	  {
		"<leader>G",
		function()
		  require('spectre').open()
		end,
		desc = "search and replace using spectre",
	  },
	},

	config = function()
	  require("spectre").setup({
		open_cmd = "new",
		find_engine = {
		  ["ag"] = {
			cmd = "ag",
			args = {
			  "--vimgrep",
			  "-s",
			  "--depth=35"
			},
			options = {
			  ["ignore-case"] = {
				value = "-i",
				icon = "[I]",
				desc = "ignore case",
			  },
			  ["hidden"] = {
				value = "--hidden",
				desc = "hidden file",
				icon = "[H]",
			  },
			},
		  },
		},
		replace_engine = {
		  ["sed"] = {
			cmd = "sed",
			args = nil,
		  },
		  options = {
			["ignore-case"] = {
			  value = "--ignore-case",
			  icon = "[I]",
			  desc = "ignore case",
			},
		  },
		},
		default = {
		  find = {
			cmd = "ag",
			options = { "ignore-case" },
		  },
		  replace = {
			cmd = "sed",
		  },
		},
	  })
	end,
  },

}
