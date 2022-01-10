local autosave = require("autosave")

autosave.setup({
  enabled = true,
  execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
  events = {"TextChangedI", "TextChanged"},
  conditions = {
    exists = false,
    filetype_is_not = {'go'},
    modifiable = true
  },
  write_all_buffers = false,
  on_off_commands = true,
  clean_command_line_interval = 2000,
  debounce_delay = 10000
})

-- autosave.hook_after_saving = function ()
--    if (vim.bo.filetype == 'go') then
--      require('go.format').gofmt()
--      -- require('go.format').goimport()
--    end
-- end
