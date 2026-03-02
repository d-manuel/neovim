return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
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

		local make_select_path = function(select_global, recency_weight)
			local visits = require('mini.visits')
			local sort = visits.gen_sort.default({ recency_weight = recency_weight })
			local select_opts = { sort = sort }
			return function()
				local cwd = select_global and '' or vim.fn.getcwd()
				visits.select_path(cwd, select_opts)
			end
		end

		local map = function(lhs, desc, ...)
			vim.keymap.set('n', lhs, make_select_path(...), { desc = desc })
		end

		-- Adjust LHS and description to your liking
		map('<Leader>vR', 'Select recent (all)', true, 1)
		map('<Leader>vr', 'Select recent (cwd)', false, 1)
		map('<Leader>vY', 'Select frecent (all)', true, 0.5)
		map('<Leader>vy', 'Select frecent (cwd)', false, 0.5)
		map('<Leader>vF', 'Select frequent (all)', true, 0)
		map('<Leader>vf', 'Select frequent (cwd)', false, 0)
	end,
}
