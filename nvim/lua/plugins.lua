-- install packer if is not here
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require("packer").startup {
  log = { level = 'debug '},
  function(use)
    use { 'wbthomason/packer.nvim' }

    use 'lewis6991/impatient.nvim'

    -- Editorconfig
    use { 'editorconfig/editorconfig-vim' }

    -- make ftplugins/*.lua be loaded correctly
    use { "tjdevries/astronauta.nvim"}

    -- guide lines
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        vim.g.indent_blankline_use_treesitter = true
      end
    }

    -- Status and tabline
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
      'nacro90/numb.nvim',
      config = function()
        require('numb').setup{
          show_numbers = true, -- Enable 'number' for the window while peeking
          show_cursorline = true, -- Enable 'cursorline' for the window while peeking
          number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        }
      end
    }

    -- Gruvbox colorscheme with support for treesiter
    use {
      "sainnhe/gruvbox-material",
    }

    --  JqxList and JqxQuery command with jkson
    use 'gennaro-tedesco/nvim-jqx'

    -- treesiter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    --
    -- LSP Stuff
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'onsails/lspkind-nvim'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
    }
    use {
      'simrat39/symbols-outline.nvim'
    }

    -- Golang
    use 'ray-x/go.nvim'

    -- Auto complete

    -- Snippets
    use 'rafamadriz/friendly-snippets'
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/vim-vsnip-integ'}

    --- Auto complete
    use { 'andersevenrud/compe-tmux', branch = 'cmp'}
    use { 'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/vim-vsnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-nvim-lua',
        'quangnguyen30192/cmp-nvim-tags',
        'ray-x/cmp-treesitter',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-emoji',
        'hrsh7th/cmp-calc'
      }
    }

    -- Auto pairs
    use { "windwp/nvim-autopairs" }

    -- Telescope
    use {
      'nvim-lua/plenary.nvim',
    }
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {
      "mfussenegger/nvim-lint",
      config = function()
        -- require("nlint").setup()

        -- vim.cmd [[ au BufWritePost <buffer> lua require('lint').try_lint() ]]
      end,
    }

    use {
      "lukas-reineke/format.nvim"
    }

    -- File explorer
    use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function()
        require'nvim-tree'.setup {
          disable_netrw       = false,
          hijack_netrw        = true,
        }
      end
    }

    -- Curl inside nvim
    use {
      'NTBBloodbath/rest.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('rest-nvim').setup()
        vim.cmd [[ nmap <leader>r <Plug>RestNvim ]]
      end
    }

    -- add new targets and make it seek the operator in the line
    use 'wellle/targets.vim'

    -- allow to create your own text object
    use 'kana/vim-textobj-user'

    -- Blame line showed everytime at right
    use { 'tveskag/nvim-blame-line',
    config = function()
      vim.cmd[[ autocmd BufEnter * EnableBlameLine ]]
    end
  }

  -- DiffViewOpen <git rev> to to a diff of all files
  use 'sindrets/diffview.nvim'

  -- best git plugin
  use 'tpope/vim-fugitive'

  -- Gbrowse open browser in Bitbucket too
  use 'tommcdo/vim-fubitive'

  -- Gbrowse open browser in Gitlab. use lab command
  use 'shumphrey/fugitive-gitlab.vim'

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup({
        keymaps = {
          -- Default keymap options
          noremap = true,

          ['n <F1>'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
          ['n <C-F1>'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

          ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
          ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
          ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
          ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

          -- Text objects
          ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
        },
      })
    end,
    event = "BufRead",
  }

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

  use {'kevinhwang91/nvim-hlslens',
  config = function()
    require('hlslens').setup({
      calm_down = true
    })
    vim.cmd [[
    noremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
    noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
    noremap * *<Cmd>lua require('hlslens').start()<CR>
    noremap # #<Cmd>lua require('hlslens').start()<CR>
    noremap g* g*<Cmd>lua require('hlslens').start()<CR>
    noremap g# g#<Cmd>lua require('hlslens').start()<CR>
    nnoremap <silent> <leader>l :noh<CR>
    ]]
  end
}

use { 'ggandor/lightspeed.nvim',
config = function()
  require('lightspeed').setup({
    jump_to_first_match = true,
    jump_on_partial_input_safety_timeout = 500,
    highlight_unique_chars = false,
    grey_out_search_area = true,
    match_only_the_start_of_same_char_seqs = true,
    limit_ft_matches = 5,
  })
end
  }

  use { "mbbill/undotree" }
  use { "Pocco81/AutoSave.nvim" }

  use { 'AllenDang/nvim-expand-expr',
  config = function()
    vim.cmd [[ nmap <leader>e <Cmd>lua require("expand_expr").expand()<CR> ]]
  end
}

-- Better markdown
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

use {
  'iamcco/markdown-preview.nvim',
  ft = {'markdown', 'pandoc.markdown', 'rmd', 'pullrequest', 'gitcommit'},
  run = "cd app && yarn install",
  config = function()
    vim.cmd [[
    let g:mkdp_browser = 'firefox'
    let g:mkdp_filetypes = ['markdown', 'pullrequest', 'gitcommit']
    let g:mkdp_preview_options = {}
    ]]
  end
}

-- debug
use "mfussenegger/nvim-dap"
use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
use { 'theHamsta/nvim-dap-virtual-text' }

-- Show registers when typing " or ctrl-r
use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      }})
    end,
    event = "BufWinEnter",
  }

use {
  'abecodes/tabout.nvim'
}

end
}
