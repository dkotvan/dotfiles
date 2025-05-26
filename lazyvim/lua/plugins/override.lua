return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  {
    "zbirenbaum/copilot.lua",
    opts = {
      filetypes = {
        sh = function()
          if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
            return false
          end
          return true
        end,
        ["*"] = function()
          local home = os.getenv("HOME")
          local ignored_paths = {
            home .. "/.ssh/",
            home .. "/.aws/",
            home .. "/.config/lab",
            home .. "/.netrc",
            home .. "/.kube",
            home .. "/.docker",
          }
          local current_path = vim.api.nvim_buf_get_name(0)
          for _, path in ipairs(ignored_paths) do
            if string.match(current_path, path) then
              return false
            end
          end
          return true
        end,
      },
    },
  },

  -- timn pope's fugitive
  { "tpope/vim-fugitive" },

  -- Piin mason om v1
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
}
