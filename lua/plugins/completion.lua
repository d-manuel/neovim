return {
	'saghen/blink.cmp',
	dependencies = 'rafamadriz/friendly-snippets',
	version = 'v1.*',
	opts = {
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		-- Set Alt+number ot select the nth element in the completion menu.
		-- Fallback: if the action is not doable, the keymap that was defined before
		-- will be called
		keymap = {
			preset = 'enter',
			['<A-y>'] = require('minuet').make_blink_map(),
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},
		sources = {
			default = { 'snippets', 'lsp', 'path', 'minuet' }, --buffer
			-- don't suggest snippets after a period
			providers = {
				snippets = {
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= '.'
					end
				},
				minuet = {
					name = 'minuet',
					module = 'minuet.blink',
					async = true,
					-- Should match minuet.config.request_timeout * 1000,
					-- since minuet.config.request_timeout is in seconds
					timeout_ms = 3000,
					score_offset = 50, -- Gives minuet higher priority among suggestions
				},
			}
		},
		-- Show information about the function while typing them
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500
			},
			-- Recommended to avoid unnecessary request
			trigger = {
				prefetch_on_insert = false
			}
		},
		signature = { enabled = true },
		enabled = function() return not vim.tbl_contains({ "", "unknown" }, vim.bo.filetype) end,
	},
}
