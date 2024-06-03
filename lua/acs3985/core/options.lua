local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

--tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.autoindent = true

-- line wraping
opt.wrap = false

--search settings

opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- apoearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspacee
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- "-" this will considered as one word

-- GENERAL
opt.timeoutlen = 3000 -- time to wait for a mapped sequence to complete in miliseconds
opt.updatetime = 200 -- faster completion (4000ms default)
opt.swapfile = true -- creates a swapfile
opt.undofile = true -- enable persistent undo
opt.writebackup = false -- if a file is being edited by another program, it is not allowed to be edited

-- APPEARANCE
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.numberwidth = 2 -- set number column width to 2 {default 4}
opt.cmdheight = 1 -- space in the neovim command line for displaying messages
opt.pumheight = 7 -- pop up menu height
opt.showmode = true -- we don't need to see things like -- INSERT -- anymore
opt.scrolloff = 7 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 7 -- minimal number of screen columns either side of cursor if wrap is `false`
opt.shortmess = "filnxtToOFc" -- which errors to suppress
opt.mousemoveevent = true

-- EDIT
opt.spell = true -- turns on spellchecker
opt.spelllang = { "en_gb" } -- sets spelling dictionary
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.mousescroll = "ver:2,hor:4" -- change the speed of the scroll wheel
opt.ignorecase = true -- ignore case in search patterns
opt.smartcase = true -- smart case
opt.virtualedit = "block" -- vitualblock mode doesn't get stuck at the end of line
opt.inccommand = "split" -- shows all inline replacements in split
