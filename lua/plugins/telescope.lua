return {
	'nvim-telescope/telescope.nvim',
	tag = '0.2.1',
	dependencies = { 'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim' },
	config = function()
		vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files, { desc = "Telescope: Find files" })
		vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "Telescope: help" })
		vim.keymap.set("n", "<leader>fb", require('telescope.builtin').builtin, { desc = "Telescope: all builtins" })
		vim.keymap.set("n", "<leader>fo", require('telescope.builtin').oldfiles, { desc = "Telescope: old files" })
		vim.keymap.set("n", "<leader>fR", require('telescope.builtin').resume, { desc = "Telescope: resume" })

		vim.keymap.set("n", "<leader>en", function()
			require('telescope.builtin').find_files {
				cwd = vim.fn.stdpath('config')
			}
		end, { desc = "Telescope: neovim config" })
		vim.keymap.set("n", "<leader>b", function()
			require('telescope.builtin').buffers({
				sort_mru = true,
				sort_lastused = true,
			})
		end, { desc = "Telescope: buffers" })
		vim.keymap.set("n", "<leader>fg", require("misc.telescope-multigrep").live_multigrep,
			{ desc = "Telescope: multigrep" })
		-- vim.keymap.set("n", "<leader>fp", require("misc.telescope-pdfgrep").search,
		-- 	{ desc = "Telescope: pdfgrep" })
		vim.keymap.set("n", "<leader>fj", require('telescope.builtin').jumplist, { desc = "Telescope: jumplist" })
		-- vim.keymap.set("n", "<leader>fm", require('telescope.builtin').marks, { desc = "Telescope: marks" })
		vim.keymap.set('n', '<leader>fm', require('misc.telescope-file-marks').global_marks, { desc = "Global marks" })
		vim.keymap.set("n", "<leader>fd", require('telescope.builtin').diagnostics, { desc = "Telescope: diagnostics" })

		vim.keymap.set("n", "<leader>uc", require('telescope.builtin').colorscheme, { desc = "Telescope: colorscheme" })

		-- LSP
		vim.keymap.set("n", "<leader>fr", require('telescope.builtin').lsp_references, { desc = "Telescope: LSP references" })
		vim.keymap.set("n", "<leader>fs", function()
			require("telescope.builtin").lsp_document_symbols({
				symbols = { "method", "function" },
				symbol_width = 0.7
			})
		end, { desc = "Telescope: LSP Document symbols" })

		vim.keymap.set("n", "<leader>fS", function()
			require("telescope.builtin").lsp_workspace_symbols({
				symbols = { "method", "function" },
				symbol_width = 0.7
			})
		end, { desc = "Telescope: LSP Workspace symbols" })
		vim.keymap.set("n", "<leader>fi", require('telescope.builtin').lsp_implementations,
			{ desc = "Telescope: LSP implementations" })

		vim.keymap.set("n", "<leader>fc", require('telescope.builtin').lsp_incoming_calls,
			{ desc = "Telescope: LSP incoming (c)alls" })
		vim.keymap.set("n", "<leader>fC", require('telescope.builtin').lsp_outgoing_calls,
			{ desc = "Telescope: LSP outgoing (c)alls" })

		vim.keymap.set("n", "<leader>ft", require('telescope.builtin').lsp_type_definitions,
			{ desc = "Telescope: LSP (t)ype defintions" })

		vim.keymap.set("n", "<leader>fT", require('telescope.builtin').lsp_definitions,
			{ desc = "Telescope: LSP Defintions" })
		-- Git pickers
		vim.keymap.set("n", "<leader>gb", require('telescope.builtin').git_branches, { desc = "Git Branches" })
		vim.keymap.set("n", "<leader>gs", require('telescope.builtin').git_status, { desc = "Git Status" })
		vim.keymap.set("n", "<leader>gc", require('telescope.builtin').git_commits, { desc = "Git Commits" })
		vim.keymap.set("n", "<leader>gf", require('telescope.builtin').git_bcommits,
			{ desc = "Git Buffer Commits" })
		vim.keymap.set("v", "<leader>gf", require('telescope.builtin').git_bcommits_range,
			{ desc = "Git Buffer Commits Range" })
		vim.keymap.set("n", "<leader>gS", require('telescope.builtin').git_stash, { desc = "Git Stash" })


		-- Toggle .rgignore
		vim.keymap.set("n", "<leader>ut", require("misc.toggle_rgignore").toggle_rgignore_entries,
			{ desc = " Toggle .rgignore tests" })

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
