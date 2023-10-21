vim.g.mapleader = ','

function isVsCode()
  return vim.env.FORCE_VSCODE == 'true' or vim.fn.exists("g:vscode") == 1
end

if isVsCode() then
  require('vscode/options')
  require('vscode/plugins')
  require('vscode/keys')
else
  require('options')
  require('plugins-lazy')
  require('config/ui')

  require('config.code')
  require('config.completion')
  require('config.finder')
  require('config.debug')
  require('config.editing')
  require('config.keys')
  require('config.zettelkasten')
end
