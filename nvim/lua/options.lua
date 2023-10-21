-- General
vim.opt.mouse='a'                  -- mouse working on all modes
vim.opt.modeline = false      -- automatically setting options from modelines
vim.opt.report=0                 -- Don't report on line changes
vim.opt.hidden = true          -- hide buffers when abandoned instead of unload
vim.opt.fileformats= { 'unix', 'dos', 'mac' } -- Use Unix as the standard file type
vim.opt.synmaxcol=1000           -- Don't syntax highlight long lines
-- vim.opt.formatoptions+=1         -- Don't break lines after a one-letter word
-- vim.opt.formatoptions-=t         -- Don't auto-wrap text
vim.opt.encoding='utf-8'           -- utf-8 please
vim.opt.cursorline = true        -- makes easier to find cursor on big monitor
vim.opt.history=10000            -- keeep 10000 last commands in memory
vim.opt.laststatus=2             -- always show a status line
vim.opt.showmode = false         -- not showing mode at message, airline will be already showing it
vim.opt.number = true            -- always show line numbers
vim.opt.splitbelow = true        -- splits the way I like
vim.opt.splitright = true        -- splits the way I like
vim.opt.lazyredraw = false       -- to be able to run a macro several times more quickly

-- Searching
vim.opt.magic = true  -- Magic
vim.opt.ignorecase = true -- Search ignoring case
vim.opt.infercase = true -- Adjust case in insert completion mode
vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true -- Highlight search results
vim.opt.wrapscan = true -- Searches wrap around the end of the file
vim.opt.showmatch = true -- Jump to matching bracket
-- set matchpairs+=<:> " Add HTML brackets to pair matching
-- set matchtime=1     " Tenths of a second to show the matching paren
-- set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed

-- Tabs and Indents {{{
vim.opt.expandtab = true -- Expand tabs to spaces.fftpl
vim.opt.tabstop=4       -- The number of spaces a tab is
vim.opt.softtabstop=4   -- While performing editing operations
vim.opt.shiftwidth=2    -- Number of spaces to use in auto(indent)
vim.opt.smarttab = true  -- Tab insert blanks according to 'shiftwidth'
vim.opt.autoindent = true -- Use same indenting on new lines
vim.opt.smartindent = true -- Smart autoindenting on new lines
vim.opt.shiftround = true -- Round indent to multiple of 'shiftwidth'

-- filetype plugin indent on

-- " showing invisible characters {{{
-- set listchars=eol:$,tab:>>,nbsp:¯,trail:·,extends:»,precedes:«

vim.cmd [[
set directory=~/dotfiles/nvim/swapdir//    " keep swap files, extra / is to put páth with the filenames
set undodir=~/dotfiles/nvim/undodir/     " directory for persistent undo
]]

-- undo & backup {{{
vim.opt.backup = false                  -- git and persistent undo should be enough
vim.opt.writebackup = true               -- protect against crashes
vim.opt.swapfile = true                  -- avoid that two different instances of vim write the same file
vim.opt.undolevels=10000000             -- a lot of undo
vim.opt.undofile = true                  -- persistent undo, write undo at disk

-- linguagem
vim.opt.spelllang={ 'en_us','pt_br' }
vim.opt.spell = true

-- editorconfig
vim.g.editorconfig = true
