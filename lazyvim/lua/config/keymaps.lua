-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- return ig is runniong isnide vscode
if vim.g.vscode then
  return
end

local fzf = require("fzf-lua")
local builtin = require("fzf-lua.previewer.builtin")

local MyPreviewer = builtin.buffer_or_file:extend()

function MyPreviewer:new(o, opts, fzf_win)
  MyPreviewer.super.new(self, o, opts, fzf_win)
  setmetatable(self, MyPreviewer)
  return self
end

function MyPreviewer:populate_preview_buf(entry_str)
  if entry_str == nil then
    return
  end

  local type, file = entry_str:match("^%[(%w+)%]%s+(.+)$")

  if type == "Git" then
    local git_status_cmd = "git status --porcelain -- " .. file
    local handle = io.popen(git_status_cmd)
    local git_diff_cmd = ""
    if handle then
      local status_line = handle:read("*l") -- Read first line
      handle:close()

      if status_line then
        local status = status_line:match("^([^#$%s]+)%s+(.*)$")
        if status and status == "??" then
          git_diff_cmd = "git diff --no-color --no-index /dev/null " .. file
        else
          git_diff_cmd = "git diff --no-color HEAD -- " .. file
        end
      end
    end
    if git_diff_cmd ~= "" then
      -- Alternative approach: use a shell command through Lua
      local cmd_output = vim.fn.system(git_diff_cmd)

      local diff_lines = {}
      for line in string.gmatch(cmd_output, "[^\r\n]+") do
        table.insert(diff_lines, line)
      end

      local tmpbuf = self:get_tmp_buffer()
      vim.api.nvim_buf_set_lines(tmpbuf, 0, -1, false, diff_lines)
      vim.api.nvim_buf_set_option(tmpbuf, "filetype", "diff")

      self:set_preview_buf(tmpbuf)
    end
  else
    MyPreviewer.super.populate_preview_buf(self, file)
  end
end

-- define your custom commands here:
local custom_cmds = {
  {
    desc = "Git push",
    cmd = ":!git push",
  },
  {
    desc = "Git push force",
    cmd = ":!git push --force",
  },
}

-- Combined picker for buffers, git files and regular files
local function files_picker()
  -- Create a table to track added files to prevent duplicates
  local added_files = {}

  fzf.fzf_exec(function(fzf_cb)
    local git_cmd = "git ls-files --modified --others --exclude-standard 2>/dev/null"
    local handle = io.popen(git_cmd)
    if handle then
      for file in handle:lines() do
        if not added_files[file] then
          fzf_cb(("[Git] %s"):format(file))
          added_files[file] = true
        end
      end
      handle:close()
    end

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
        local filename = vim.api.nvim_buf_get_name(buf)
        if filename and filename ~= "" then
          local relative_path = vim.fn.fnamemodify(filename, ":.")
          if not added_files[relative_path] then
            fzf_cb(("[Buf] %s"):format(relative_path))
            added_files[relative_path] = true
          end
        end
      end
    end

    local file_cmd
    if vim.fn.executable("fd") == 1 then
      file_cmd = "fd --type f --hidden --follow --exclude .git"
    elseif vim.fn.executable("find") == 1 then
      file_cmd = [[find . -type f -not -path "*/\.git/*" | sed 's/^\.\///g']]
    end

    if file_cmd then
      local handle_files = io.popen(file_cmd)
      if handle_files then
        for file in handle_files:lines() do
          if not added_files[file] then
            fzf_cb(("[File] %s"):format(file))
            added_files[file] = true
          end
        end
        handle_files:close()
      end
    end

    fzf_cb(nil)
  end, {
    prompt = "Files❯ ",
    previewer = MyPreviewer,
    previewer_hidden = "nohidden",
    previewer_vertical = "up:60%",
    previewer_wrap = "nowrap",
    previewer_title = false,
    previewer_ansi = true,

    actions = {
      ["default"] = function(selected)
        if not selected or not selected[1] then
          return
        end

        local type, file = selected[1]:match("^%[(%w+)%]%s+(.+)$")

        if not file then
          return
        end

        if type == "File" or type == "Git" then
          vim.cmd("edit " .. vim.fn.fnameescape(file))
        elseif type == "Buf" then
          vim.cmd("buffer " .. vim.fn.fnameescape(file))
        end
      end,
    },
  })
