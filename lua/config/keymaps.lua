vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", {desc = "Source current lua file"})
vim.keymap.set("n", "<leader>x", ":.lua<CR>", {desc = "Run current lua line"})
vim.keymap.set("v", "<leader>x", ":lua<CR>", {desc = "Run current lua line"})

--  jk to leave insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Leave insert mode", remap = true })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Leave insert mode", remap = true })

-- clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- yank a line but you can paste it inline then
vim.keymap.set({ "n", "v" }, "Y", "^y$", { desc = "yank line but be able to paste it inline afterwards" })



-- Safe all files with C-S and <Leader>s
vim.keymap.set("n", "<leader>s", "<cmd>wa<CR>", { desc = "Save all open buffers"})
vim.keymap.set("n", "<C-s>", "<cmd>wa<CR>", {desc = "Save all open buffers"})

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>confirm qa<CR>", {desc = "Quit neovim"})
-- buffer movement
-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "H", "<cmd>bprev<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "L", "<cmd>bnext<CR>", {desc = "Prev buffer"})

--QuickFix List
-- Note: Ctrl+q in telescope to put it in the quickfix list
vim.keymap.set({ "n", "i" }, "<M-j>", "<cmd>cnext<CR>", {desc = "Next quicklist entry"})
vim.keymap.set({ "n", "i" }, "<M-k>", "<cmd>cprev<CR>", {desc = "Prev quicklist entry"})


-- pasting into selection does not put into clipboard
vim.keymap.set('x', 'p', '"_dP', { noremap = true, silent = true })


-- navigate Splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true },{ desc = "Focus split left"})
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true },{ desc = "Focus split down"})
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true },{ desc = "Focus split up"})
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true },{ desc = "Focus split right"})


vim.keymap.set("n", "<leader>uz", "<C-w>_<C-w>|", {desc = "Zoom"})
vim.keymap.set("n", "<leader>=", "<C-w>=", {desc = "Reset Zoom"})

-- Hide the status bar for even more vertical space
local statusbarHidden = false
vim.keymap.set({ "n" }, "<leader>us", function()
	if statusbarHidden then
		vim.opt.laststatus = 2
		statusbarHidden = false
	else
		vim.opt.laststatus = 0
		statusbarHidden = true
	end
end, {desc = "Hide Statusbar"})
