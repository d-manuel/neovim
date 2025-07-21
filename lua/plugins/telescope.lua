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
		vim.keymap.set("n", "<leader>fo", require('telescope.builtin').oldfiles)
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
		vim.keymap.set("n", "<leader>b", require('telescope.builtin').buffers)
		require("misc.telescope-multigrep").setup()
		-- allow closing buffers from the buffers picker
		local actions = require "telescope.actions"
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
							["<c-d>"] = actions.delete_buffer + actions.move_to_top,
						}
					}
				}
			}
		}
	end
}
