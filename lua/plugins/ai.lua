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
					slash_commands = {
						buffer = { opts = { provider = "snacks" } },
						file = { opts = { provider = "snacks" } },
						help = { opts = { provider = "snacks" } },
						symbols = { opts = { provider = "snacks" } },
					},
					adapter = "opencode",
				},
				cmd = {
					adapter = "opencode",
				},
				background = {
					adapter = "opencode",
				},
				inline = {
					adapter = "opencode",
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
		'milanglacier/minuet-ai.nvim',
		enabled = false,
		config = function()
			require('minuet').setup {
				provider = 'openai_compatible',
				request_timeout = 2.5,
				throttle = 1500, -- Increase to reduce costs and avoid rate limits
				debounce = 600, -- Increase to reduce costs and avoid rate limits
				provider_options = {
					openai_compatible = {
						api_key = 'OPENCODE_GO_API_KEY',
						end_point = 'https://opencode.ai/zen/go/v1/chat/completions',
						model = 'deepseek-v4-flash',
						name = 'Opencode',
						optional = {
							max_tokens = 56,
							top_p = 0.9,
							-- disable thinking to avoid first token latency
							thinking = { type = 'disabled' },
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = {},
					keymap = {
						-- accept whole completion
						accept = '<A-A>',
						-- accept one line
						accept_line = '<A-a>',
						-- accept n lines (prompts for number)
						-- e.g. "A-z 2 CR" will accept 2 lines
						accept_n_lines = '<A-z>',
						-- Cycle to prev completion item, or manually invoke completion
						prev = '<A-[>',
						-- Cycle to next completion item, or manually invoke completion
						next = '<A-]>',
						dismiss = '<A-e>',
					},
				},
			}
		end,
	},

}
