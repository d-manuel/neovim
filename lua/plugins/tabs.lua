return {
	{
		"tiagovla/scope.nvim",
		config = true,
	},
	{
		'akinsho/bufferline.nvim',
		lazy = false,
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		keys = {
			{ "H", "<cmd>BufferLineCyclePrev<cr>", desc = "BufferLineCyclePrev" },
			{ "L", "<cmd>BufferLineCycleNext<cr>", desc = "BufferLineCycleNext" }
		},
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup {}
			vim.keymap.set("n", ";", "<cmd>BufferLinePick<CR>", { desc = "BufferLinePick" })
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					theme = 'gruvbox', -- default: 'auto'
					disabled_filetypes = {
						statusline = {
						},
						winbar = {},
						'quickfix',
						'snack_picker_input',
						'OverseerList',
						'OverseerOutput',
						'codecompanion',
						''
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
			}
		end
	}
}
