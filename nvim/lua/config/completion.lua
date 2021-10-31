vim.o.completeopt = "menuone,noselect"

  local cmp = require('cmp')
  cmp.setup {
    sources = {
      { name = 'vsnip'},
      { name = 'path'},
      { name = 'emoji'},
      { name = 'tmux'},
      { name = 'buffer'},
      { name = 'nvim_lsp'},
      { name = 'nvim_lua'},
      { name = 'calc'},
      { name = 'spell'},
      { name = 'treesiter'},
      { name = 'tags'},
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end,
    },
    -- formatting = {
    --   format = function(entry, vim_item)
    --     -- fancy icons and a name of kind
    --     vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

    --     -- set a name for each source
    --     vim_item.menu = ({
    --       path = "  (Path)",
    --       buffer = "  (Buffer)",
    --       calc = "  (Calc)",
    --       vsnip = "  (Snippet)",
    --       spell = "  (Spell)",
    --     })[entry.source.name]
    --     return vim_item
    --   end,
    -- },
  }

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
