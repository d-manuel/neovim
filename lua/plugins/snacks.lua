return
{
	enabled = true,
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = {},
		indent = {},
		input = {},
		notifier = {},
		quickfile = {},
		words = {},
		explorer = {},
		picker = {
			ui_select = true,
		}
	},
	keys = {
		{ "]]",         function() Snacks.words.jump(vim.v.count1) end,                          desc = "Next Reference",        mode = { "n", "t" } },
		{ "[[",         function() Snacks.words.jump(-vim.v.count1) end,                         desc = "Prev Reference",        mode = { "n", "t" } },

		-- Top Pickers & Explorer
		{ "<leader>fR", function() Snacks.picker.resume() end,                                   desc = "Resume" },
		{ "<leader>ff", function() Snacks.picker.smart() end,                                    desc = "Smart Find Files" },
		-- { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
		{ "<leader>fg", function() Snacks.picker.grep() end,                                     desc = "Grep" },
		{ "<leader>b",  function() Snacks.picker.buffers() end,                                  desc = "Buffers" },
		{ "<leader>fh", function() Snacks.picker.help() end,                                     desc = "Help Pages" },
		{ "<leader>fo", function() Snacks.picker.recent() end,                                   desc = "Recent" },
		{ "<leader>fe", function() Snacks.explorer() end,                                        desc = "File Explorer" },

		-- lsp
		{ "gd",         function() Snacks.picker.lsp_definitions() end,                          desc = "Goto Definition" },
		{ "<leader>fr", function() Snacks.picker.lsp_references() end,                           nowait = true,                  desc = "References" },
		{ "gD",         function() Snacks.picker.lsp_declarations() end,                         desc = "Goto Declaration" },
		{ "<leader>fs", function() Snacks.picker.lsp_symbols() end,                              desc = "LSP Symbols" },
		{ "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end,                    desc = "LSP Workspace Symbols" },
		{ "<leader>fi", function() Snacks.picker.lsp_implementations() end,                      desc = "Goto Implementation" },
		{ "<leader>fT", function() Snacks.picker.lsp_type_definitions() end,                     desc = "Goto T[y]pe Definition" },
		{ "<leader>fc", function() Snacks.picker.lsp_incoming_calls() end,                       desc = "C[a]lls Incoming" },
		{ "<leader>fC", function() Snacks.picker.lsp_outgoing_calls() end,                       desc = "C[a]lls Outgoing" },

		-- git
		{ "<leader>gl", function() Snacks.lazygit() end,                                         desc = "Open Lazygit" },

		{ "<leader>gi", function() Snacks.lazygit.log_file() end,                                desc = "Lazygit Log File" },
		{ "<leader>ga", function() Snacks.lazygit.log() end,                                     desc = "Lazygit Log" },

		{ "<leader>gb", function() Snacks.picker.git_branches() end,                             desc = "Git Branches" },
		{ "<leader>gL", function() Snacks.picker.git_log() end,                                  desc = "Git Log" },
		{ "<leader>gF", function() Snacks.picker.git_log_file() end,                             desc = "Git Log File" },
		{ "<leader>gC", function() Snacks.picker.git_log_line() end,                             desc = "Git Log Line" },
		{ "<leader>gs", function() Snacks.picker.git_status() end,                               desc = "Git Status" },
		{ "<leader>gS", function() Snacks.picker.git_stash() end,                                desc = "Git Stash" },
		{ "<leader>gd", function() Snacks.picker.git_diff() end,                                 desc = "Git Diff (Hunks)" },

		{ "<leader>fG", function() Snacks.picker.git_files() end,                                desc = "Git Files" },

		-- tracked/unracked staged/unstaged hunks etc.
		-- git grep through old files and stuff...

		--diagnostics and code
		{ "<leader>fd", function() Snacks.picker.diagnostics() end,                              desc = "Diagnostics" },
		{ "<leader>fD", function() Snacks.picker.diagnostics_buffer() end,                       desc = "Buffer Diagnostics" },


		-- neovim
		{ "<leader>fk", function() Snacks.picker.keymaps() end,                                  desc = "Keymaps" },
		{ "<leader>fm", function() Snacks.picker.marks() end,                                    desc = "Marks" },
		{ '<leader>f"', function() Snacks.picker.registers() end,                                desc = "Registers" },
		{ "<leader>fq", function() Snacks.picker.qflist() end,                                   desc = "Quickfix List" },
		{ "<leader>fj", function() Snacks.picker.jumps() end,                                    desc = "Jumps" },
		-- { "<leader>sC", function() Snacks.picker.commands() end,                                desc = "Commands" },
		{ "<leader>uc", function() Snacks.picker.colorschemes() end,                             desc = "Colorschemes" },
		{ "<leader>:",  function() Snacks.picker.command_history() end,                          desc = "Command History" },

		{ "<leader>fb", function() Snacks.picker.pickers() end,                                  desc = "all builtin pickers" },

		--new snacks specific
		{ "<leader>n",  function() Snacks.picker.notifications() end,                            desc = "Notification History" },
		{ '<leader>f/', function() Snacks.picker.search_history() end,                           desc = "Search History" },
		{ "<leader>fp", function() Snacks.picker.projects() end,                                 desc = "Projects" },
		-- -- Grep
		-- { "<leader>sB", function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
		-- { "<leader>sg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
		-- { "<leader>sw", function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
		-- -- search
		-- { "<leader>su", function() Snacks.picker.undo() end,                                    desc = "Undo History" },
		{ "<leader>fl", function() Snacks.picker.lines() end,                                    desc = "Buffer Lines" },

		--custom
		{ "<leader>en", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,  desc = "Edit neovim config" },
		{ "<leader>ej", function() Snacks.picker.files({ cwd = vim.fn.expand "~/journal" }) end, desc = "Edit journal" },
		{
			"<leader>ei",
			function()
				Snacks.picker.files({
					cmd = "rg",
					cwd = vim.fn.expand "~",
					args = { '--hidden', '--files', '--glob', '*.pdf' },
					-- with fd
					-- args = { '--extension', 'lua' },
				})
			end,
			desc = "pdfs in home"
		},
	}
}
