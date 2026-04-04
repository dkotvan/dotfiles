-- bash-language-server
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

return {
	cmd = { mason_bin .. "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
}
