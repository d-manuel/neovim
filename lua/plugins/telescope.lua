return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim' },
	config = function()
		vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = "Telescope: Find files" })
		vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "Telescope: help" })
		vim.keymap.set("n", "<leader>fb", require('telescope.builtin').builtin, { desc = "Telescope: all builtins" })
		vim.keymap.set("n", "<leader>fr", require('telescope.builtin').lsp_references, { desc = "Telescope: lsp references" })
		vim.keymap.set("n", "<leader>fo", require('telescope.builtin').oldfiles, { desc = "Telescope: old files" })
		vim.keymap.set("n", "<leader>fR", require('telescope.builtin').resume, { desc = "Telescope: resume" })

		vim.keymap.set("n", "<leader>fs", function()
			require("telescope.builtin").lsp_document_symbols({
				symbols = { "method", "function" },
				symbol_width = 0.7
			})
		end, { desc = "Telescope: symbols" })
		vim.keymap.set("n", "<leader>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath('config')
			}
		end, { desc = "Telescope: neovim config" })
		vim.keymap.set("n", "<leader><leader>", function()
			require('telescope.builtin').buffers({
				sort_mru = true,
				sort_lastused = true,
			})
		end, { desc = "Telescope: buffers" })
		vim.keymap.set("n", "<leader>fg", require("misc.telescope-multigrep").live_multigrep,
			{ desc = "Telescope: multigrep" })
		vim.keymap.set("n", "<leader>fj", require('telescope.builtin').jumplist, { desc = "Telescope: jumplist" })
		vim.keymap.set("n", "<leader>fm", require('telescope.builtin').marks, { desc = "Telescope: marks" })
		vim.keymap.set("n", "<leader>fd", require('telescope.builtin').diagnostics, { desc = "Telescope: diagnostics" })
		require("telescope").load_extension("ui-select")
		require("telescope").setup {
			defaults = {
				layout_strategy = 'vertical',
				layout_config = {
					height = 0.95,
					-- preview_height = 0.5
				}
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							-- allow closing buffers from the buffers picker
							["<c-d>"] = require("telescope.actions").delete_buffer,
						}
					}
				}
			}
		}
	end
}
