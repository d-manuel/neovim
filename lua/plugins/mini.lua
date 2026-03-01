return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		local statusline = require('mini.statusline')
		statusline.setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git           = MiniStatusline.section_git({ trunc_width = 40 })
					local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
					local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
					local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
					local location      = MiniStatusline.section_location({ trunc_width = 75 })
					local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

					return MiniStatusline.combine_groups({
						'%<', -- Mark general truncate point
						{ hl = 'Directory', strings = { filename } },
						'%=', -- End left alignment
						-- { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
						{ hl = '',          strings = { git, diff, diagnostics, lsp } },
						-- { hl = mode_hl,                 strings = { mode } },
						{ hl = mode_hl,     strings = { search } },
					})
				end,
				inactive = function()
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					return MiniStatusline.combine_groups({
						{ hl = 'MiniStatuslineInactive', strings = { filename } },
					})
				end,
			},
		})

		require('mini.ai').setup()
		require('mini.pairs').setup {}
		-- remove for quotes
		vim.keymap.set('i', '"', '"')
		vim.keymap.set('i', "'", "'")

		local miniclue = require('mini.clue')
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = 'n', keys = '<Leader>' },
				{ mode = 'x', keys = '<Leader>' },

				-- Built-in completion
				{ mode = 'i', keys = '<C-x>' },

				-- `g` key
				{ mode = 'n', keys = 'g' },
				{ mode = 'x', keys = 'g' },

				-- Marks
				{ mode = 'n', keys = "'" },
				{ mode = 'n', keys = '`' },
				{ mode = 'x', keys = "'" },
				{ mode = 'x', keys = '`' },

				-- Registers
				{ mode = 'n', keys = '"' },
				{ mode = 'x', keys = '"' },
				{ mode = 'i', keys = '<C-r>' },
				{ mode = 'c', keys = '<C-r>' },

				-- Window commands
				{ mode = 'n', keys = '<C-w>' },

				-- `z` key
				{ mode = 'n', keys = 'z' },
				{ mode = 'x', keys = 'z' },

				-- `]` key
				{ mode = 'n', keys = ']' },
				{ mode = 'x', keys = ']' },

				-- `[` key
				{ mode = 'n', keys = '[' },
				{ mode = 'x', keys = '[' },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
			window = {
				delay = 200
			}
		})
		require('mini.visits').setup {}
		vim.keymap.set("n", "<leader>fo", '<Cmd>lua MiniVisits.select_path()<CR>', { desc = "paths" })
	end,
}
