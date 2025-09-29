vim.g.foldmethod = "marker"
vim.opt.number = false
vim.opt.relativenumber = false
vim.opt.clipboard = ""
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.g.tex_flavor = "latex"

-- -- Enable undo after file reopening
vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.backup = false
vim.opt.writebackup = false

vim.mouse = 'a' -- enable mouse for all available modes

-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99    -- Open all folds by default

vim.opt.termguicolors = true
vim.opt.autowriteall = true



-- Appearance
vim.opt.breakindent   = true -- indent wrappend lines
vim.opt.cursorline    = true
vim.opt.linebreak     = true
vim.opt.splitbelow    = true
vim.opt.splitright    = true

vim.opt.ruler         = false -- no position in command line
vim.opt.showmode      = false -- don't show mode in command line.
vim.opt.signcolumn    = "yes:1"

-- Edit
vim.opt.ignorecase    = true
vim.opt.incsearch     = true
vim.opt.infercase     = true
vim.opt.smartcase     = true
vim.opt.smartindent   = true
vim.opt.splitkeep     = 'screen' -- less scroll during window split
vim.opt.virtualedit   = 'block'  -- allow past line end in visual block mode

vim.opt.background    = 'dark'
vim.opt.termguicolors = true
vim.opt.lazyredraw    = true
vim.opt.scrolloff     = 5
vim.opt.updatetime    = 100
