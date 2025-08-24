-- format options
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.shiftround = true                       -- Round indent to multiple of 'shiftwidth'.
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
vim.opt.smarttab = true                         --
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.cindent = true                          -- Works more cleverly than the other two and is configurable to different indenting styles.
vim.opt.cinoptions = 'g0,t0,l1,(0'              -- see cinoptions-values for details
vim.opt.backspace = 'indent,eol,start'          -- allow backspacing over autoindent, EOL, and BOL

-- search options
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.smartcase = true                        -- smart case
vim.opt.incsearch = true                        -- incremental search
vim.opt.hlsearch = false                        -- highlight all matches on previous search pattern

-- view options
vim.opt.cmdheight = 0                           -- neovim command line for displaying messages
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- set number column width {default 4}
vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.signcolumn = 'yes'                      -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- companion to wrap, don't split words
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8                       -- minimal number of screen columns either side of cursor if wrap is `false`
vim.opt.listchars = 'tab:▷⋅,nbsp:⋅,eol:⏎'       -- unicode version, show tabs, mark eol with ¬
vim.opt.list = true                             -- show list charactors
vim.opt.hidden = true                           -- keep history even after switch buffer
vim.opt.laststatus = 0                          -- 0 = never, 1 = only if there are at least two windows, 2 = always, 3 = always and only the last window
vim.opt.fillchars = 'stl:─,stlnc:─,horiz:─,horizup:┴,horizdown:┬,vert:│,vertleft:┤,vertright:├,verthoriz:┼'

-- other options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = 'unnamed'                   -- allows neovim to access the system clipboard
vim.opt.fileencoding = 'utf-8'                  -- the encoding written to a file
vim.opt.mouse = ''                              -- disable the mouse to be used in neovim
vim.opt.showcmd = true                          -- Show (partial) command in the last line of the screen.
vim.opt.showmode = true                         -- see things like -- INSERT --
vim.opt.showtabline = 2                         -- always show tabs - 0: never, 1: only if there are at least two tab page labels, 2: always
vim.opt.splitbelow = false                      -- force all horizontal splits to go below current window
vim.opt.splitright = false                      -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.timeoutlen = 300                        -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.wildmode = 'longest,list'
