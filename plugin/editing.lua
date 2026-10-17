vim.pack.add({
	{src="https://github.com/tommcdo/vim-exchange" },
	{src="https://github.com/d-manuel/includeguards.nvim" }
})

require("includeguards").setup({})
vim.keymap.set("n", "<leader>hg", function() require("includeguards").addIncludeguards() end)
