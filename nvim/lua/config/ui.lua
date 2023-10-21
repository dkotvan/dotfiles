
vim.cmd [[
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors " colorscheme working well on iTerm2 + tmux
set t_ZH=^[[3m
set t_ZR=^[[23m
]]

vim.o.background = "dark"
vim.cmd('colorscheme gruvbox-material')

require('lualine').setup {
  options = {
  theme = "gruvbox-material",
    icons_enabled= 1
  },
  extensions = {'aerial', 'lazy', 'mason', 'fugitive', 'nvim-tree', 'quickfix', 'trouble' },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {''},
    lualine_z = {'location', 'searchcount'}
  }
}

local highlight = {
    "dark4",
    "dark3",
    "dark2",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "dark2", { fg = '#504945' })
    vim.api.nvim_set_hl(0, "dark3", { fg = '#665c54' })
    vim.api.nvim_set_hl(0, "dark4", { fg = '#7c6f64' })
end)

require("ibl").setup { indent = { highlight = highlight } }
