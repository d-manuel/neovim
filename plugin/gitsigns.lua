vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" }
})

vim.keymap.set('n', "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", { desc = "next hunk" })
vim.keymap.set('n', "<leader>gp", "<cmd>Gitsigns prev_hunk<CR>", { desc = "prev hunk" })
vim.keymap.set('n', "]h", "<cmd>Gitsigns next_hunk<CR>", { desc = "next hunk" })
vim.keymap.set('n', "[h", "<cmd>Gitsigns prev_hunk<CR>", { desc = "prev hunk" })
vim.keymap.set('n', "<leader>Gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "toggle blame line" })
