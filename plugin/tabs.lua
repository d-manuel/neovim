vim.pack.add({
	{ src = "https://github.com/tiagovla/scope.nvim" },
	{ src = "nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/akinsho/bufferline.nvim" }, -- version = *
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
})
require("scope").setup()
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "BufferLineCyclePrev" })
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "BufferLineCycleNext" })
vim.opt.termguicolors = true

require("bufferline").setup {}
vim.keymap.set("n", ";", "<cmd>BufferLinePick<CR>", { desc = "BufferLinePick" })


require('lualine').setup {
	options = {
		theme = 'gruvbox', -- default: 'auto'
		disabled_filetypes = {
			'quickfix',
			'snack_picker_input',
			'OverseerList',
			'OverseerOutput',
			'codecompanion',
			''
		},
		statusline = {
		},
		winbar = {},
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'selectioncount', 'searchcount' },
		lualine_y = { 'filetype' },
		lualine_z = { 'progress' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	extensions = {
		'oil',
	}
}
