return {
  {
	"abecodes/tabout.nvim",
	lazy = false,
	config = function()
	  require("tabout").setup({
		tabkey = "",
		backwards_tabkey = "",
	  })
	end,
  },

  {
	-- Auto pairs
	"windwp/nvim-autopairs",
	config = function()
	  local npairs = require("nvim-autopairs")

	  npairs.setup({
		check_ts = true,
		ts_config = {
		  lua = { 'string' }, -- it will not add pair on that treesitter node
		  javascript = { 'template_string' },
		  java = false,       -- don't check treesitter on java
		}
	  })
	end,
  },

  {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
	  require("nvim-surround").setup({
		-- Configuration here, or leave empty to use defaults
	  })
	end
  },

  -- align text by character -> gl and gL
  "tommcdo/vim-lion",

  -- swap text - cx, cxx, X (visual mode)
  "tommcdo/vim-exchange",

  -- good text objects
  {
	'echasnovski/mini.ai',     version = false,
	config = function()
	  require('mini.ai').setup(
	  {
		-- Table with textobject id as fields, textobject specification as values.
		-- Also use this to disable builtin textobjects. See |MiniAi.config|.
		custom_textobjects = nil,

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
		  -- Main textobject prefixes
		  around = 'a',
		  inside = 'i',

		  -- Next/last variants
		  around_next = 'an',
		  inside_next = 'in',
		  around_last = 'al',
		  inside_last = 'il',

		  -- Move cursor to corresponding edge of `a` textobject
		  goto_left = 'g[',
		  goto_right = 'g]',
		},

		-- Number of lines within which textobject is searched
		n_lines = 50,

		-- How to search for object (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
		search_method = 'cover_or_next',

		-- Whether to disable showing non-error feedback
		silent = false,
	  })
	end,
  },

  -- textobject ae | ie
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },

  -- textobject al | il
  { "kana/vim-textobj-line",   dependencies = { "kana/vim-textobj-user" } },

  -- textobject ai | ii
  { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" } },

  -- textobject ig | ]g [g
  "andrewferrier/textobj-diagnostic.nvim",

  -- :%S - replace text preserving case
  {
	"tpope/vim-abolish",
	dependencies = "tpope/vim-repeat",
  },

  {
	"JoosepAlviste/nvim-ts-context-commentstring",
	lazy = true,
	opts = {
	  enable_autocmd = false,
	},
  },

  {
	"echasnovski/mini.comment",
	event = "VeryLazy",
	opts = {
	  options = {
		custom_commentstring = function()
		  return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end,
	  },
	},
  },

  {
    "hat0uma/csvview.nvim",
	ft = { "csv", "tsv" },
	opts = {
	  keymaps = {
		-- Navigation
		jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
		jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
		jump_next_row = { "<Enter>", mode = { "n", "v" } },
		jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		-- Text objects
		textobject_field_inner = { "if", mode = { "o", "x" } },
		textobject_field_outer = { "af", mode = { "o", "x" } },
	  },
	},
  },

  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    event   = { "InsertLeave", "TextChanged" },
    opts = {
      trigger_events = {
        immediate_save       = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" },
        defer_save           = { "InsertLeave", "TextChanged" },
        cancel_deferred_save = { "InsertEnter" },
      },
      debounce_delay    = 1000,
      write_all_buffers = false,
      condition = function(buf)
        if vim.fn.getbufvar(buf, "&buftype") ~= "" then return false end
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match("%(proposed%)") or name:match("%(NEW FILE") then return false end
        if vim.b[buf].claudecode_diff_tab_name
          or vim.b[buf].claudecode_diff_new_win
          or vim.b[buf].claudecode_diff_target_win
        then return false end
        return true
      end,
    },
    config = function(_, opts)
      local as = require("auto-save")
      as.setup(opts)
      vim.keymap.set("n", "<leader>ua", function()
        if as.enabled() then as.off() else as.on() end
        vim.notify("AutoSave: " .. (as.enabled() and "ON" or "OFF"))
      end, { desc = "Toggle auto-save" })
    end,
  },

}
