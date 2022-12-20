-- install packer if is not here
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute 'packadd packer.nvim'
end

return require("packer").startup {
  function(use)
    use { 'wbthomason/packer.nvim' }

    use { 'lewis6991/impatient.nvim' }

    -- Editorconfig
    use {
      'editorconfig/editorconfig-vim',
      config = function()
        vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
      end
    }

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
      requires = { 'kyazdani42/nvim-web-devicons' }
    }
    use {
      "nanozuki/tabby.nvim"
    }

    use {
      "zbirenbaum/copilot.lua",
      event = { "VimEnter" },
      config = function()
        vim.defer_fn(function()
          require("copilot").setup()
        end, 100)
      end,
    }

    use {
      'nacro90/numb.nvim', config = function() require('numb').setup {
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
  use { 'luisiacc/gruvbox-baby' }
  use {
      "mcchrish/zenbones.nvim",
      requires = "rktjmp/lush.nvim"
  }
use {'ray-x/starry.nvim', setup = function() 
vim.g.starry_italic_comments = true
vim.g.starry_darker_contrast = true 
end}

  use {'srcery-colors/srcery-vim', as = 'srcery', setup = function()
vim.g.srcery_italic = 1
  end}

  use {'mhartington/oceanic-next', setup = function()
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
  end}

use({
    'rose-pine/neovim',
    as = 'rose-pine'
})
  -- treesiter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdateSync'
  }

  use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
  }

  -- LSP Stuff
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'
  use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
  use {
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
  }

  -- Yaml Schemas
  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
  }
  -- -- Golang
  use {
    'ray-x/go.nvim',
    requires = "nvim-treesitter/nvim-treesitter-textobjects",
  }

  -- Snippets
  use 'rafamadriz/friendly-snippets'
  use {
    'hrsh7th/vim-vsnip',
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/snippets/"
    end
  }
  use { 'hrsh7th/vim-vsnip-integ' }

  --- Auto complete
  use { 'andersevenrud/cmp-tmux' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-vsnip' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'petertriho/cmp-git', requires = 'nvim-lua/plenary.nvim' }
  use { 'ray-x/cmp-treesitter' }
  use { 'f3fora/cmp-spell' }
  use { 'hrsh7th/cmp-emoji' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/cmp-nvim-lsp-document-symbol' }
  use { 'ray-x/lsp_signature.nvim' }

  -- Auto pairs
  use { "windwp/nvim-autopairs" }

  -- Finders
  use {
    "stevearc/dressing.nvim",
  }
  -- Legendary
  use {
    "mrjones2014/legendary.nvim",
    -- opt = true,
    -- keys = { [[<C-p>]] },
    wants = { "dressing.nvim" },
    requires = { "stevearc/dressing.nvim" },
  }
  use {
    'nvim-lua/plenary.nvim',
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim", run = "make",
    requires = { 'nvim-telescope/telescope.nvim' }

  }
  use {
    'cljoly/telescope-repo.nvim',
    requires = { 'nvim-telescope/telescope.nvim' }

  }
  use {
    "LinArcX/telescope-changes.nvim",
    requires = { 'nvim-telescope/telescope.nvim' }
  }
  use {
    "LinArcX/telescope-scriptnames.nvim",
    requires = { 'nvim-telescope/telescope.nvim' }
  }
  use {
    'GustavoKatel/telescope-asynctasks.nvim', -- TODO: configure asynctasks
    requires = { { 'skywind3000/asynctasks.vim' }, { 'skywind3000/asyncrun.vim' }, { 'nvim-telescope/telescope.nvim' } }
  }
  use {
    'renerocksai/telekasten.nvim',
    requires = { 'renerocksai/calendar-vim' }
  }
  use {
    'alex-laycalvert/flashcards.nvim'
  }

  use {"akinsho/toggleterm.nvim", config = function()
    require("toggleterm").setup()
  end}

  use {"desdic/greyjoy.nvim" }

  use {
    'jedrzejboczar/possession.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }
  use {
    'edolphin-ydf/goimpl.nvim',
    requires = {
      { 'nvim-telescope/telescope.nvim' },
      { 'nvim-treesitter/nvim-treesitter' },
    },
  }
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'nvim-tree'.setup {
        disable_netrw = false,
        hijack_netrw  = true,
      }
    end
  }

  -- Curl inside nvim
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('rest-nvim').setup()
    end
  }

  -- add new targets and make it seek the operator in the line
  use 'wellle/targets.vim'

  -- allow to create your own text object
  use 'kana/vim-textobj-user'

  -- DiffViewOpen <git rev> to to a diff of all files
  use 'sindrets/diffview.nvim'

  -- best git plugin
  use 'tpope/vim-fugitive'

  -- Gbrowse open browser in Bitbucket too
  use 'tommcdo/vim-fubitive'

  -- Gbrowse open browser in Gitlab. use lab command
  use {
    'shumphrey/fugitive-gitlab.vim',
    config = function()
      vim.cmd [[ let g:fugitive_gitlab_domains = {'git.ifoodcorp.com.br': "https://code.ifoodcorp.com.br"} ]]
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup({
        keymaps = {
          -- Default keymap options
          noremap = true,

          ['n <F1>'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'" },
          ['n <C-F1>'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'" },

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
        current_line_blame = true,
      })
    end,
  }
  -- BW kill buffer without closing window, BUN, BD, BW, BB, BF
  use {
    'qpkorr/vim-bufkill',
    config = function()
      vim.g.BufKillCreateMappings = 0
    end
  }
  use {
    'AckslD/nvim-FeMaco.lua',
    config = 'require("femaco").setup()',
  }
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

  -- textobject ar | ir
  use {
    'nelstrom/vim-textobj-rubyblock',
    ft = { 'ruby' }
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

  -- compare directories
  use 'will133/vim-dirdiff'

  -- kill all buffers except the current
  use 'duff/vim-bufonly'

  use 'AndrewRadev/linediff.vim'

  -- A fast git commit browser
  use 'junegunn/gv.vim'

  -- :%S - replace text preserving case
  use {
    'tpope/vim-abolish',
    requires = 'tpope/vim-repeat'
  }
  -- Comments! gc
  use 'tpope/vim-commentary'

  -- Supports bundler in vim
  use {
    'tpope/vim-bundler',
    ft = { 'ruby' }
  }

  use {
    'tpope/vim-eunuch'
  }

  use {
    'tpope/vim-surround',
    requires = 'tpope/vim-repeat'
  }

  use { 'kevinhwang91/nvim-hlslens',
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

use { "mbbill/undotree" }
use { "Pocco81/auto-save.nvim" }

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

        let g:vim_markdown_strikethrough = 1
        ]]
      end
    }

    use {
      'iamcco/markdown-preview.nvim',
      -- ft = { 'markdown', 'pandoc.markdown', 'rmd', 'pullrequest', 'gitcommit' },
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
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use { 'theHamsta/nvim-dap-virtual-text' }
    use { 'nvim-telescope/telescope-dap.nvim' }

    -- Show registers when typing " or ctrl-r
    use {
      "folke/which-key.nvim",
    }

    use {
      'abecodes/tabout.nvim'
    }


    -- Project Related
    use {
      'windwp/nvim-spectre',
      config = function()
        require('spectre').setup {
          open_cmd = 'new',
          find_engine = {
            ['ag'] = {
              cmd = "ag",
              args = {
                '--vimgrep',
                '-s'
              },
              options = {
                ['ignore-case'] = {
                  value = "-i",
                  icon = "[I]",
                  desc = "ignore case"
                },
                ['hidden'] = {
                  value = "--hidden",
                  desc = "hidden file",
                  icon = "[H]"
                },
              },
            },
          },
          replace_engine = {
            ['sed'] = {
              cmd = "sed",
              args = nil
            },
            options = {
              ['ignore-case'] = {
                value = "--ignore-case",
                icon = "[I]",
                desc = "ignore case"
              },
            }
          },
          default = {
            find = {
              cmd = "ag",
              options = { "ignore-case" }
            },
            replace = {
              cmd = "sed"
            }
          },
        }
      end
    }

    use {
      "airblade/vim-rooter",
      config = function()
        vim.g.rooter_cd_cmd = 'tcd' -- change the location of the tab
      end
    }

    use { "numToStr/FTerm.nvim" }

    use {
      "samjwill/nvim-unception",
      config = function() 
          vim.api.nvim_create_autocmd(
              "User",
              {
                  pattern = "UnceptionEditRequestReceived",
                  callback = function()
                      require('FTerm').toggle()
                  end
              }
          )
      end
    }

    use { "jamestthompson3/nvim-remote-containers" }

    use {
      "klen/nvim-config-local",
      config = function()
        require('config-local').setup {
          -- Default configuration (optional)
          config_files = { ".vimrc.lua", ".vimrc" },  -- Config file patterns to load (lua supported)
          hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
          autocommands_create = true,                 -- Create autocommands (VimEnter, DirectoryChanged)
          commands_create = true,                     -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
          silent = false,                             -- Disable plugin messages (Config loaded/ignored)
          lookup_parents = false,                     -- Lookup config files in parent directories
        }
      end
    }
  end
}
