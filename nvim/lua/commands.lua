local function feedkeys(cmd)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), 'n', false)
end

local create_cmd = vim.api.nvim_create_user_command

-- Git (Fugitive wrappers with descriptions for Command Palette)
create_cmd('GitPull', 'Git! pull', { desc = 'Git pull' })
create_cmd('GitPullRebase', 'Git! pull --rebase', { desc = 'Git pull with rebase' })
create_cmd('GitPush', 'Git! push', { desc = 'Git push' })
create_cmd('GitPushNewBranch', 'Git! push -u origin HEAD', { desc = 'Git push new branch' })
create_cmd('GitPushForce', 'Git! push --force', { desc = 'Git push --force' })
create_cmd('GitRebaseInteractive', function() feedkeys(':Git rebase --interactive ') end, { desc = 'Git rebase interactive' })
create_cmd('GitRebaseInteractiveMain', 'Git rebase --interactive main', { desc = 'Git rebase interactive main' })

-- Search & Replace
create_cmd('SpectreOpen', function() require('spectre').open() end, { desc = 'Spectre search replace' })


