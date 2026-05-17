return {
	{ "neanias/everforest-nvim", },
	{ "rebelot/kanagawa.nvim" },
	{ "thesimonho/kanagawa-paper.nvim" },
	{ "p00f/alabaster.nvim" },
	{
		"ember-theme/nvim",
		config = function()
			require("ember").setup {
				variant = "ember",
				styles = {
					comments = { italic = true },
					keywords = { bold = true },
					functions = {},
					types = { bold = true }
				}
			}
		end
	},
	{
		"comfysage/evergarden",
		lazy = false,
		priority = 1000, -- High priority ensures it's loaded early before bufferline so bufferline can adapt the colors
		config = function()
			vim.cmd.colorscheme("ember")
		end,
	},
}
