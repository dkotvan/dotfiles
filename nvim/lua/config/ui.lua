require('rose-pine').setup({
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,
})

vim.cmd('colorscheme kanagawabones')

require('lualine').setup {
  theme = "srcery",
  options = {
    icons_enabled= 1
  },
  extensions = {'fugitive', 'nvim-tree', 'quickfix' },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {
      {
        'filename',
        path = 1
      }
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {''},
    lualine_z = {'location'}
  }
}

require("tabby").setup({
    tabline = require("tabby.presets").active_wins_at_tail,
})
