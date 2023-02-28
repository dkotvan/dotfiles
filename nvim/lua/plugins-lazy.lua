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
    -- Editorconfig
    {
      'editorconfig/editorconfig-vim',
      config = function()
        vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
      end
    },

   -- Gruvbox colorscheme with support for treesiter
   "sainnhe/gruvbox-material",

   -- guide lines
   {
     'lukas-reineke/indent-blankline.nvim',
     config = function()
       vim.g.indent_blankline_use_treesitter = true
       require("indent_blankline").setup()
     end
   },

   -- Status and tabline
   {
     'hoob3rt/lualine.nvim',
     dependencies = { 'nvim-tree/nvim-web-devicons' }
   },

   -- Show breadcrumb using lsp
   {
     "utilyre/barbecue.nvim",
     version = "*",
     dependencies = {
       "SmiteshP/nvim-navic",
       "nvim-tree/nvim-web-devicons",
     },
     config = function()
       require("barbecue").setup()
     end,
   },

   --  Show line when typing number with :<number>
   {
     'nacro90/numb.nvim', config = function()
     require('numb').setup {
       show_numbers = true, -- Enable 'number' for the window while peeking
       show_cursorline = true, -- Enable 'cursorline' for the window while peeking
       number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
     }
   end
   },

   -- Hex editor / viewer -> :HexDump, :HexAssemble, :HexToggle
   {
     'RaafatTurki/hex.nvim', config = function()
     require('hex').setup()
   end
   },

   -- Colorschemes
   { 'srcery-colors/srcery-vim', as = 'srcery', setup = function()
     vim.g.srcery_italic = 1
   end },
   { 'mhartington/oceanic-next', setup = function()
     vim.g.oceanic_next_terminal_bold = 1
     vim.g.oceanic_next_terminal_italic = 1
   end },
   {
     'rose-pine/neovim',
     name = 'rose-pine'
   },

   -- treesiter
   {
     'nvim-treesitter/nvim-treesitter',
     build = ':TSUpdateSync'
   },

   -- install stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  'mfussenegger/nvim-lint',

   -- LSP Stuff
   'neovim/nvim-lspconfig',
   'onsails/lspkind-nvim',
   'weilbith/nvim-code-action-menu',
   { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
   'ray-x/navigator.lua',

   -- Yaml Schemas
   {
     "someone-stole-my-name/yaml-companion.nvim",
     dependencies = {
       { "neovim/nvim-lspconfig" },
       { "nvim-lua/plenary.nvim" },
       { "nvim-telescope/telescope.nvim" },
     },
   },

  -- Golang
   {
     'ray-x/go.nvim',
     dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
   },

   -- Snippets
   'rafamadriz/friendly-snippets',
   {
     'hrsh7th/vim-vsnip',
     config = function()
       vim.g.vsnip_snippet_dir = vim.fn.stdpath "config" .. "/snippets/"
     end
   },
   'hrsh7th/vim-vsnip-integ',

   --- Auto complete
   'andersevenrud/cmp-tmux' ,
   'hrsh7th/nvim-cmp' ,
   'hrsh7th/cmp-buffer' ,
   'hrsh7th/cmp-nvim-lsp' ,
   'hrsh7th/cmp-path' ,
   'hrsh7th/cmp-vsnip' ,
   'hrsh7th/cmp-nvim-lua' ,
   { 'petertriho/cmp-git', dependencies = 'nvim-lua/plenary.nvim' },
   'ray-x/cmp-treesitter' ,
   'f3fora/cmp-spell' ,
   'hrsh7th/cmp-emoji' ,
   'hrsh7th/cmp-cmdline' ,
   'hrsh7th/cmp-nvim-lsp-signature-help' ,
   'hrsh7th/cmp-nvim-lsp-document-symbol' ,
   'ray-x/lsp_signature.nvim' ,
   
   -- Auto pairs
   "windwp/nvim-autopairs" ,

   -- Finders
   "stevearc/dressing.nvim",

   -- Legendary
   {
     "mrjones2014/legendary.nvim",
     dependencies = { "stevearc/dressing.nvim" },
   },
   'nvim-lua/plenary.nvim',

   {
     'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'cljoly/telescope-repo.nvim', "LinArcX/telescope-changes.nvim", "LinArcX/telescope-scriptnames.nvim"}
   },
   
   {
     "nvim-telescope/telescope-fzf-native.nvim", build = "make",
     dependencies = { 'nvim-telescope/telescope.nvim' }

   },
   
   {
     'GustavoKatel/telescope-asynctasks.nvim', -- TODO: configure asynctasks
     dependencies = { 'skywind3000/asynctasks.vim', 'skywind3000/asyncrun.vim', 'nvim-telescope/telescope.nvim' }
   },
   
   {
     'renerocksai/telekasten.nvim',
     dependencies = { 'renerocksai/calendar-vim' }
   },

   {
     'alex-laycalvert/flashcards.nvim'
   },

   { "akinsho/toggleterm.nvim", config = function()
     require("toggleterm").setup()
   end },

   "desdic/greyjoy.nvim",

   {
     'jedrzejboczar/possession.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' },
   },

   {
     'edolphin-ydf/goimpl.nvim',
     dependencies = {
       { 'nvim-telescope/telescope.nvim' },
       { 'nvim-treesitter/nvim-treesitter' },
     },
   },

   -- File explorer
   {
     'nvim-tree/nvim-tree.lua',
     dependencies = { 'nvim-tree/nvim-web-devicons' },
     config = function()
       require 'nvim-tree'.setup {
         disable_netrw = false,
         hijack_netrw  = true,
       }
     end
   },

   -- add new targets and make it seek the operator in the line
   'wellle/targets.vim',

   -- DiffViewOpen <git rev> to to a diff of all files
   'sindrets/diffview.nvim',

   -- best git plugin
   'tpope/vim-fugitive',

   -- Gbrowse open browser in Bitbucket too
   'tommcdo/vim-fubitive',

   -- Gbrowse open browser in Gitlab. use lab command
   {
     'shumphrey/fugitive-gitlab.vim',
     config = function()
       vim.cmd [[ let g:fugitive_gitlab_domains = {'git.ifoodcorp.com.br': "https://code.ifoodcorp.com.br"} ]]
     end
   },

   {
     'lewis6991/gitsigns.nvim',
     dependencies = 'nvim-lua/plenary.nvim',
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
   },

   -- BW kill buffer without closing window, BUN, BD, BW, BB, BF
   {
     'qpkorr/vim-bufkill',
     config = function()
       vim.g.BufKillCreateMappings = 0
     end
   },

   -- Permit editing code inside markdown using correct syntax coloring
   {
     'AckslD/nvim-FeMaco.lua',
     config = 'require("femaco").setup()',
   },

   -- Now vim recognize line numbers on errors - open files like /a.txt:20:5
   'wsdjeg/vim-fetch',

   -- Sudo that works with neovim
   'lambdalisue/suda.vim',
   
   -- Open external browsers
   'tyru/open-browser.vim',
   
   -- Asynchronous tag generation
   'ludovicchabant/vim-gutentags',
  
   -- MakeTable! -> csv to markdown table
   -- UnmakeTable  -> markdown to csv
   'mattn/vim-maketable',

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

   -- align text - here becai can use the command Table in plasticboy/markdown,
   'godlygeek/tabular',

   -- swap text - cx, cxx, X (visual mode)
   'tommcdo/vim-exchange',

   -- compare directories
   'will133/vim-dirdiff',

   -- kill all buffers except the current
   'duff/vim-bufonly',

   'AndrewRadev/linediff.vim',

   -- A fast git commit browser
   'junegunn/gv.vim',

   -- :%S - replace text preserving case
   {
     'tpope/vim-abolish',
     dependencies = 'tpope/vim-repeat'
   },

   -- Comments! gc
   'tpope/vim-commentary',

   -- Supports bundler in vim
   {
     'tpope/vim-bundler',
     ft = { 'ruby' }
   },

   'tpope/vim-eunuch',

   {
     'tpope/vim-surround',
     dependencies = 'tpope/vim-repeat'
   },

   { 'kevinhwang91/nvim-hlslens',
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
   },

   "mbbill/undotree",
   "Pocco81/auto-save.nvim",

   { 'AllenDang/nvim-expand-expr',
     config = function()
       vim.cmd [[ nmap <leader>e <Cmd>lua require("expand_expr").expand()<CR> ]]
     end
   },

   -- Better markdown
   {
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
   },

   {
     'iamcco/markdown-preview.nvim',
     -- ft = { 'markdown', 'pandoc.markdown', 'rmd', 'pullrequest', 'gitcommit' },
     build ="cd app && yarn install",
     config = function()
       vim.cmd [[
       let g:mkdp_browser = 'firefox'
       let g:mkdp_filetypes = ['markdown', 'pullrequest', 'gitcommit']
       let g:mkdp_preview_options = {}
       ]]
     end
   },

   -- debug
   "mfussenegger/nvim-dap",
   { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
   { "leoluz/nvim-dap-go", dependencies = { "mfussenegger/nvim-dap" } },
   'theHamsta/nvim-dap-virtual-text',
   'nvim-telescope/telescope-dap.nvim',

   -- Show registers when typing " or ctrl-r
   "folke/which-key.nvim",

   'abecodes/tabout.nvim',

   {
     'phaazon/mind.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' },
     config = function()
       require 'mind'.setup()
     end
   },
  
   -- Project Related
   {
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
   },

   {
     "airblade/vim-rooter",
     config = function()
       vim.g.rooter_cd_cmd = 'tcd' -- change the location of the tab
     end
   },

   "numToStr/FTerm.nvim",

   {
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
   },

   "jamestthompson3/nvim-remote-containers",

   {
     "klen/nvim-config-local",
     config = function()
       require('config-local').setup {
         -- Default configuration (optional)
         config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
         hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
         autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
         commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
         silent = false, -- Disable plugin messages (Config loaded/ignored)
         lookup_parents = false, -- Lookup config files in parent directories
       }
     end
   },

   -- AI relatedf

   {
     "jcdickinson/codeium.nvim",
     dependencies = {
       "nvim-lua/plenary.nvim",
       "MunifTanjim/nui.nvim",
       "hrsh7th/nvim-cmp",
     },
     config = function()
       require("codeium").setup({
       })
     end
   },

   {
     "jackMort/ChatGPT.nvim",
     config = function()
       require("chatgpt").setup({
         -- optional configuration
       })
     end,
     dependencies = {
       "MunifTanjim/nui.nvim",
       "nvim-lua/plenary.nvim",
       "nvim-telescope/telescope.nvim"
     }
   },

})
