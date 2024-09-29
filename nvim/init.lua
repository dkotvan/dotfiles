-- Set leader key to space
vim.g.mapleader = ','

if not vim.g.vscode then
  require('loader')
end
require('options')
