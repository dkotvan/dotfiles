-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_picker = "fzf"

vim.opt.mouse = "a" -- mouse working on all modes
vim.opt.modeline = false -- automatically setting options from modelines
vim.opt.report = 0 -- Don't report on line changes
vim.opt.hidden = true -- hide buffers when abandoned instead of unload
vim.opt.fileformats = { "unix", "dos", "mac" } -- Use Unix as the standard file type
vim.opt.synmaxcol = 1000 -- Don't syntax highlight long lines
vim.opt.encoding = "utf-8" -- utf-8 please
vim.opt.cursorline = true -- makes easier to find cursor on big monitor
vim.opt.history = 10000 -- keeep 10000 last commands in memory
vim.opt.laststatus = 2 -- always show a status line
vim.opt.showmode = false -- not showing mode at message, airline will be already showing it
vim.opt.number = true -- always show line numbers
vim.opt.splitbelow = true -- splits the way I like
vim.opt.splitright = true -- splits the way I like
vim.opt.lazyredraw = false -- to be able to run a macro several times more quickly

-- Searching
vim.opt.magic = true -- Magic
vim.opt.ignorecase = true -- Search ignoring case
vim.opt.infercase = true -- Adjust case in insert completion mode
vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true -- Highlight search results
vim.opt.wrapscan = true -- Searches wrap around the end of the file
vim.opt.showmatch = true -- Jump to matching bracket

-- Tabs and Indents {{{
vim.opt.expandtab = false -- Expand tabs to spaces.fftpl
vim.opt.tabstop = 4 -- The number of spaces a tab is
vim.opt.softtabstop = 4 -- While performing editing operations
vim.opt.shiftwidth = 2 -- Number of spaces to use in auto(indent)
vim.opt.smarttab = true -- Tab insert blanks according to 'shiftwidth'
vim.opt.autoindent = true -- Use same indenting on new lines
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'

vim.cmd([[
set directory=~/.cache/swapdir//    " keep swap files, extra / is to put páth with the filenames
set undodir=~/.cache/undodir/     " directory for persistent undo
]])

-- undo & backup {{{
vim.opt.backup = false -- git and persistent undo should be enough
vim.opt.writebackup = true -- protect against crashes
vim.opt.swapfile = true -- avoid that two different instances of vim write the same file
vim.opt.undolevels = 10000000 -- a lot of undo
vim.opt.undofile = true -- persistent undo, write undo at disk
