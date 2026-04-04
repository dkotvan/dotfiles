-- terraform-ls
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

return {
	cmd = { mason_bin .. "terraform-ls", "serve" },
	filetypes = { "terraform", "terraform-vars", "hcl" },
	root_markers = { ".terraform", ".git" },
}
