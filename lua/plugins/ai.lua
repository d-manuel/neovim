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
				keymaps = {
					accept_change = {
						modes = { n = "<leader>aa" },
						description = "Accept the suggested change",
					},
					reject_change = {
						modes = { n = "<leader>ar" },
						opts = { nowait = true },
						description = "Reject the suggested change",
					},
				},
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
