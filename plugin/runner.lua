vim.pack.add({
	{ src = "https://github.com/tpope/vim-dispatch" },
	{ src = "https://github.com/stevearc/overseer.nvim" },
})

vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { desc = "OverseerToggle" })
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr><cmd>OverseerOpen!<cr>", { desc = "OverseerRun" })
require('overseer').setup {
	task_list = {
		min_height = 30,
	}
}
