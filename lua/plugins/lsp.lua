return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require('lint').linters_by_ft = {
				cpp = { 'cppcheck' }, -- cpplint
				-- python = { 'ruff' },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end
	},
	{
		'stevearc/conform.nvim',
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					python = { "ruff_format", "ruff_fix", "ruff_organize_imports" },
					cpp = { "clang-format" }
				},
			})
			vim.keymap.set("n", "<leader>cF", function() conform.format() end, { desc = "Format File Conform" })

			-- Remark: the format on save is configured in autocommands.lua
		end
	}
}
