-- gopls — Go Language Server
-- Managed by Mason. Config picked up automatically via vim.lsp.enable("gopls").
-- gopls handles multi-version projects by reading go.mod and using the `go`
-- binary in PATH (resolved by mise/asdf per project directory).
local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"

return {
	cmd = { mason_bin .. "gopls" },
	filetypes = { "go", "gomod", "gosum", "gowork" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
				nilness = true,
				unusedwrite = true,
				useany = true,
			},
			staticcheck = true,
			gofumpt = true,
			usePlaceholders = true,
			completeUnimported = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
