" General {{{
syntax on
set mouse=a
set nomodeline               " automatically setting options from modelines
set report=0                 " Don't report on line changes
set hidden                   " hide buffers when abandoned instead of unload
set fileformats=unix,dos,mac " Use Unix as the standard file type
set synmaxcol=1000           " Don't syntax highlight long lines
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set encoding=utf-8           " utf-8 please
set cursorline               " makes easier to find cursor on big monitor
set history=10000            " keeep 10000 last commands in memory
set laststatus=2             " always show a status line
set noshowmode               " not showing mode at message, airline will be already showing it
set number                   " always show line numbers
set splitbelow               " splits the way I like
set splitright               " splits the way I like
set lazyredraw               " to be able to run a macro several times more quickly
" }}}

" Searching {{{
set magic
set ignorecase      " Search ignoring case
set infercase       " Adjust case in insert completion mode
set incsearch       " Incremental search
set hlsearch        " Highlight search results
set wrapscan        " Searches wrap around the end of the file
set showmatch       " Jump to matching bracket
set matchpairs+=<:> " Add HTML brackets to pair matching
set matchtime=1     " Tenths of a second to show the matching paren
set cpoptions-=m    " showmatch will wait 0.5s or until a char is typed
" }}}

" Tabs and Indents {{{
set expandtab       " Expand tabs to spaces.
set tabstop=2       " The number of spaces a tab is
set softtabstop=2   " While performing editing operations
set shiftwidth=2    " Number of spaces to use in auto(indent)
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smartindent     " Smart autoindenting on new lines
set shiftround      " Round indent to multiple of 'shiftwidth'
" }}}

filetype plugin indent on

" fancy menu on autocomplete {{{
set wildchar=<Tab> wildmenu wildmode=full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX specific files
" }}}

" showing invisible characters {{{
set listchars=eol:$,tab:>>,nbsp:¯,trail:·,extends:»,precedes:«
" }}}

" undo & backup {{{
set nobackup                        " git and persistent undo should be enough
set writebackup                     " protect against crashes
set swapfile                        " avoid that two different instances of vim write the same file
set directory=$MYVIMPATH/swapdir//    " keep swap files, extra / is to put páth with the filenames
set undolevels=10000000             " a lot of undo
set undodir=$MYVIMPATH/undodir/       " directory for persistent undo
set undofile                        " persistent undo, write undo at disk
" }}}

" linguagem
set spelllang=en_us,pt_br
set spell

