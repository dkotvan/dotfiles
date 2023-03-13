vim.cmd('set background=dark')
vim.cmd('colorscheme kanagawabones')

require('lualine').setup {
  options = {
  theme = "kanagawabones",
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
