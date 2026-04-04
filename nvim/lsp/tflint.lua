-- tflint
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

return {
	cmd = { mason_bin .. "tflint", "--langserver" },
	filetypes = { "terraform", "terraform-vars", "hcl" },
	root_markers = { ".tflint.hcl", ".git" },
}
