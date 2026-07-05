return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local wk = require("which-key")
            wk.setup({ notify = false })

            wk.add({
                -- Visual mode
                { "<CR>", '"+y', desc = "copy to clipboard", mode = "v" },

                -- Normal mode: buffer/tab navigation
                { "]b", ":bnext<cr>",       desc = "next buffer" },
                { "]t", ":tabnext<cr>",     desc = "next tab" },
                { "[b", ":bprevious<cr>",   desc = "previous buffer" },
                { "[t", ":tabprevious<cr>", desc = "previous tab" },

                -- Terminal mode: window navigation (escape terminal insert mode first)
                {
                    mode = { "t" },
                    { "<C-w><Esc>",    [[<C-\><C-N><Esc>]],      desc = "escape terminal",  noremap = true },
                    { "<C-w><C-w>",    [[<C-\><C-N><C-w><C-w>]], desc = "next window",      noremap = true },
                    { "<C-w>h",        [[<C-\><C-N><C-w>h]],     desc = "window left",      noremap = true },
                    { "<C-w>j",        [[<C-\><C-N><C-w>j]],     desc = "window down",      noremap = true },
                    { "<C-w>k",        [[<C-\><C-N><C-w>k]],     desc = "window up",        noremap = true },
                    { "<C-w>l",        [[<C-\><C-N><C-w>l]],     desc = "window right",     noremap = true },
                    { "<C-w><Up>",     [[<C-\><C-N><C-w><Up>]],  desc = "window up",        noremap = true },
                    { "<C-w><Down>",   [[<C-\><C-N><C-w><Down>]],desc = "window down",      noremap = true },
                    { "<C-w><Left>",   [[<C-\><C-N><C-w><Left>]],desc = "window left",      noremap = true },
                    { "<C-w><Right>",  [[<C-\><C-N><C-w><Right>]],desc = "window right",    noremap = true },
                    { "<C-w><C-Up>",   [[<C-\><C-N><C-w><Up>]],  desc = "window up",        noremap = true },
                    { "<C-w><C-Down>", [[<C-\><C-N><C-w><Down>]],desc = "window down",      noremap = true },
                    { "<C-w><C-Left>", [[<C-\><C-N><C-w><Left>]],desc = "window left",      noremap = true },
                    { "<C-w><C-Right>",[[<C-\><C-N><C-w><Right>]],desc = "window right",    noremap = true },
                    { "<C-P>",         [[<C-\><C-N><Esc><C-P>]], desc = "command history",   noremap = true },
                },

                -- Leader: general
                { "<leader>w", ":set list!<cr>",                                                     desc = "toggle whitespace symbols" },
                { "<leader>l", ":nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>",      desc = "clean search" },

                -- Space prefix: LSP actions
                { "<Space>c",  group = "code" },
                { "<Space>ca", vim.lsp.buf.code_action,                                              desc = "code action" },
                { "<Space>w",  group = "workspace" },
                { "<Space>wa", vim.lsp.buf.add_workspace_folder,                                     desc = "add workspace folder" },
                { "<Space>wr", vim.lsp.buf.remove_workspace_folder,                                  desc = "remove workspace folder" },
                { "<Space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, desc = "list workspace folders" },
                { "<Space>l",  group = "lens" },
                { "<Space>la", vim.lsp.codelens.run,                                                 desc = "run code lens" },
                { "<Space>D",  vim.lsp.buf.type_definition,                                          desc = "type definition" },
                { "<Space>f",  group = "format" },
                { "<Space>ff", function() require("conform").format() end,                           desc = "format" },
                { "<Space>rn", vim.lsp.buf.rename,                                                   desc = "rename" },

                -- g prefix: LSP navigation
                { "g",   group = "go to" },
                { "gx",  desc = "open URL under cursor" },  -- built-in, passthrough (which-key won't block it)
                { "gr",  function() Snacks.picker.lsp_references() end,        desc = "LSP references" },
                { "g0",  function() Snacks.picker.lsp_symbols() end,           desc = "LSP document symbols" },
                { "gW",  function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
                { "gd",  vim.lsp.buf.definition,                               desc = "LSP definition" },
                { "gD",  vim.lsp.buf.declaration,                              desc = "LSP declaration" },
                { "gp",  function() Snacks.picker.lsp_definitions() end,       desc = "LSP definition preview" },
                { "gi",  vim.lsp.buf.implementation,                           desc = "LSP implementation" },
                { "gL",  vim.diagnostic.open_float,                            desc = "show diagnostics" },
                { "gG",  vim.diagnostic.setloclist,                            desc = "buffer diagnostics list" },

                -- Diagnostics navigation
                { "<F2>",   function() vim.diagnostic.jump({ count = 1 }) end,  desc = "next diagnostic" },
                { "<S-F2>", function() vim.diagnostic.jump({ count = -1 }) end, desc = "prev diagnostic" },
                { "[d",     function() vim.diagnostic.jump({ count = -1 }) end, desc = "prev diagnostic" },
                { "]d",     function() vim.diagnostic.jump({ count = 1 }) end,  desc = "next diagnostic" },
                { "<C-k>",  vim.lsp.buf.signature_help,                         desc = "signature help" },

                -- Trouble
                { "<leader>x",  group = "trouble" },
                { "<leader>xx", function() require("trouble").toggle() end,                          desc = "toggle" },
                { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end,   desc = "workspace diagnostics" },
                { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,    desc = "document diagnostics" },
                { "<leader>xq", function() require("trouble").toggle("quickfix") end,                desc = "quickfix" },
                { "<leader>xl", function() require("trouble").toggle("loclist") end,                 desc = "loclist" },
            })
        end,
    },
}
