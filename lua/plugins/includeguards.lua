return {
	-- "includeguards.nvim",
	-- dev    = true,
	"d-manuel/includeguards.nvim",
	config = function()
		require("includeguards").setup({})
		vim.keymap.set("n", "<leader>hg", function() require("includeguards").addIncludeguards() end)
	end
}
