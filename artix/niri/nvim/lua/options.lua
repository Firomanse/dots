require('globals')

-- Leader
g.mapleader = ' '


-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.showmatch  = true
opt.hlsearch   = true

-- Tabs
opt.tabstop     = 2
opt.shiftwidth  = 2
opt.expandtab   = true
opt.smartindent = true

-- Columns
opt.number         = true
opt.relativenumber = true
opt.numberwidth    = 1

-- Split
opt.splitright = true
opt.splitbelow = true
opt.splitkeep  = 'screen'

-- Cursor
opt.cursorline   = true
opt.cursorcolumn = false

-- Hidden symbols
opt.list = true
opt.listchars = {
  trail = '-', -- space after line
  tab   = '>·',
  nbsp  = '␣',  -- nobreak spaces?
}

-- Other
-- Clipboard
opt.clipboard = 'unnamedplus'

-- No autocomment
cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]] -- noautocomment after commentary

-- Columns highlight
opt.cc = '80,81,82,83,84,85,86,87,88,89,90'

-- for last versions
opt.termguicolors = true -- actual colors
opt.signcolumn = "yes"   -- column for gitsigns/todo-comments
opt.updatetime = 300     -- bg screen update time
