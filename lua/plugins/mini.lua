return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- require('mini.statusline').setup({
		-- use_icon = true })
		require('mini.ai').setup()
		require('mini.pairs').setup()
		-- require('mini.starter').setup()
		-- require('mini.comment').setup()
	end
}
