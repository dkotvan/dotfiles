vim.o.background = "dark"

require('codeschool').setup({
  plugins = {
    "buftabline",
    "coc",
    "fzf",
    "gitgutter",
    "gitsigns",
    "lsp",
    "lspsaga",
    "nerdtree",
    "netrw",
    "nvimtree",
    "signify",
    "startify",
    "syntastic",
    "telescope",
    "treesitter"
  },
  langs = {
    "c",
    "clojure",
    "css",
    "golang",
    "html",
    "java",
    "js",
    "json",
    "jsx",
    "lua",
    "markdown",
    "python",
    "ruby",
    "rust",
    "scala",
    "viml",
    "xml"
  }
})

vim.cmd [[ colorscheme codeschool ]]

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
    lualine_y = {},
    lualine_z = {'location'}
  }
}
