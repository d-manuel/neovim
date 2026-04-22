return {
	'nvim-telescope/telescope.nvim',
	tag = '0.2.1',
	dependencies = { 'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim' },
	config = function()
		-- vim.keymap.set("n", "<leader>en", function()
		-- 	require('telescope.builtin').find_files {
		-- 		cwd = vim.fn.stdpath('config')
		-- 	}
		-- end, { desc = "Telescope: neovim config" })
		-- vim.keymap.set("n", "<leader>b", function()
		-- 	require('telescope.builtin').buffers({
		-- 		sort_mru = true,
		-- 		sort_lastused = true,
		-- 	})
		-- end, { desc = "Telescope: buffers" })
		-- vim.keymap.set("n", "<leader>fg", require("misc.telescope-multigrep").live_multigrep,
		-- 	{ desc = "Telescope: multigrep" })
		-- -- vim.keymap.set("n", "<leader>fp", require("misc.telescope-pdfgrep").search,
		-- -- 	{ desc = "Telescope: pdfgrep" })
		--
		-- vim.keymap.set("n", "<leader>fs", function()
		-- 	require("telescope.builtin").lsp_document_symbols({
		-- 		symbols = { "method", "function" },
		-- 		symbol_width = 0.7
		-- 	})
		-- end, { desc = "Telescope: LSP Document symbols" })
		--
		-- vim.keymap.set("n", "<leader>fS", function()
		-- 	require("telescope.builtin").lsp_workspace_symbols({
		-- 		symbols = { "method", "function" },
		-- 		symbol_width = 0.7
		-- 	})
		-- end, { desc = "Telescope: LSP Workspace symbols" })

		-- vim.keymap.set("n", "<leader>ft", require('telescope.builtin').lsp_type_definitions,
		-- 	{ desc = "Telescope: LSP (t)ype defintions" })
		--
		-- vim.keymap.set("n", "<leader>fT", require('telescope.builtin').lsp_definitions,
		-- 	{ desc = "Telescope: LSP Defintions" })
		-- -- Git pickers
		-- vim.keymap.set("n", "<leader>gs", require('telescope.builtin').git_status, { desc = "Git Status" })
		-- vim.keymap.set("n", "<leader>gf", require('telescope.builtin').git_bcommits,
		-- 	{ desc = "Git Buffer Commits" })
		-- vim.keymap.set("v", "<leader>gf", require('telescope.builtin').git_bcommits_range,
		-- 	{ desc = "Git Buffer Commits Range" })
		-- vim.keymap.set("n", "<leader>gS", require('telescope.builtin').git_stash, { desc = "Git Stash" })
		--
		--
		-- -- Toggle .rgignore
		-- vim.keymap.set("n", "<leader>ut", require("misc.toggle_rgignore").toggle_rgignore_entries,
		-- 	{ desc = " Toggle .rgignore tests" })
		--
		-- require("telescope").load_extension("ui-select")
		-- require("telescope").setup {
		-- 	defaults = {
		-- 		layout_strategy = 'vertical',
		-- 		layout_config = {
		-- 			height = 0.95,
		-- 			-- preview_height = 0.5
		-- 		}
		-- 	},
		-- 	pickers = {
		-- 		buffers = {
		-- 			mappings = {
		-- 				i = {
		-- 					-- allow closing buffers from the buffers picker
		-- 					["<c-d>"] = require("telescope.actions").delete_buffer,
		-- 				}
		-- 			}
		-- 		}
		-- 	}
		-- }
	end
}
