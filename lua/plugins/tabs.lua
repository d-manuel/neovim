return {
	{
		"tiagovla/scope.nvim",
		config = true,
		keys = {
			{ "<leader>B", "<cmd>Telescope scope buffers<cr>", desc = "Telescope: Show all buffers" },
		}
	},
	{
		'akinsho/bufferline.nvim',
		version = "*",
		dependencies = 'nvim-tree/nvim-web-devicons',
		config = function()
			vim.opt.termguicolors = true
			require("bufferline").setup {}
		end
	}
}
