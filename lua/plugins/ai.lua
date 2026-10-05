return {
	{

		"olimorris/codecompanion.nvim",
		version = "*",
		opts = {
			adapters = {
				http = {
					openwebui = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "http://127.0101.1:3000/api", -- Replace with your OpenWebUI URL
								api_key = "OPENWEBUI_API_KEY", -- Your OpenWebUI API key (environment variable)
								chat_url = "/v1/chat/completions",
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
					slash_commands = {
						buffer = { opts = { provider = "snacks" } },
						file = { opts = { provider = "snacks" } },
						help = { opts = { provider = "snacks" } },
						symbols = { opts = { provider = "snacks" } },
					},
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
	},
	{
		"carlos-algms/agentic.nvim",
		enabled = false,

		--- @type agentic.PartialUserConfig
		opts = {
			-- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp" | "kiro-acp" | "pi-acp"
			provider = "opencode-acp", -- setting the name here is all you need to get started
		},

		-- these are just suggested keymaps; customize as desired
		keys = {
			{
				"<C-\\>",
				function() require("agentic").toggle() end,
				mode = { "n", "v", "i" },
				desc = "Toggle Agentic Chat"
			},
			{
				"<C-'>",
				function() require("agentic").add_selection_or_file_to_context() end,
				mode = { "n", "v" },
				desc = "Add file or selection to Agentic to Context"
			},
			{
				"<C-,>",
				function() require("agentic").new_session() end,
				mode = { "n", "v", "i" },
				desc = "New Agentic Session"
			},
			{
				"<A-i>r", -- ai Restore
				function()
					require("agentic").restore_session()
				end,
				desc = "Agentic Restore session",
				silent = true,
				mode = { "n", "v", "i" },
			},
			{
				"<leader>ad", -- ai Diagnostics
				function()
					require("agentic").add_current_line_diagnostics()
				end,
				desc = "Add current line diagnostic to Agentic",
				mode = { "n" },
			},
			{
				"<leader>aD", -- ai all Diagnostics
				function()
					require("agentic").add_buffer_diagnostics()
				end,
				desc = "Add all buffer diagnostics to Agentic",
				mode = { "n" },
			},
		},
	},
	{
		"milanglacier/minuet-ai.nvim",

		dependencies = {
			"nvim-lua/plenary.nvim",
		},

		opts = {
			provider = "openai_compatible",

			provider_options = {
				openai_compatible = {
					model = "qwen2.5-coder:1.5b",
					end_point = "http://127.0.0.1:3000/api/chat/completions",
					api_key = "OPENWEBUI_API_KEY",
					stream = true,

					optional = {
						max_tokens = 128, }
				},
			},

			-- For opencode go completion
			-- provider_options = {
			-- 	openai_compatible = {
			-- 		api_key = 'OPENCODE_GO_API_KEY',
			-- 		end_point = 'https://opencode.ai/zen/go/v1/chat/completions',
			-- 		model = 'deepseek-v4-flash',
			-- 		name = 'Opencode',
			-- 		optional = {
			-- 			max_tokens = 56,
			-- 			top_p = 0.9,
			-- 			-- disable thinking to avoid first token latency
			-- 			thinking = { type = 'disabled' },
			-- 		},
			-- 	},
			-- },

			request_timeout = 10, -- local models often need more than 3 seconds. blink timeout should be configured the same as here
			n_completions = 1,  -- local model should request too many completions.
			context_window = 2048, -- can be increased if feasible
			-- throttle = 1500,          -- Increase to reduce costs and avoid rate limits
			-- debounce = 600,           -- Increase to reduce costs and avoid rate limits
			-- Set to don't generate requests automatically
			-- throttle = 0,
			-- debounce = 0,
			virtualtext = {

				-- empty array to keep automatically trigger off to not hit the api too much
				auto_trigger_ft = {},
				-- auto_trigger_ft = {
				-- 	"lua",
				-- 	"python",
				-- 	"javascript",
				-- 	"rust",
				-- },

				keymap = {
					accept = "<A-a>",
					accept_line = "<A-l>",
					accept_n_lines = "<A-j>",
					prev = "<A-[>",
					-- press that also to request a manual virtual text if the auto_trigger_ft is empty above~
					next = "<A-]>",

					dismiss = "<A-e>",
				},
			},
		},
	}
}
