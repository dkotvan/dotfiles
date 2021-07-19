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
    use { 'wbthomason/packer.nvim' }

    -- UI plugins
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.g.indent_blankline_use_treesitter = true
      end
    }

    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
      'adisen99/codeschool.nvim',
      requires = {'rktjmp/lush.nvim'},

      config = function()
        vim.g.codeschool_contrast_dark = 'hard'
      end
    }

    use {
      "sainnhe/gruvbox-material",
      config = function()
        vim.g.gruvbox_material_background = 'dark'
      end
    }

    use {
      'norcalli/nvim-colorizer.lua'
    }

    use 'tversteeg/registers.nvim'

    --  JqxList and JqxQuery command
    use 'gennaro-tedesco/nvim-jqx'

    -- treesiter
    
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {'nvim-treesitter/playground'}
    -- LSP

    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'glepnir/lspsaga.nvim'

    -- Auto complete

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
      'nvim-lua/plenary.nvim',
      branch='async_jobs_v2'
    }
    
    use {
      'nvim-telescope/telescope.nvim',
      branch = 'async_v2',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim', branch='async_jobs_v2'}}
    }

    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Stuff
    use {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('rest-nvim').setup()
      end
    }

    -- Edit & motion plugins

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

    -- Blame line
    use 'tveskag/nvim-blame-line'

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
    --
    -- Open external browsers
    use 'tyru/open-browser.vim'
    --
    -- Asynchronous tag generation
    use 'ludovicchabant/vim-gutentags'
    --
    -- MakeTable! -> csv to markdown table
    -- UnmakeTable  -> markdown to csv
    use 'mattn/vim-maketable'

    use {
      'tpope/vim-bundler',
      ft = {'ruby'}
    }

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

    -- better f, F, t and T - highlight the  first letters
    use 'deris/vim-shot-f'

    -- Comments! gc
    use 'tpope/vim-commentary'

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

    -- compare directories
    use 'vim-scripts/dirdiff.vim'

    -- kill all buffers except the current
    use 'duff/vim-bufonly'

    use 'AndrewRadev/linediff.vim'

    -- A fast git commit browser
    use 'junegunn/gv.vim'

    use {
      'tpope/vim-eunuch'
    }

    use {
      'tpope/vim-surround',
      requires = 'tpope/vim-repeat'
    }

    -- Show the searches
    use {
      'osyo-manga/vim-anzu',
      config = function()
        vim.cmd [[
        map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
        map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo) 
        ]]
      end
    }

    use {
      'plasticboy/vim-markdown',

      ft = 'markdown',
      config = function()
        vim.cmd [[
        " Disable auto conceal
        let g:vim_markdown_conceal = 0
        let g:tex_conceal = ""
        let g:vim_markdown_conceal_code_blocks = 0

        " Enable latex math
        let g:vim_markdown_math = 1

        " add automatically for link when you call with ge
        let g:vim_markdown_no_extensions_in_markdown = 1
        " ge go to anchor
        let g:vim_markdown_follow_anchor = 1
        let g:vim_markdown_toc_autofit = 1

        let g:vim_markdown_folding_disabled = 1
        ]]
      end
  }

  use "jamestthompson3/nvim-remote-containers"

  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'pandoc.markdown', 'rmd', 'pullrequest', 'gitcommit'},
    run = "cd app && yarn install",
    config = function()
      vim.cmd [[
      let g:mkdp_browser = 'firefox'
      let g:mkdp_filetypes = ['markdown', 'pullrequest', 'gitcommit']
      let g:mkdp_preview_options = {
        ]]
      end
    }

    -- debug
    use "mfussenegger/nvim-dap"
    use { "Pocco81/DAPInstall.nvim", requires = {"mfussenegger/nvim-dap"} }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

    -- note taking
    use {
      "oberblastmeister/neuron.nvim",
      requires = 'nvim-telescope/telescope.nvim'
    }

  end
}
