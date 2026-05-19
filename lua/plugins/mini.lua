return {
	"echasnovski/mini.nvim",
	version = false,
	lazy = false,
	config = function()
		require('mini.ai').setup()
		require('mini.pairs').setup {}
		require('mini.pick').setup {}
		-- remove for quotes
		-- vim.keymap.set('i', '"', '"')
		-- vim.keymap.set('i', "'", "'")

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



		-- Pickers
		require('mini.extra').setup {}
		require('mini.pick').setup {}

		-- Replace vim.ui.select() with mini.pick
		vim.ui.select = MiniPick.ui_select
	end,
	keys = {
		{ "<leader>fR", function() MiniPick.builtin.resume() end,                                                     "mini resume" },
		-- ── Files & Buffers ──────────────────────────────────────────────
		{ '<Leader>ff', function() MiniPick.builtin.files() end,                                                      desc = 'Find files' },
		{ '<Leader>fg', function() MiniPick.builtin.grep_live() end,                                                  desc = 'Live grep' },
		{ '<Leader>b',  function() MiniPick.builtin.buffers() end,                                                    desc = 'Buffers' },
		{ '<Leader>fh', function() MiniPick.builtin.help() end,                                                       desc = 'Help tags' },
		{ '<Leader>fo', function() MiniExtra.pickers.oldfiles() end,                                                  desc = 'Old files' },
		{ '<Leader>fe', function() MiniExtra.pickers.explorer() end,                                                  desc = 'File explorer' },

		-- ── mini.visits ──────────────────────────────────────────────────
		-- { '<Leader>vv', function() MiniExtra.pickers.visit_paths() end,                       desc = 'Visit paths (frecent)' },
		-- { '<Leader>vl', function() MiniExtra.pickers.visit_labels() end,                      desc = 'Visit labels' },
		-- { '<Leader>va', function() MiniVisits.add_label() end,                                desc = 'Add label to file' },
		-- { '<Leader>vd', function() MiniVisits.remove_label() end,                             desc = 'Remove label from file' },

		-- ── LSP ──────────────────────────────────────────────────────────
		{ 'gd',         function() MiniExtra.pickers.lsp({ scope = 'definition' }) end,                               desc = 'LSP definition' },
		{ 'gr',         function() MiniExtra.pickers.lsp({ scope = 'references' }) end,                               desc = 'LSP references' },
		{ 'gD',         function() MiniExtra.pickers.lsp({ scope = 'declaration' }) end,                              desc = 'LSP declaration' },
		{ '<Leader>fs', function() MiniExtra.pickers.lsp({ scope = 'document_symbol' }) end,                          desc = 'Document symbols' },
		{ '<Leader>fS', function() MiniExtra.pickers.lsp({ scope = 'workspace_symbol' }) end,                         desc = 'Workspace symbols' },
		{ '<Leader>fi', function() MiniExtra.pickers.lsp({ scope = 'implementation' }) end,                           desc = 'LSP implementation' },
		{ '<Leader>fT', function() MiniExtra.pickers.lsp({ scope = 'type_definition' }) end,                          desc = 'Type definition' },
		{ '<Leader>fc', function() vim.lsp.buf.incoming_calls() end,                                                  desc = 'LSP incoming calls' },
		{ '<Leader>fC', function() vim.lsp.buf.outgoing_calls() end,                                                  desc = 'LSP outgoing calls' },

		-- ── Git ──────────────────────────────────────────────────────────
		{ '<Leader>gb', function() MiniExtra.pickers.git_branches() end,                                              desc = 'Git branches' },
		{ '<Leader>gc', function() MiniExtra.pickers.git_commits() end,                                               desc = 'Git commits' },
		{ '<Leader>gf', function() MiniExtra.pickers.git_files() end,                                                 desc = 'Git files (tracked)' },
		{ '<Leader>gh', function() MiniExtra.pickers.git_hunks() end,                                                 desc = 'Git hunks (unstaged)' },
		{ '<Leader>gH', function() MiniExtra.pickers.git_hunks({ scope = 'staged' }) end,                             desc = 'Git hunks (staged)' },

		-- ── Diagnostics & Code ───────────────────────────────────────────
		{ '<Leader>fd', function() MiniExtra.pickers.diagnostic() end,                                                desc = 'Diagnostics' },
		{ '<Leader>ft', function() MiniExtra.pickers.treesitter() end,                                                desc = 'Treesitter nodes' },
		{ '<Leader>fl', function() MiniExtra.pickers.buf_lines({ scope = 'current' }) end,                            desc = 'Buffer lines' },
		{ '<Leader>fL', function() MiniExtra.pickers.buf_lines() end,                                                 desc = 'All buffer lines' },

		-- ── Neovim Internals ─────────────────────────────────────────────
		{ '<Leader>fk', function() MiniExtra.pickers.keymaps() end,                                                   desc = 'Keymaps' },
		{ '<Leader>fm', function() MiniExtra.pickers.marks() end,                                                     desc = 'Marks' },
		{ '<Leader>fr', function() MiniExtra.pickers.registers() end,                                                 desc = 'Registers' },
		{ '<Leader>fq', function() MiniExtra.pickers.list({ scope = 'quickfix' }) end,                                desc = 'Quickfix list' },
		{ '<Leader>fj', function() MiniExtra.pickers.list({ scope = 'jump' }) end,                                    desc = 'Jump list' },
		-- { '<Leader>fc', function() MiniExtra.pickers.commands() end,                          desc = 'Commands' },
		{ '<Leader>uc', function() MiniExtra.pickers.colorschemes() end,                                              desc = 'Colorschemes' },
		-- { '<Leader>fo', function() MiniExtra.pickers.options() end,                           desc = 'Neovim options' },
		{ 'z=',         function() MiniExtra.pickers.spellsuggest() end,                                              desc = 'Spell suggest' },
		{ '<Leader>fH', function() MiniExtra.pickers.history() end,                                                   desc = 'History' },
		-- Custom file searches
		{ '<Leader>en', function() MiniPick.builtin.files({}, { source = { cwd = vim.fn.stdpath('config') } }) end,   desc = 'Edit nvim config' },
		{ '<Leader>ej', function() MiniPick.builtin.files({}, { source = { cwd = vim.fn.expand("~/journal") } }) end, desc = 'Edit journal' },
		{
			'<Leader>ei',
			function()
				local home = vim.fn.expand('~')
				require('mini.pick').builtin.cli({
					command = { 'rg', '--files', '--glob', '*.pdf', home },
				}, {
					source = {
						name = 'PDF files',
						cwd = home,
					},
				})
			end,
			desc = 'Find PDFs in home',
		},
	}
}
