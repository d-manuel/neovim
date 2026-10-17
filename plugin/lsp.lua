vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require('lint').linters_by_ft = {
	cpp = { 'cppcheck' }, -- cpplint
	-- python = { 'ruff' },
}
vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
		cpp = { "clang-format" }
	},
})
vim.keymap.set("n", "<leader>cF", function() conform.format() end, { desc = "Format File Conform" })
