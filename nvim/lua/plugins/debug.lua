local function setup_debug()
	local dap = require('dap')

	-- Setup Go DAP adapter first (before dap-go setup)
	if not dap.adapters.go then
		dap.adapters.go = {
			type = 'executable',
			command = 'dlv',
			args = { 'dap', '--listen=127.0.0.1:38697' },
		}
	end

	require("dapui").setup({
		icons = { expanded = "", collapsed = "", current_frame = "" },
		mappings = {
			-- Use a table to apply multiple mappings
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		-- Use this to override mappings for specific elements
		element_mappings = {
			-- Example:
			-- stacks = {
			--   open = "<CR>",
			--   expand = "o",
			-- }
		},
		-- Expand lines larger than the window
		-- Requires >= 0.7
		expand_lines = vim.fn.has("nvim-0.7") == 1,
		-- Layouts define sections of the screen to place windows.
		-- The position can be "left", "right", "top" or "bottom".
		-- The size specifies the height/width depending on position. It can be an Int
		-- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
		-- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
		-- Elements are the elements shown in the layout (in order).
		-- Layouts are opened in order so that earlier layouts take priority in window sizing.
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					{ id = "scopes", size = 0.25 },
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 0.25, -- 25% of total lines
				position = "bottom",
			},
		},
		controls = {
			-- Requires Neovim nightly (or 0.8 when released)
			enabled = true,
			-- Display controls in this element
			element = "repl",
			icons = {
				pause = "",
				play = "",
				step_into = "",
				step_over = "",
				step_out = "",
				step_back = "",
				run_last = "",
				terminate = "",
			},
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "single", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		windows = { indent = 1 },
		render = {
			max_type_length = nil, -- Can be integer or nil.
			max_value_lines = 100, -- Can be integer or nil.
		}
	})
	require('dap').set_log_level('TRACE')
	require('dap-go').setup({
		dap_configurations = {
			{
				type = "go",
				name = "Attach remote",
				mode = "remote",
				request = "attach",
				port = 59360,
				host = "127.0.0.1",
			},
		},
	})

	-- Setup keybindings
	local dapui = require('dapui')

	-- Auto open/close UI
	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close()
	end
end

return {
	{
		"mfussenegger/nvim-dap",
		-- dependencies = {
		-- 	"theHamsta/nvim-dap-virtual-text",
		-- 	-- "nvim-telescope/telescope-dap.nvim",
		-- },
		keys = {
			-- Function keys (like VS Code)
			{ "<F5>", "<cmd>DapContinue<cr>", desc = "Continue" },
			{ "<F9>", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
			{ "<F10>", "<cmd>DapStepOver<cr>", desc = "Step over" },
			{ "<F11>", "<cmd>DapStepInto<cr>", desc = "Step into" },
			{ "<S-F11>", "<cmd>DapStepOut<cr>", desc = "Step out" },
			{ "<S-F5>", "<cmd>DapTerminate<cr>", desc = "Terminate" },
			-- Leader key alternatives (for convenience)
			{ "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
			{ "<leader>dc", "<cmd>DapContinue<cr>", desc = "Continue" },
			{ "<leader>dt", "<cmd>DapTerminate<cr>", desc = "Terminate" },
			{ "<leader>dR", "<cmd>DapToggleRepl<cr>", desc = "Toggle REPL" },
			{ "<leader>dE", "<cmd>DapSetExceptionBreakpoints<cr>", desc = "Set exception breakpoints" },
		},
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		keys = {
			{
				'<leader>dg',
				function()
					require('dap-go').debug_test()
				end,
				mode = { 'n' },
				desc = 'Debug Go test'
			},
			{
				'<leader>dG',
				function()
					require('dap-go').debug_last_test()
				end,
				mode = { 'n' },
				desc = 'Debug last Go test'
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = setup_debug,
		keys = {
			{
				'<leader>dU',
				function()
					require('dapui').toggle()
				end,
				mode = { 'n' },
				desc = 'Toggle debug UI'
			},
			{
				'<leader>dH',
				function()
					require('dapui').eval()
				end,
				mode = { 'n', 'v' },
				desc = 'Evaluate under cursor'
			},
		},
	},
	-- {
	-- 	"theHamsta/nvim-dap-virtual-text",
	-- 	config = function()
	-- 		require("nvim-dap-virtual-text").setup()
	-- 	end,
	-- },
}
