-- local autosave = require("auto-save")

-- autosave.setup({
--   enabled = true,
--   execution_message = {
--     dim = 0,
--   },
--   trigger_events = { "InsertLeave", "TextChanged" },
--   condition = function(buf)
--     local fn = vim.fn
--     local utils = require("auto-save.utils.data")

--     if fn.getbufvar(buf, "&modifiable") == 1 or
--         utils.not_in(fn.getbufvar(buf, "&filetype"), { "go" }) then
--       return true
--     end
--     return false
--   end,
--   write_all_buffers = false,
--   debounce_delay = 20000,
--   callbacks = { -- functions to be executed at different intervals
--     enabling = nil, -- ran when enabling auto-save
--     disabling = nil, -- ran when disabling auto-save
--     before_asserting_save = nil, -- ran before checking `condition`
--     before_saving = nil, -- ran before doing the actual save
--     after_saving = nil -- ran after doing the actual save
--   }
-- })

vim.cmd [[
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
]]
