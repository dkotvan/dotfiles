-- ~/.config/nvim/lua/close_buffers.lua
local M = {}

M.close_readonly_unlisted_windows = function()
    local win_ids = vim.api.nvim_tabpage_list_wins(0)  -- get all windows in the current tabpage
    for _, win_id in ipairs(win_ids) do
        local buf = vim.api.nvim_win_get_buf(win_id)
        if not vim.api.nvim_buf_get_option(buf, 'buflisted') then
            vim.api.nvim_buf_delete(buf, {})
        end
    end
end

return M
