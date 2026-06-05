return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },

    init = function()
      require("custom.claudecode-fixes")
    end,

    opts = {
      port_range               = { min = 10000, max = 65535 },
      auto_start               = true,
      log_level                = "info",
      terminal_cmd             = nil,
      track_selection          = true,
      visual_demotion_delay_ms = 50,
      focus_after_send         = false,
      connection_wait_delay    = 200,
      connection_timeout       = 10000,

      terminal = {
        split_side             = "right",
        split_width_percentage = 0.35,
        provider               = "snacks",
        auto_close             = true,
        git_repo_cwd           = true,
        snacks_win_opts = {
          keys = {
            nav_w = {
              "<C-w><C-w>",
              function()
                vim.cmd("wincmd w")
              end,
              mode = "t",
              desc = "Go to next window",
            },
          },
        },
      },

      diff_opts = {
        layout                   = "vertical",
        open_in_new_tab          = false,
        keep_terminal_focus      = false,
        hide_terminal_in_new_tab = false,
      },
    },

    keys = {
      { "<leader>a",  nil,                                   desc = "AI / Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>",                 desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",            desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",        desc = "Resume session" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>",      desc = "Continue session" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>",      desc = "Select model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",            desc = "Add current buffer" },
      { "<leader>aB", function()
          local seen = {}
          for _, nr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(nr) and vim.bo[nr].buflisted and vim.bo[nr].buftype == "" then
              local rel = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(nr), ":.")
              if rel ~= "" and not seen[rel] then
                seen[rel] = true
                vim.cmd("ClaudeCodeAdd " .. vim.fn.fnameescape(rel))
              end
            end
          end
        end,                                                 desc = "Add ALL open buffers" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection" },
      {
        "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",
        ft   = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
        desc = "Add file (tree)",
      },
      { "<leader>a@", function() require("custom.claudecode-fixes").claude_at_picker() end,
                                                             desc = "@ picker (buffers first)" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",       desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",         desc = "Deny diff" },
      { "<leader>yr", function() require("custom.yank").yank_with_path(false) end,
                                         mode = "v",         desc = "Yank + relative path" },
      { "<leader>ya", function() require("custom.yank").yank_with_path(true) end,
                                         mode = "v",         desc = "Yank + absolute path" },
    },
  },

  {
    "pittcat/claude-fzf.nvim",
    dependencies = { "ibhagwan/fzf-lua", "coder/claudecode.nvim" },
    opts = {
      auto_open_terminal = false,
      auto_context       = true,
      batch_size         = 10,
      logging            = { level = "WARN" },
    },
  },

  {
    "pittcat/claude-fzf-history.nvim",
    dependencies = { "ibhagwan/fzf-lua", "coder/claudecode.nvim" },
    opts = { logging = { level = "WARN" } },
  },
}
