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
    { name = "copilot"},
    { name = 'nvim_lsp'},
    { name = 'nvim_lua'},
    { name = 'vsnip'},
    { name = 'path'},
    { name = 'emoji'},
    { name = 'tmux',
      option = {
          all_panes = true,
          label = '[tmux]',
        }},
    { name = 'buffer'},
    { name = 'spell'},
    { name = 'treesiter'},
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<esc>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<C-g>'] = cmp.mapping(function(_)
      vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n', true)
    end)
  }),
  experimental = {
    ghost_text = false, -- this feature conflict to the copilot.vim's preview.
  },
  formatting = {
    format = function(entry, vim_item)

      if (entry.source.name == "copilot") then
        vim_item.kind = " copilot"
      else
      -- fancy icons and a name of kind
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
      end

      -- set a name for each source
      vim_item.menu = ({
        copilot = "",
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
    { name = 'path'},
    { name = 'emoji'},
    { name = 'tmux'},
    { name = 'buffer'},
    { name = 'spell'},
    { name = 'cmp_git' },
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'nvim_lsp_document_symbol' },
    { name = 'buffer' },
    { name = 'tmux'},
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'tmux'},
    { name = 'cmdline' },
    { name = 'buffer' },
  })
})
require("cmp_git").setup()

local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = {'string'},-- it will not add pair on that treesitter node
    javascript = {'template_string'},
    java = false,-- don't check treesitter on java
  }
})

require('nvim-treesitter.configs').setup {
  autopairs = {enable = true}
}

require("tabout").setup({
  tabkey = "",
  backwards_tabkey = "",
})

require("lsp_signature").setup {
  log_path = vim.fn.expand("$HOME") .. "/tmp/sig.log",
  debug = true,
  hint_enable = false,
  handler_opts = { border = "single" },
  max_width = 80,
}

-- local function replace_keycodes(str)
  --   return vim.api.nvim_replace_termcodes(str, true, true, true)
  -- end

  -- function _G.tab_binding()
    --   if vim.fn.pumvisible() ~= 0 then
    --     return replace_keycodes("<C-n>")
    --   elseif vim.fn["vsnip#available"](1) ~= 0 then
    --     return replace_keycodes("<Plug>(vsnip-expand-or-jump)")
    --   else
    --     return replace_keycodes("<Plug>(Tabout)")
    --   end
    -- end

    -- function _G.s_tab_binding()
      --   if vim.fn.pumvisible() ~= 0 then
      --     return replace_keycodes("<C-p>")
      --   elseif vim.fn["vsnip#jumpable"](-1) ~= 0 then
      --     return replace_keycodes("<Plug>(vsnip-jump-prev)")
      --   else
      --     return replace_keycodes("<Plug>(TaboutBack)")
      --   end
      -- end

      -- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", {expr = true})
      -- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", {expr = true})
