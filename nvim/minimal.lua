local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/minimal_pack/minimal_packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require("packer").startup {
  function(use)
    use { 'wbthomason/packer.nvim' }

    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons'},
      config = function()
        require 'nvim-tree'.setup {
          disable_netrw = false,
          hijack_netrw  = true,
        }
      end
    }

    use { "Pocco81/auto-save.nvim" }
    -- use { "/Users/dimas.kotvan/Opensource/auto-save.nvim" }
  end,
  config = {
    plugin_package = 'minimal-packer',
    compile_path = vim.fn.stdpath('config')..'/plugin/minimal_packer_compiled.lua',
    log = { level = 'info' },
    autoremove = true,
  },
}
