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
			preset = 'enter'
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = 'mono'
		},
		sources = {
			default = { 'snippets', 'lsp', 'path' }, --buffer
			-- don't suggest snippets after a period
			providers = {
				snippets = {
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= '.'
					end
				}
			}
		},
		-- Show information about the function while typing them
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500
			}
		},
		signature = { enabled = true },
		enabled = function() return not vim.tbl_contains({ "", "unknown" }, vim.bo.filetype) end,
	},
}
