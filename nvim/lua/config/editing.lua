local autosave = require("auto-save")

autosave.setup({
  enabled = true,
  execution_message = {
    dim = 0,
  },
  trigger_events = { "InsertLeave", "TextChanged" },
	condition = function(buf)
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if
			fn.getbufvar(buf, "&modifiable") == 1 and
			utils.not_in(fn.getbufvar(buf, "&filetype"), {"go"}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,
  write_all_buffers = false,
  debounce_delay = 20000,
  callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    after_saving = nil -- ran after doing the actual savey
  }
})

vim.cmd [[
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
]]

require('nvim-treesitter.configs').setup {
    textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = { 'textsubjects-container-outer', desc = "Select outside containers (classes, functions, etc.)" },
            ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
        },
    },
}

require('mini.ai').setup(-- No need to copy this inside `setup()`. Will be used automatically.
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
