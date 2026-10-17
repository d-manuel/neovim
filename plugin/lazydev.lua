vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim" }
})

-- Call setup only on lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	once = true,
	callback = function()
		vim.notify("hello")
		require("lazydev").setup({
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			}
		})
	end,
})
