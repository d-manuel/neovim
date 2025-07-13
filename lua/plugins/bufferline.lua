return {
	'akinsho/bufferline.nvim',
	enabled = true,
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		-- disable the modified_icon because I use vim.opt.autowriteall = true now, and bufferline doesnt update it properly anyway
		require("bufferline").setup {
			options = {
				modified_icon = ""
			}
		}
	end
}
