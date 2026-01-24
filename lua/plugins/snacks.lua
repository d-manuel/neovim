return
{
	enabled = true,
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		scroll = {},
		bigfile = {},
		indent = {},
		input = {},
		notifier = {},
		quickfile = {},
		animate = {},
		words = {},
	},
	keys = {
		{ "<leader>gl", function() Snacks.lazygit() end,                 desc = "Open Lazygit" },
		{ "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference", mode = { "n", "t" } },
		{ "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
	}
}
