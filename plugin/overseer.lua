vim.pack.add({
	{ src = "https://github.com/stevearc/overseer.nvim" }
})

require('overseer').setup {
	task_list = {
		min_height = 30,
	}
}

vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle!<cr>", { desc = "OverseerToggle" })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { desc = "OverseerRun" })
vim.keymap.set("n", "<leader>od", "<cmd>OverseerRun 'make<cr>", { desc = "make" })
vim.keymap.set("n", "<leader>oa", "<cmd>Overseer run 'make test<cr>", { desc = "OverseerRun" })
