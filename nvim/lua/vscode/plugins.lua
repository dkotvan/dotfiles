-- install packer if is not here
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/neovim-pack/packer-vscode/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require("packer").startup {
  function(use)
    -------------------------------------------------------------
    -- Plugins loaded in both native and vscode
    -------------------------------------------------------------

    -- Packer can manage itself
    use {
      'wbthomason/packer.nvim',
    }

    use { 'lewis6991/impatient.nvim' }

    -- add new targets and make it seek the operator in the line
    use 'wellle/targets.vim'

    -- allow to create your own text object
    use 'kana/vim-textobj-user'

    -- Asynchronous tag generation
    use 'ludovicchabant/vim-gutentags'

    -- MakeTable! -> csv to markdown table
    -- UnmakeTable  -> markdown to csv
    use 'mattn/vim-maketable'

    -- textobject ar | ir
    use {
      'nelstrom/vim-textobj-rubyblock',
      ft = {'ruby'}
    }

    -- textobject ae | ie
    use 'kana/vim-textobj-entire'

    -- textobject al | il
    use 'kana/vim-textobj-line'

    -- textobject ai | ii
    use 'kana/vim-textobj-indent'

    -- textobject ig | ]g [g
    use 'andrewferrier/textobj-diagnostic.nvim'

    -- align text by character -> gl and gL
    use 'tommcdo/vim-lion'

    -- align text - here because i can use the command Table in plasticboy/markdown
    use 'godlygeek/tabular'

    -- swap text - cx, cxx, X (visual mode)
    use 'tommcdo/vim-exchange'

    -- :%S - replace text preserving case
    use {
      'tpope/vim-abolish',
      requires = 'tpope/vim-repeat'
    }

    use {
      'tpope/vim-surround',
      requires = 'tpope/vim-repeat'
    }
  end,
  config = {
    plugin_package = 'vscode-packer',
    compile_path = vim.fn.stdpath('config')..'/plugin/vscode_packer_compiled.lua',
    log = { level = 'info' },
    autoremove = true,

  },
}