end

-- Commands and keymaps picker
local function commands_picker()
  -- Use a dynamic provider to return all items in one view
  fzf.fzf_exec(function(fzf_cb)
    -- 1. Get keymaps
    local modes = { "n", "v", "x", "s", "o", "i", "c", "t" }
    for _, mode in ipairs(modes) do
      local keymaps = vim.api.nvim_get_keymap(mode)
      for _, keymap in ipairs(keymaps) do
        if keymap.desc and keymap.desc ~= "" then
          fzf_cb(("[Key]  %s %s → %s"):format(mode, keymap.lhs, keymap.desc))
        end
      end
    end

    -- 2. Get commands
    local commands = vim.api.nvim_get_commands({})
    for cmd_name, _ in pairs(commands) do
      fzf_cb(("[Cmd]  %s"):format(cmd_name))
    end

    -- 3. Add custom commands
    for _, cc in ipairs(custom_cmds) do
      fzf_cb(("[Custom] %s"):format(cc.desc))
    end

    -- 4. Get tmux sessions and windows if tmux is available
    if vim.fn.executable("tmux") == 1 then
      local tmux_sessions_cmd = "tmux list-sessions -F '#{session_name}'"
      local handle = io.popen(tmux_sessions_cmd)
      if handle then
        for session in handle:lines() do
          fzf_cb(("[Tmux] Session: %s"):format(session))
        end
        handle:close()
      end

      local tmux_windows_cmd = "tmux list-windows -a -F '#{session_name}:#{window_index} #{window_name}'"
      handle = io.popen(tmux_windows_cmd)
      if handle then
        for window in handle:lines() do
          fzf_cb(("[Tmux] Window: %s"):format(window))
        end
        handle:close()
      end
    end

    fzf_cb(nil) -- Signal end of input
  end, {
    prompt = "Commands❯ ",
    previewer = false,
    actions = {
      ["default"] = function(selected)
        -- Extract the command from the selected item
        local cmd = selected[1]
        if cmd:match("^%[Key%]") then
          -- Extract the key sequence and execute it
          local key = cmd:match("^%[Key%]%s+%w+%s+(.+)%s+→")
          if key then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
          end
        elseif cmd:match("^%[Cmd%]") then
          cmd = cmd:match("^%[Cmd%]%s+(.+)$")
          vim.cmd(cmd)
        elseif cmd:match("^%[Custom%]") then
          -- Find the matching custom command
          for _, cc in ipairs(custom_cmds) do
            if cmd:match(cc.desc) then
              cmd = cc.cmd
              break
            end
          end
          vim.cmd(cmd)
        elseif cmd:match("^%[Tmux%]") then
          -- Handle tmux session/window selection
          if cmd:match("Session:") then
            local session = cmd:match("Session:%s+(.+)$")
            if session then
              vim.fn.system("tmux switch-client -t " .. session)
            end
          elseif cmd:match("Window:") then
            local window = cmd:match("Window:%s+(.+)$")
            if window and window:match("^[%w-_]+:[%d]+") then
              local session_window = window:match("^([%w-_]+:[%d]+)")
              vim.fn.system("tmux select-window -t " .. session_window)
            end
          end
        end
      end,
    },
  })
end

-- Bind keymaps as requested
vim.keymap.set("n", "<leader>p", files_picker, {
  desc = " Find Files (Buf/Git/All)",
})
vim.keymap.set("n", "<leader>k", commands_picker, {
  desc = " Find Commands/Keys/Tmux",
})

vim.keymap.set("v", "<CR>", '"+y')
