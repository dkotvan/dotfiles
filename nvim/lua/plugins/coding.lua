return {
  -- treesiter
  {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdateSync",
	dependencies = {
	  "RRethy/nvim-treesitter-textsubjects",
	  'JoosepAlviste/nvim-ts-context-commentstring',
	},
	config = function()
	  require("nvim-treesitter.configs").setup({
		ensure_installed = {
		  "bash", "c", "css", "csv", "clojure", "cpp", "diff", "dockerfile", "dot", "elixir",
		  "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
		  "go", "gomod", "gosum", "gowork", "graphql", "hcl", "html", "http", "hurl",
		  "java", "javascript", "jq", "json", "json5", "jsonc", "kotlin", "latex", "lua", "make",
		  "markdown_inline", "perl", "php", "python", "ruby", "sql", "terraform", "toml", "typescript", "vim",
		  "vimdoc", "xml", "yaml", "zig"
		},
		highlight = { enable = true },
		indentation = { enable = true },
		folding = { enable = false },
		incremental_selection = {
		  enable = true,
		  keymaps = {
			init_selection = "gni",
			node_incremental = "gnn",
			scope_incremental = "gnc",
			node_decremental = "gnm",
		  },
		},
		textsubjects = {
		  enable = true,
		  prev_selection = ',', -- (Optional) keymap to select the previous selection
		  keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = { 'textsubjects-container-outer', desc = "Select outside containers (classes, functions, etc.)" },
			['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
		  },
		},
		autopairs = { enable = true },
	  })
	end,
  },

  {
	"williamboman/mason.nvim",
	dependencies = {
	  "williamboman/mason-lspconfig.nvim",
	  "WhoIsSethDaniel/mason-tool-installer.nvim",
	  "neovim/nvim-lspconfig",
	},

	config = function()
	  require("mason").setup()
	  require("mason-lspconfig").setup()
	  require('mason-tool-installer').setup {
		ensure_installed = {
		  -- LSP Servers
		  "autotools_ls", "bashls", "docker_compose_language_service", "dockerls",
		  "jqls", "lua_ls", "pyright", "solargraph", "tsserver", "terraformls",
		  "tflint", "yamlls",
		  -- Linters
		  "eslint_d", "shellcheck", "vacuum",
		  -- Format
		  "cbfmt", "jq", "shfmt", "sqlfluff",
		},
		auto_update = true,
		run_on_start = true,
		start_delay = 10000,
		debounce_hours = 8,
	  }

	  require("lspconfig").lua_ls.setup({ filetypes = { "lua" } })
	  require("lspconfig").bashls.setup({ filetypes = { "bash", "sh" } })
	  require("lspconfig").terraformls.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })
	  require("lspconfig").tflint.setup({ filetypes = { "terraform", "terraform-vars", "hcl" } })
	end
  },

  {
	"nvimtools/none-ls.nvim",
	config = function()
	  local nls = require("null-ls")

	  local sqlfluff_with = {
		extra_args = { "--config", vim.fn.expand("$HOME/dotfiles/nvim/sqlfluff.toml") },
	  }

	  local sources = {
		-- Code Actions
		nls.builtins.code_actions.gitrebase,
		nls.builtins.code_actions.gitsigns,
		-- Diagnostics
		-- nls.builtins.diagnostics.sqlfluff.with(sqlfluff_with),
		nls.builtins.diagnostics.vacuum, -- TODO: create a recomended ruleset
		nls.builtins.diagnostics.zsh,
		-- Formatting.
		nls.builtins.formatting.cbfmt,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.sqlfluff.with(sqlfluff_with),
	  }
	  -- local gotest = require("go.null_ls").gotest()
	  -- local gotest_codeaction = require("go.null_ls").gotest_action()
	  -- table.insert(sources, gotest)
	  -- table.insert(sources, gotest_codeaction)
	  nls.setup({
		debug = false,
		sources = sources,
	  })
	end,
  },

  { "ray-x/guihua.lua", build = "cd lua/fzy && make" },
  "onsails/lspkind-nvim",
  {
	'ray-x/navigator.lua',
	dependencies = {
	  'ray-x/guihua.lua',
	  'neovim/nvim-lspconfig',
	},
	config = function()
	  require("navigator").setup({
		debug = false,
		default_mapping = false,
		keymaps = {},
		mason = true,
		lines_show_prompt = 20,
		lsp = {
		  code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true, virtual_text_icon = true },
		  code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		  format_on_save = false,
		  display_diagnostic_qf = 'trouble',
		  disable_lsp = { "sumneko_lua" },
		},
	  })
	end
  },

  {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
	  auto_jump = {},
	  auto_preview = false,
	},
  },

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
		  go = true,
		  yaml = false,
		  markdown = false,
		  help = false,
		  gitcommit = false,
		  gitrebase = false,
		  hgcommit = false,
		  svn = false,
		  cvs = false,
		  ["."] = false,
		},
		copilot_node_command = 'node', -- Node.js version must be > 16.x
		server_opts_overrides = {}
	  })
	end,
  },
  {
	"zbirenbaum/copilot-cmp",
	dependencies = { "copilot.lua", "hrsh7th/nvim-cmp", },
	config       = function()
	  require("copilot_cmp").setup()
	end
  },

  {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "canary",
	dependencies = {
	  { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	  { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
	  debug = true, -- Enable debugging
	  -- See Configuration section for rest
	},
	-- See Commands section for default commands if you want to lazy load on them
  },

  -- Supports bundler in vim
  {
	"tpope/vim-bundler",
	ft = { "ruby" },
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

  {
	"hrsh7th/nvim-cmp",
	dependencies = {
	  "andersevenrud/cmp-tmux",
	  "hrsh7th/cmp-buffer",
	  "hrsh7th/cmp-nvim-lsp",
	  "hrsh7th/cmp-path",
	  "hrsh7th/cmp-vsnip",
	  "hrsh7th/cmp-nvim-lua",
	  "ray-x/cmp-treesitter",
	  "f3fora/cmp-spell",
	  "hrsh7th/cmp-emoji",
	  "hrsh7th/cmp-cmdline",
	  "hrsh7th/cmp-nvim-lsp-signature-help",
	  "hrsh7th/cmp-nvim-lsp-document-symbol",
	  "ray-x/lsp_signature.nvim",
	  "davidsierradz/cmp-conventionalcommits",
	},
	config = function()
	  vim.o.completeopt = "menuone,noselect"

	  local cmp = require('cmp')
	  cmp.setup {
		snippet = {
		  -- REQUIRED - you must specify a snippet engine
		  expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		  end,
		},
		sources = {
		  -- { name = "codeium" },
		  { name = "copilot" },
		  { name = 'nvim_lsp' },
		  { name = 'nvim_lua' },
		  { name = 'vsnip' },
		  { name = 'path' },
		  { name = 'emoji' },
		  {
			name = 'tmux',
			option = {
			  all_panes = true,
			  label = '[tmux]',
			}
		  },
		  { name = 'buffer' },
		  { name = 'spell' },
		  { name = 'treesiter' },
		},
		mapping = cmp.mapping.preset.insert({
		  ['<C-b>'] = cmp.mapping.scroll_docs(-4), ['<C-f>'] = cmp.mapping.scroll_docs(4),
		  ['<C-Space>'] = cmp.mapping.complete(),
		  ['<C-e>'] = cmp.mapping.abort(),
		  ['<esc>'] = cmp.mapping.abort(),
		  ['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		  }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		experimental = {
		  ghost_text = false,
		},
		formatting = {
		  format = function(entry, vim_item)
			if (entry.source.name == "codeium") then
			  vim_item.kind = " codeium"
			elseif (entry.source.name == "copilot") then
			  vim_item.kind = " copilot"
			else
			  -- fancy icons and a name of kind
			  vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
			end

			-- set a name for each source
			vim_item.menu = ({
			  copilot = "",
			  codeium = "",
			  path = "",
			  buffer = "",
			  vsnip = "",
			  spell = "",
			  tmux = "",
			  treesiter = "",
			})[entry.source.name]
			return vim_item
		  end,
		},
	  }

	  cmp.setup.filetype('gitcommit', {
		sources = cmp.config.sources({
		  { name = 'conventionalcommits' },
		  { name = 'path' },
		  { name = 'emoji' },
		  { name = 'tmux' },
		  { name = 'buffer' },
		  { name = 'spell' },
		  { name = 'buffer' },
		})
	  })

	  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline('/', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		  { name = 'nvim_lsp_document_symbol' },
		  { name = 'buffer' },
		  { name = 'tmux' },
		}
	  })

	  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	  cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		  { name = 'path' },
		  { name = 'cmdline' },
		  { name = 'buffer' },
		})
	  })
	end,
  },

	-- Golang
	{
	  "ray-x/go.nvim",
	  dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
	  config = function()
		require('go').setup({
		  goimports = 'gopls', -- if set to 'gopls' will use golsp format
		  gofmt = 'gopls',    -- if set to gopls will use golsp format
		  -- max_line_len = 120,
		  tag_transform = false,
		  test_dir = '',
		  comment_placeholder = '   ',
		  lsp_cfg = true,      -- false: use your own lspconfig
		  lsp_gofumpt = true,   -- true: set default gofmt in gopls format to gofumpt
		  lsp_on_attach = true, -- use on_attach from go.nvim
		  lsp_keymaps = false, -- use our keymaps instead
		  dap_debug = true,
		  trouble = true,
		})

		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
		  pattern = "*.go",
		  callback = function()
			require('go.format').goimport()
		  end,
		  group = format_sync_grp,
		})

		local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
		require('lspconfig').gopls.setup(cfg)
	  end,
	},
	{
	  "ray-x/lsp_signature.nvim",
	  config = function()
		require("lsp_signature").setup {
		  log_path = "/tmp/sig.log",
		  debug = true,
		  hint_enable = false,
		  handler_opts = { border = "single" },
		  max_width = 80,
		}
	  end
	}
  }


