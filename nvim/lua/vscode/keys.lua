local mapkey = vim.api.nvim_set_keymap

-- make copying to clipboard easier
mapkey('n', '<CR>', '"+y', {noremap = true, silent = false})
mapkey('v', '<CR>', '"+y', {noremap = true, silent = false})

mapkey('n', '<leader>1', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex1\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>2', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex2\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>3', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex3\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>4', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex4\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>5', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex5\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>6', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex6\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>7', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex7\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>8', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex8\')<CR>', {noremap = true, silent = false})
mapkey('n', '<leader>9', '<cmd>:call VSCodeNotify(\'workbench.action.openEditorAtIndex9\')<CR>', {noremap = true, silent = false})

mapkey('o', 'gc', '<Plug>VSCodeCommentary', {noremap = true, silent = false})
mapkey('n', 'gc', '<Plug>VSCodeCommentary', {noremap = true, silent = false})
mapkey('n', 'gcc', '<Plug>VSCodeCommentaryLine', {noremap = true, silent = false})
