local autosave = require("auto-save")

local function has_value (tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

autosave.setup({
  enabled = true,
  execution_message = {
    dim = 0,
  },
  trigger_events = { "InsertLeave", "TextChanged" },
  condition = function(buf)
    local fn = vim.fn
    -- local utils = require("auto-save.utils.data")
    --     utils._in(fn.getbufvar(buf, "&filetype"), { "go" }) then

    if fn.getbufvar(buf, "&modifiable") == 1 then
      return true
    end
    return false
  end,
  write_all_buffers = false,
  debounce_delay = 20000,
  callbacks = { -- functions to be executed at different intervals
    enabling = nil, -- ran when enabling auto-save
    disabling = nil, -- ran when disabling auto-save
    before_asserting_save = nil, -- ran before checking `condition`
    before_saving = nil, -- ran before doing the actual save
    after_saving = nil -- ran after doing the actual save
  }
})

vim.cmd [[
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
]]

local opts = {
  log_level = 'debug',
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
  auto_session_enabled = true,
  auto_session_allowed_dirs = { "$HOME/Projects/", "$HOME/Opensource/", "$HOME/dotfiles/" },
  auto_session_use_git_branch = true,
  cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
    restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
  },
}
require('auto-session').setup(opts)

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
