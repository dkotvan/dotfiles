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

    -- best git plugin
    use 'tpope/vim-fugitive'

    -- Gbrowse open browser in Bitbucket too
    use 'tommcdo/vim-fubitive'

    -- Gbrowse open browser in Gitlab. use lab command
    use 'shumphrey/fugitive-gitlab.vim'

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

    -- A fast git commit browser
    use 'junegunn/gv.vim'

    -- :%S - replace text preserving case
    use {
      'tpope/vim-abolish',
      requires = 'tpope/vim-repeat'
    }
    -- Comments! gc
    use 'tpope/vim-commentary'

    use {
      'tpope/vim-surround',
      requires = 'tpope/vim-repeat'
    }

    -- Gruvbox colorscheme with support for treesiter
    use {
      "sainnhe/gruvbox-material",
    }

    use {
      'luisiacc/gruvbox-baby',
    }

    -------------------------------------------------------------
    -- Plugins loaded in native only
    -------------------------------------------------------------

    -- Status and tabline
    use {
      'hoob3rt/lualine.nvim',
      requires = {'kyazdani42/nvim-web-devicons'},
      cond = function() return not vim.g.vscode end
    }

    use {
      "nanozuki/tabby.nvim",
      cond = function() return not vim.g.vscode end
    }

        use {
          'nikvdp/neomux',
          requires = { 'mhinz/neovim-remote' },
          cond = function() return not vim.g.vscode end
        }

        -- Editorconfig
        use {
          'editorconfig/editorconfig-vim',
          config = function()
            vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
          end,
          cond = function() return not vim.g.vscode end
        }

        -- guide lines
        use {
          'lukas-reineke/indent-blankline.nvim',
          config = function()
            vim.g.indent_blankline_use_treesitter = true
          end
        }

        use{
          "zbirenbaum/copilot.lua",
          event = {"VimEnter"},
          config = function()
            vim.defer_fn(function()
              require("copilot").setup()
            end, 100)
          end,
          cond = function() return not vim.g.vscode end
        }

        use {
          "zbirenbaum/copilot-cmp",
          after = { "copilot.lua", "nvim-cmp" },
          cond = function() return not vim.g.vscode end
        }

        use {
          'nacro90/numb.nvim',
          config = function()
            require('numb').setup{
              show_numbers = true, -- Enable 'number' for the window while peeking
              show_cursorline = true, -- Enable 'cursorline' for the window while peeking
              number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
            }
          end,
          cond = function() return not vim.g.vscode end
        }

        -- treesiter
        use {
          'nvim-treesitter/nvim-treesitter',
          run = ':TSUpdate',
          cond = function() return not vim.g.vscode end
        }

        --
        -- LSP Stuff
        use {
          'neovim/nvim-lspconfig',
          cond = function() return not vim.g.vscode end
        }
        use {
          'williamboman/nvim-lsp-installer',
          cond = function() return not vim.g.vscode end
        }
        use {
          'onsails/lspkind-nvim',
          cond = function() return not vim.g.vscode end
        }
        use {
          "folke/trouble.nvim",
          requires = "kyazdani42/nvim-web-devicons",
          cond = function() return not vim.g.vscode end
        }

        use {
          'simrat39/symbols-outline.nvim', -- command :SymbolsOutline
          cond = function() return not vim.g.vscode end
        }

        use {
          'weilbith/nvim-code-action-menu',
          cmd = 'CodeActionMenu',
          cond = function() return not vim.g.vscode end
        }

        -- Golang
        use {
          'fatih/vim-go',
          config = function()
            vim.g.go_code_completion_enabled = 0
            vim.g.go_def_mapping_enabled = 1
            vim.g.go_term_mode = "split"
            vim.g.go_gopls_options = { '-remote=auto' }
            vim.g.go_metalinter_command = "golangci-lint"
          end,
          cond = function() return not vim.g.vscode end
        }

        use {
          'buoto/gotests-vim',
          cond = function() return not vim.g.vscode end
        }

        use {
          'hexdigest/gounit-vim',
          cond = function() return not vim.g.vscode end
        }

        -- Auto complete

        -- Snippets
        use {
          'rafamadriz/friendly-snippets',
          cond = function() return not vim.g.vscode end
        }

        use {
          'hrsh7th/vim-vsnip',
          config = function()
            vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/snippets/"
          end,
          cond = function() return not vim.g.vscode end
        }

        use {
          'hrsh7th/vim-vsnip-integ',
          cond = function() return not vim.g.vscode end
        }

        --- Auto complete
        use {
          'andersevenrud/cmp-tmux',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/nvim-cmp',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-buffer',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-nvim-lsp',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-path',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-vsnip',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-nvim-lua',
          cond = function() return not vim.g.vscode end
        }
        use {
          'petertriho/cmp-git',
          requires = 'nvim-lua/plenary.nvim',
          cond = function() return not vim.g.vscode end
        }
        use {
          'ray-x/cmp-treesitter',
          cond = function() return not vim.g.vscode end
        }
        use {
          'f3fora/cmp-spell',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-emoji',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-cmdline',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-nvim-lsp-signature-help',
          cond = function() return not vim.g.vscode end
        }
        use {
          'hrsh7th/cmp-nvim-lsp-document-symbol',
          cond = function() return not vim.g.vscode end
        }

        use {
          'AndrewRadev/tagalong.vim',
          cond = function() return not vim.g.vscode end
        }

        -- Auto pairs
        use {
          "windwp/nvim-autopairs",
          cond = function() return not vim.g.vscode end
        }

        -- Telescope
        use {
          'nvim-lua/plenary.nvim',
          cond = function() return not vim.g.vscode end
        }
        use {
          'nvim-telescope/telescope.nvim',
          requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
          cond = function() return not vim.g.vscode end
        }

        use {
          "nvim-telescope/telescope-fzf-native.nvim", run = "make",
          cond = function() return not vim.g.vscode end
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
          end,
          cond = function() return not vim.g.vscode end
        }

        -- DiffViewOpen <git rev> to to a diff of all files
        use {
           'sindrets/diffview.nvim',
           cond = function() return not vim.g.vscode end
        }

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
              current_line_blame = true,
            })
          end,
          event = "BufRead",
          cond = function() return not vim.g.vscode end
        }

        use {
          'airblade/vim-rooter',
          cond = function() return not vim.g.vscode end
        }

        -- BW kill buffer without closing window, BUN, BD, BW, BB, BF
        use {
          'qpkorr/vim-bufkill',
          cond = function() return not vim.g.vscode end
        }

        -- Now vim recognize line numbers on errors - open files like /a.txt:20:5
        use {
          'wsdjeg/vim-fetch',
          cond = function() return not vim.g.vscode end
        }

        -- Sudo that works with neovim
        use {
          'lambdalisue/suda.vim',
          cond = function() return not vim.g.vscode end
        }

        -- Open external browsers
        use {
          'tyru/open-browser.vim',
          cond = function() return not vim.g.vscode end
        }

        -- compare directories
        use {
          'vim-scripts/dirdiff.vim',
          cond = function() return not vim.g.vscode end
        }
        use {
          'ZSaberLv0/ZFVimDirDiff',
          cond = function() return not vim.g.vscode end
        }

        -- kill all buffers except the current
        use {
          'duff/vim-bufonly',
          cond = function() return not vim.g.vscode end
        }

        use {
          'AndrewRadev/linediff.vim',
          cond = function() return not vim.g.vscode end
        }

        -- Supports bundler in vim
        use {
          'tpope/vim-bundler',
          ft = {'ruby'},
          cond = function() return not vim.g.vscode end
        }

        use {
          'tpope/vim-eunuch',
          cond = function() return not vim.g.vscode end
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
        end,
        cond = function() return not vim.g.vscode end
      }

      use {
        "mbbill/undotree",
        cond = function() return not vim.g.vscode end
      }
      use {
        "Pocco81/AutoSave.nvim",
        cond = function() return not vim.g.vscode end
      }

      use { 'AllenDang/nvim-expand-expr',
      config = function()
        vim.cmd [[ nmap <leader>e <Cmd>lua require("expand_expr").expand()<CR> ]]
      end,
      cond = function() return not vim.g.vscode end
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
      end,
      cond = function() return not vim.g.vscode end
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
      end,
      cond = function() return not vim.g.vscode end
    }

    -- debug
    use {
      "mfussenegger/nvim-dap",
      cond = function() return not vim.g.vscode end
    }
    use {
      "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"},
    cond = function() return not vim.g.vscode end
    }
    use {
      'theHamsta/nvim-dap-virtual-text',
    cond = function() return not vim.g.vscode end
    }

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
        cond = function() return not vim.g.vscode end
      }

      use {
        'abecodes/tabout.nvim',
        cond = function() return not vim.g.vscode end
      }

      use {
        "rafcamlet/nvim-luapad",
        cond = function() return not vim.g.vscode end
      }

  end
}


