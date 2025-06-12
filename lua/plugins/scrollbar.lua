return {
	"petertriho/nvim-scrollbar",
	config = function()
		require("scrollbar").setup({
			handle = { color = "#808080	" }
		})
	end
}
