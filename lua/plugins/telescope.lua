return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim'
	},
	config = function()
		vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc= "Telescope: Find files"})
		vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, {desc = "Telescope: help"})
		vim.keymap.set("n", "<leader>fb", require('telescope.builtin').builtin, {desc = "Telescope: all builtins"})
		vim.keymap.set("n", "<leader>fr", require('telescope.builtin').lsp_references, {desc = "Telescope: lsp references"})
		vim.keymap.set("n", "<leader>fo", require('telescope.builtin').oldfiles, {desc = "Telescope: old files"})
		vim.keymap.set("n", "<leader>fs", function()
			require("telescope.builtin").lsp_document_symbols({
				symbols = { "method", "function" }
			})
		end, {desc = "Telescope: symbols"})
		vim.keymap.set("n", "<leader>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath('config')
			}
		end, {desc = "Telescope: neovim config"})
		vim.keymap.set("n", "<leader>b", require('telescope.builtin').buffers, {desc = "Telescope: buffers"})
		vim.keymap.set("n","<leader>fg", require("misc.telescope-multigrep").live_multigrep, {desc ="Telescope: multigrep"})
		-- allow closing buffers from the buffers picker
		require("telescope").setup {
			defaults = {
				layout_strategy = 'vertical',
				layout_config = {
					height = 0.95,
					preview_height = 0.7
				}
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-d>"] = require("telescope.actions").delete_buffer,
						}
					}
				}
			}
		}
	end
}
