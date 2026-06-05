local M = {}

function M.yank_with_path(absolute)
  local s     = vim.fn.line("'<")
  local e     = vim.fn.line("'>")
  local lines = vim.fn.getline(s, e)
  local path  = absolute and vim.fn.expand("%:p") or vim.fn.expand("%:.")
  table.insert(lines, 1, string.format("%s:%d-%d", path, s, e))
  vim.fn.setreg("+", table.concat(lines, "\n"))
  vim.notify("Yanked: " .. path .. ":" .. s .. "-" .. e)
end

return M
