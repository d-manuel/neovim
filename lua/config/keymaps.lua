vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")
-- vim.keymap.set("n", "<leader>er", ":echo nvim_list_runtime_paths()<CR>")

--  jk to leave insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Leave insert mode", remap = true })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Leave insert mode", remap = true })

-- clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- yank a line but you can paste it inline then
vim.keymap.set({"n","v"}, "Y", "^y$", { desc = "yank line but be able to paste it inline afterwards" })



-- Safe all files with C-S and <Leader>s
vim.keymap.set("n", "<leader>s", "<cmd>wa<CR>")
vim.keymap.set("n", "<C-s>", "<cmd>wa<CR>")

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>q<CR>")

-- buffer movement
-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "H", "<cmd>bprev<CR>")
vim.keymap.set("n", "L", "<cmd>bnext<CR>")

--QuickFix List
-- Note: Ctrl+q in telescope to put it in the quickfix list
vim.keymap.set({ "n", "i" }, "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set({ "n", "i" }, "<M-k>", "<cmd>cprev<CR>")



-- Hide the status bar for even more verticla
local statusbarHidden = false
vim.keymap.set({ "n" }, "<leader>us", function()
	if statusbarHidden then
		vim.opt.laststatus = 2
		statusbarHidden = false
	else
		vim.opt.laststatus = 0
		statusbarHidden = true
	end
end)
