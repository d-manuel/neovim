return {
	'stevearc/overseer.nvim',
	opts = {},
	keys = {
		{ "<leader>ot", "<cmd>OverseerToggle<cr>",                    desc = "OverseerToggle" },
		{ "<leader>or", "<cmd>OverseerRun<cr><cmd>OverseerOpen!<cr>", desc = "OverseerRun" },
	},
	config = function()
		require('overseer').setup()
	end
}
