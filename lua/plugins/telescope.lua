return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = 'make' }
	},
	config = function()
		vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
		vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep)
		vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
		vim.keymap.set("n", "<leader>fb", require('telescope.builtin').builtin)
		vim.keymap.set("n", "<leader>fr", require('telescope.builtin').lsp_references)
		vim.keymap.set("n", "<leader>fs", function()
			require("telescope.builtin").lsp_document_symbols({
				symbols = { "method", "function" }
			})
		end, opts)
		vim.keymap.set("n", "<leader>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath('config')
			}
		end)
		vim.keymap.set("n","<leader>b",require('telescope.builtin').buffers)
	end
}
