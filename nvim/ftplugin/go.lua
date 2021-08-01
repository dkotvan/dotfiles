require('go').setup{
  auto_format = true,
  auto_lint = false, 
  linter = 'golint',
  lint_prompt_style = 'qf',
  formatter = 'goimports',
  test_flags = {'-v'},
  test_timeout = '30s',
  test_env = {},
  test_popup = true,
  test_popup_width = 100,
  test_popup_height = 10,
  tags_name = 'json',
  tags_options = {'json=omitempty'},
  tags_transform = 'snakecase',
  tags_flags = {'-skip-unexported'},
  quick_type_flags = {'--just-types'},
}

require('lspconfig').gopls.setup{}
