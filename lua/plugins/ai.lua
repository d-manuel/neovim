return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	opts = {
		adapters = {
			http = {
				openwebui = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://localhost:3000", -- Replace with your OpenWebUI URL
							api_key = "OPENWEBUI_API_KEY", -- Your OpenWebUI API key (environment variable)
							chat_url = "/api/v1/chat/completions",
						},
						schema = {
							model = {
								default = "deepseek-r1:8b", -- e.g., "llama3.2:latest" or whatever model you're using
							},
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = "openwebui",
			},
			cmd = {
				adapter = "openwebui",
			},
			background = {
				adapter = "openwebui",
			},
			inline = {
				adapter = "openwebui",
			},
		},
	},
	keys = {
		{ "<leader>cc", "<CMD>CodeCompanionChat<CR>",          desc = "CodeCompanionChat" },
		{ "<leader>ct", "<CMD>CodeCompanionChat Toggle<CR>",   desc = "CodeCompanionChat Toggle" },
		{ "<leader>cp", "<CMD>'<,'>CodeCompanion<CR>",         desc = "CodeCompanion Prompt",    mode = { "v" } },
		{ "<leader>ca", "<CMD>'<,'>CodeCompanionChat Add<CR>", desc = "CodeCompanionChat Add",   mode = { "v" } },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
	},
}
