return {
	{
		"tiagovla/scope.nvim",
		config = true,
	},
	{
		'akinsho/bufferline.nvim',
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
	}
}
