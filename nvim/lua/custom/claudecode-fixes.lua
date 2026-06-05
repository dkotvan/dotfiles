local M = {}

local function get_open_buf_paths()
  local paths, seen = {}, {}

  local jumps = unpack(vim.fn.getjumplist())
  for i = #jumps, 1, -1 do
    local nr = jumps[i].bufnr
    if nr and vim.api.nvim_buf_is_valid(nr) and vim.bo[nr].buflisted and vim.bo[nr].buftype == "" then
      local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(nr), ":.")
      if rel ~= "" and not seen[rel] then seen[rel] = true; table.insert(paths, rel) end
    end
  end

  for _, nr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(nr) and vim.bo[nr].buflisted and vim.bo[nr].buftype == "" then
      local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(nr), ":.")
      if rel ~= "" and not seen[rel] then seen[rel] = true; table.insert(paths, rel) end
    end
  end

  return paths, seen
end

function M.claude_at_picker()
  local fzf = require("fzf-lua")
  local open_paths, open_set = get_open_buf_paths()

  fzf.fzf_exec(function(cb)
    for _, path in ipairs(open_paths) do
      cb("\27[36m[buf]\27[0m " .. path)
    end
    for _, f in ipairs(vim.fn.systemlist("git ls-files 2>/dev/null")) do
      if not open_set[f] then cb(f) end
    end
    cb()
  end, {
    prompt   = "Claude @ > ",
    fzf_opts = { ["--multi"] = "", ["--ansi"] = "" },
    actions  = {
      ["default"] = function(selected)
        for _, item in ipairs(selected) do
          local path = item:gsub("\27%[[%d;]*m", ""):gsub("^%[buf%]%s+", "")
          vim.cmd("ClaudeCodeAdd " .. vim.fn.fnameescape(path))
        end
        vim.cmd("ClaudeCodeFocus")
      end,
      ["ctrl-e"] = function(selected)
        if selected[1] then
          local path = selected[1]:gsub("\27%[[%d;]*m", ""):gsub("^%[buf%]%s+", "")
          vim.cmd("edit " .. vim.fn.fnameescape(path))
        end
      end,
    },
  })
end

-- Light blue visual selection inside Claude terminal buffers
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname:find("snacks") or bufname:find("claude", 1, true) then
      vim.api.nvim_set_hl(0, "Visual", { bg = "#83a598" })
    end
  end,
})

return M
