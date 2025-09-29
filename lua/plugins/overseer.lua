return {
	'stevearc/overseer.nvim',
	keys = {
		{ "<leader>ot", "<cmd>OverseerToggle<cr>",                    desc = "OverseerToggle" },
		{ "<leader>or", "<cmd>OverseerRun<cr><cmd>OverseerOpen!<cr>", desc = "OverseerRun" },
	},
	config = function()
		require('overseer').setup {
			task_list = {
				min_height = 30,
			}
		}
	end
}
