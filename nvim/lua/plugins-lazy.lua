-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- ###### UI related
  -- Gruvbox colorscheme with support for treesiter
  "sainnhe/gruvbox-material",

  -- guide lines
  {
    "lukas-reineke/indent-blankline.nvim",
    main = 'ibl',
  },

  -- Status and tabline
  {
    "hoob3rt/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

  -- Hex editor / viewer -> :HexDump, :HexAssemble, :HexToggle
  {
    "RaafatTurki/hex.nvim",
    config = function()
      require("hex").setup()
    end,
  },

  -- Colorschemes
  {
    "srcery-colors/srcery-vim",
    as = "srcery",
    setup = function()
      vim.g.srcery_italic = 1
    end,
  },
  {
    "mhartington/oceanic-next",
    setup = function()
      vim.g.oceanic_next_terminal_bold = 1
      vim.g.oceanic_next_terminal_italic = 1
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  -- treesiter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdateSync",
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    }
  },

  -- install stuff
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- LSP Stuff
  "neovim/nvim-lspconfig",
  "onsails/lspkind-nvim",
  { "ray-x/guihua.lua",   build = "cd lua/fzy && make" },
  "ray-x/navigator.lua",

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

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
    "ray-x/go.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
  },

  -- Snippets
  "rafamadriz/friendly-snippets",
  {
    "hrsh7th/vim-vsnip",
    config = function()
      vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets/"
    end,
  },
  "hrsh7th/vim-vsnip-integ",

  --- Auto complete
  "andersevenrud/cmp-tmux",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/cmp-nvim-lua",
  { "petertriho/cmp-git", dependencies = "nvim-lua/plenary.nvim" },
  "ray-x/cmp-treesitter",
  "f3fora/cmp-spell",
  "hrsh7th/cmp-emoji",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-nvim-lsp-document-symbol",
  "ray-x/lsp_signature.nvim",
  "davidsierradz/cmp-conventionalcommits",
  -- Auto pairs
  "windwp/nvim-autopairs",

  -- Finders
  "stevearc/dressing.nvim",

  -- Legendary
  {
    "mrjones2014/legendary.nvim",
    dependencies = { "stevearc/dressing.nvim" },
  },
  "nvim-lua/plenary.nvim",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "cljoly/telescope-repo.nvim",
      "LinArcX/telescope-changes.nvim",
      "LinArcX/telescope-scriptnames.nvim",
      "aaronhallaert/advanced-git-search.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "debugloop/telescope-undo.nvim",
    },
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  {
    "renerocksai/telekasten.nvim",
    dependencies = { "renerocksai/calendar-vim" },
  },

  {
    "edolphin-ydf/goimpl.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = false,
        hijack_netrw = true,
        view = {
          preserve_window_proportions = true,
        },
      })
    end,
  },

  -- add new targets and make it seek the operator in the line
  "wellle/targets.vim",

  -- DiffViewOpen <git rev> to to a diff of all files
  "sindrets/diffview.nvim",

  -- best git plugin
  "tpope/vim-fugitive",

  -- Gbrowse open browser in Bitbucket too
  "tommcdo/vim-fubitive",

  -- Gbrowse open browser in Github too
  "tpope/vim-rhubarb",

  -- Gbrowse open browser in Gitlab. use lab command
  {
    "shumphrey/fugitive-gitlab.vim",
    config = function()
      vim.cmd([[ let g:fugitive_gitlab_domains = {'git.ifoodcorp.com.br': "https://code.ifoodcorp.com.br"} ]])
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
      })
    end,
  },

  -- BW kill buffer without closing window, BUN, BD, BW, BB, BF
  {
    "qpkorr/vim-bufkill",
    config = function()
      vim.g.BufKillCreateMappings = 0
    end,
  },

  -- Permit editing code inside markdown using correct syntax coloring
  {
    "AckslD/nvim-FeMaco.lua",
    config = 'require("femaco").setup()',
  },

  -- Sudo that works with neovim
  "lambdalisue/suda.vim",

  -- Open external browsers
  "tyru/open-browser.vim",

  -- Asynchronous tag generation
  "ludovicchabant/vim-gutentags",

  -- MakeTable! -> csv to markdown table
  -- UnmakeTable  -> markdown to csv
  "mattn/vim-maketable",

  -- textobject ar | ir
  {
    "nelstrom/vim-textobj-rubyblock",
    ft = { "ruby" },
  },

  -- textobject ae | ie
  { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },

  -- textobject al | il
  { "kana/vim-textobj-line",   dependencies = { "kana/vim-textobj-user" } },

  -- textobject ai | ii
  { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" } },

  -- textobject ig | ]g [g
  "andrewferrier/textobj-diagnostic.nvim",

  -- align text by character -> gl and gL
  "tommcdo/vim-lion",

  -- align text - here becai can use the command Table in plasticboy/markdown,
  "godlygeek/tabular",

  -- swap text - cx, cxx, X (visual mode)
  "tommcdo/vim-exchange",

  -- compare directories
  "will133/vim-dirdiff",

  -- kill all buffers except the current
  "duff/vim-bufonly",

  "AndrewRadev/linediff.vim",

  -- A fast git commit browser
  "junegunn/gv.vim",

  -- :%S - replace text preserving case
  {
    "tpope/vim-abolish",
    dependencies = "tpope/vim-repeat",
  },

  -- Comments! gc
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  -- Supports bundler in vim
  {
    "tpope/vim-bundler",
    ft = { "ruby" },
  },

  "tpope/vim-eunuch",

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup({
        calm_down = true,
      })
      vim.cmd([[
   noremap n <Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>
   noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>
   noremap * *<Cmd>lua require('hlslens').start()<CR>
   noremap # #<Cmd>lua require('hlslens').start()<CR>
   noremap g* g*<Cmd>lua require('hlslens').start()<CR>
   noremap g# g#<Cmd>lua require('hlslens').start()<CR>
   nnoremap <silent> <leader>l :noh<CR>
   ]])
    end,
  },

  "Pocco81/auto-save.nvim",

  -- Better markdown
  {
    "plasticboy/vim-markdown",
    ft = "markdown",
    config = function()
      vim.cmd([[
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
       ]])
    end,
  },

  {
    'cnshsliu/smp.nvim',
    build = "cd lua/server && npm install", -- yes, we should have node & npm installed.
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
  },

  -- debug
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
  { "leoluz/nvim-dap-go",   dependencies = { "mfussenegger/nvim-dap" } },
  "theHamsta/nvim-dap-virtual-text",
  "nvim-telescope/telescope-dap.nvim",

  -- Show registers when typing " or ctrl-r
  "folke/which-key.nvim",

  "abecodes/tabout.nvim",

  -- Project Related
  {
    "windwp/nvim-spectre",
    config = function()
      require("spectre").setup({
        open_cmd = "new",
        find_engine = {
          ["ag"] = {
            cmd = "ag",
            args = {
              "--vimgrep",
              "-s",
            },
            options = {
              ["ignore-case"] = {
                value = "-i",
                icon = "[I]",
                desc = "ignore case",
              },
              ["hidden"] = {
                value = "--hidden",
                desc = "hidden file",
                icon = "[H]",
              },
            },
          },
        },
        replace_engine = {
          ["sed"] = {
            cmd = "sed",
            args = nil,
          },
          options = {
            ["ignore-case"] = {
              value = "--ignore-case",
              icon = "[I]",
              desc = "ignore case",
            },
          },
        },
        default = {
          find = {
            cmd = "ag",
            options = { "ignore-case" },
          },
          replace = {
            cmd = "sed",
          },
        },
      })
    end,
  },

  {
    "airblade/vim-rooter",
    config = function()
      vim.g.rooter_patterns = { "_git/", "go.mod" }
      vim.g.rooter_cd_cmd = "tcd" -- change the location of the tab
    end,
  },

  "numToStr/FTerm.nvim",

  {
    "samjwill/nvim-unception",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "UnceptionEditRequestReceived",
        callback = function()
          require("FTerm").toggle()
        end,
      })
    end,
  },

  "jamestthompson3/nvim-remote-containers",

  {
    "klen/nvim-config-local",
    config = function()
      require("config-local").setup({
        -- Default configuration (optional)
        config_files = { ".vimrc.lua", ".vimrc" },            -- Config file patterns to load (lua supported)
        hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
        autocommands_create = true,                           -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,                               -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
        silent = false,                                       -- Disable plugin messages (Config loaded/ignored)
        lookup_parents = false,                               -- Lookup config files in parent directories
      })
    end,
  },

  -- AI relatedf

  --     {
  --       "jcdickinson/codeium.nvim",
  --       dependencies = {
  --         "nvim-lua/plenary.nvim",
  --         "MunifTanjim/nui.nvim",
  --         "hrsh7th/nvim-cmp",
  --       },
  --       config = function()
  --         require("codeium").setup({})
  --       end,
  --     },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = false,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          go = false,
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          telekasten = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {}
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config       = function()
      require("copilot_cmp").setup()
    end
  },

  --   {
  --     "jackMort/ChatGPT.nvim",
  --     config = function()
  --       require("chatgpt").setup({
  --         -- optional configuration
  --       })
  --     end,
  --     dependencies = {
  --       "MunifTanjim/nui.nvim",
  --       "nvim-lua/plenary.nvim",
  --       "nvim-telescope/telescope.nvim",
  --     },
  --   },

  -- Got from LazyVIM
  {
    "RRethy/vim-illuminate", -- Vim plugin for automatically highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  },
  -- {
  --   "folke/noice.nvim",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --     config = function()
  --       require("noice").setup({
  --       cmdline = {
  --         view = "cmdline",
  --       },
  --       messages = {
  --         enabled = false,
  --       },
  --       lsp = {
  --         hover = {
  --           enabled = false,
  --         },
  --         signature = {
  --           enabled = false,
  --         },
  --         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --         override = {
  --           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --           ["vim.lsp.util.stylize_markdown"] = true,
  --           ["cmp.entry.get_documentation"] = true,
  --         },
  --       },
  --       -- you can enable a preset for easier configuration
  --       presets = {
  --         bottom_search = false,        -- use a classic bottom cmdline for search
  --         long_message_to_split = true, -- long messages will be sent to a split
  --         inc_rename = true,            -- enables an input dialog for inc-rename.nvim
  --         lsp_doc_border = false,       -- add a border to hover docs and signature help
  --       },
  --     })
  --   end,
  -- },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "mason.nvim",
    },
  },

  {
    "rest-nvim/rest.nvim",
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  },
})
