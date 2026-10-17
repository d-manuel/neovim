vim.pack.add( {
	-- { src = "https://github.com/neanias/everforest-nvim", },
	-- { src = "https://github.com/rebelot/kanagawa.nvim" },
	-- { src = "https://github.com/thesimonho/kanagawa-paper.nvim" },
	-- { src = "https://github.com/p00f/alabaster.nvim" },
	-- { src = "https://github.com/comfysage/evergarden"},
	{ src = "https://github.com/ember-theme/nvim"},
})

require("ember").setup {
	variant = "ember",
	styles = {
		comments = { italic = true },
		keywords = { bold = true },
		functions = {},
		types = { bold = true }
	}
}


vim.cmd.colorscheme("ember")
