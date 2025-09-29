return
{
	enabled = true,
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		scroll = {
		},
		bigfile = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		animate = {},
	},
	keys = {
		{ "<leader>gl", function() Snacks.lazygit() end, desc = "Open Lazygit" },
	}
}
