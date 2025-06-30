vim.g.foldmethod = "marker"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = ""
vim.opt.signcolumn = "yes:1"
vim.opt.shiftwidth = 2
vim.g.tex_flavor = "latex"

-- -- Enable undo after file reopening
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- Fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Don't enable folding automatically
vim.opt.foldlevel = 99     -- Open all folds by default
