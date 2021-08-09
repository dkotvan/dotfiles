require('go').setup({
  goimport='gofumports', -- goimport command
  gofmt = 'gofumpt', --gofmt cmd,
  max_line_line = 120,
  tag_transform = false,
  test_dir = '',
  comment_placeholder = '   ',
  lsp_cfg = true, -- false: use your own lspconfig
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- use on_attach from go.nvim
  dap_debug = true,
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
})

require('lspconfig').gopls.setup{}
vim.cmd [[
set noexpandtab
set tabstop=4
set shiftwidth=4
]]

