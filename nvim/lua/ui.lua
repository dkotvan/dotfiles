vim.o.background = "light"

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

require('hardline').setup {
  bufferline = true,
  theme = 'codeschool_light'
}
