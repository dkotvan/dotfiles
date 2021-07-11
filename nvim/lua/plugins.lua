-- install packer if is not here
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require("packer").startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- UI plugins
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.g.indent_blankline_use_treesitter = true
      end
    }

    use {'ojroques/nvim-hardline'}

    use {
      'adisen99/codeschool.nvim',
      requires = {'rktjmp/lush.nvim'},
      config = function()
        vim.g.codeschool_contrast_dark = 'medium'
      end
    }

    use {
      'yamatsum/nvim-cursorline'
    }

    -- Auto complete

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'onsails/lspkind-nvim'

    -- Snippets
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    use 'hrsh7th/nvim-compe'

    -- External sources

    use 'andersevenrud/compe-tmux'
    use {
      'tamago324/compe-zsh',
      requires = {'nvim-lua/plenary.nvim'}
    }
    use 'GoldsteinE/compe-latex-symbols'

    -- Telescope

    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    -- File explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Stuff
    use {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('rest-nvim').setup()
      end
    }

    use 'wellle/targets.vim'
    -- Insert end automatically
    use 'tpope/vim-endwise'
    -- allow to create your own text object
    use 'kana/vim-textobj-user'
    -- Editor config
    use {
      'editorconfig/editorconfig-vim',
      config = function()
        vim.g.EditorConfig_exclude_patterns = {{'fugitive://.*'}, {'scp://.*'}}
      end
    }
    use 'haya14busa/is.vim'
    -- git gutter like but with async support
    use {
      'mhinz/vim-signify',
      config = function()
        vim.g.signify_realtime = 1
        vim.g.signify_line_highlight = 0
        vim.g.signify_vcs_list = {'git'}
      end
    }

    -- best git plugin
    use 'tpope/vim-fugitive'
    -- Gbrowse open browser in Bitbucket too
    use 'tommcdo/vim-fubitive'
    -- Gbrowse open browser in Gitlab. use lab command
    use 'shumphrey/fugitive-gitlab.vim'
    -- Show popup with commit of the current line
    use 'rhysd/git-messenger.vim'
    -- BW kill buffer without closing window, BUN, BD, BW, BB, BF
    use 'qpkorr/vim-bufkill'
    -- Now vim recognize line numbers on errors - open files like /a.txt:20:5
    use 'wsdjeg/vim-fetch'
    -- Sudo that works with neovim
    use 'lambdalisue/suda.vim'
    -- Open external browsers
    use 'tyru/open-browser.vim'
    -- Asynchronous tag generation
    use 'ludovicchabant/vim-gutentags'
    -- MakeTable! -> csv to markdown table
    -- UnmakeTable  -> markdown to csv
    use 'mattn/vim-maketable'
  end
}
