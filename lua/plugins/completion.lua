return {
	{
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
				['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end, "fallback" },
				['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end, "fallback" },
				['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end, "fallback" },
				['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end, "fallback" },
				['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end, "fallback" },
				['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end, "fallback" },
				['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end, "fallback" },
				['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end, "fallback" },
				['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end, "fallback" },
				['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end, "fallback" },
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
	},
}
