vim.g.mapleader = ','

local ok, err = pcall(require, 'impatient')

if ok then
  require('impatient').enable_profile()
else
  print(('impatient not installed\n%s'):format(err))
end

require('vscode/options')
require('vscode/plugins')
require('vscode/keys')
