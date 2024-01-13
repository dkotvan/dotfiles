-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
   -- add new targets and make it seek the operator in the line
   { 'echasnovski/mini.ai', version = false },

   -- textobject ar | ir
   {
     'nelstrom/vim-textobj-rubyblock',
     ft = { 'ruby' }
   },

   -- textobject ae | ie
   { 'kana/vim-textobj-entire', dependencies = { 'kana/vim-textobj-user' } },

   -- textobject al | il
   { 'kana/vim-textobj-line', dependencies = { 'kana/vim-textobj-user' } },

   -- textobject ai | ii
   { 'kana/vim-textobj-indent', dependencies = { 'kana/vim-textobj-user' } },

   -- textobject ig | ]g [g
   'andrewferrier/textobj-diagnostic.nvim',

   -- align text by character -> gl and gL
   'tommcdo/vim-lion',

   -- swap text - cx, cxx, X (visual mode)
   'tommcdo/vim-exchange',

   -- :%S - replace text preserving case
   {
     'tpope/vim-abolish',
     dependencies = 'tpope/vim-repeat'
   },

   -- Comments! gc
   'tpope/vim-commentary',

   'tpope/vim-eunuch',

   {
     'tpope/vim-surround',
     dependencies = 'tpope/vim-repeat'
   },

}, {
  root = vim.fn.stdpath("data") .. "/lazy-vscode",
  lockfile = vim.fn.stdpath("config") .. "/vscode-lazy-lock.json"
})
