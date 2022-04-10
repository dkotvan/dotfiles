local read_background_file = function ()
  local f = io.open(vim.env.HOME .. '/.background', "r")
  if not f then return 'dark' end

  local background = f:read("*a"):gsub("\n", "")

  io.close(f)
  return background
end

vim.o.background = read_background_file()
vim.g.gruvbox_material_pallete = 'original'
vim.cmd [[ colorscheme gruvbox-material ]]

require('lualine').setup {
  theme = "gruvbox",
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
    lualine_x = {'filetype'},
    lualine_y = {''},
    lualine_z = {'location'}
  }
}
