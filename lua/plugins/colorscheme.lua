return {
	{ "neanias/everforest-nvim", },
	{ "rebelot/kanagawa.nvim" },
	{ "thesimonho/kanagawa-paper.nvim" },
	{ "p00f/alabaster.nvim" },
	{
		"comfysage/evergarden",
		lazy = false,
		priority = 1000, -- High priority ensures it's loaded early before bufferline so bufferline can adapt the colors
		config = function()
			vim.cmd.colorscheme("alabaster")
		end,
	},
}
