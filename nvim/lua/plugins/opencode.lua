return {
	{
		"sudo-tee/opencode.nvim",
		cmd = "Opencode",

		dependencies = {
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "markdown", "opencode_output" },
				},
				ft = { "markdown", "opencode_output" },
			},
		},

		opts = {
			preferred_picker = "fzf-lua",
			preferred_completion = "blink",
			default_mode = "build",

			ui = {
				position = "right",
				window_width = 0.40,
			},

			keymap = {
				input_window = {
					["<esc>"] = false,
				},
				output_window = {
					["<esc>"] = false,
				},
			},
		},

		keys = {
			{ "<leader>o", nil, desc = "Opencode" },
		},
	},
}
