---@diagnostic disable: missing-fields
return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				-- ensure_installed = { "cpp", "vim", "vimdoc", "query", "comment" },
				ensure_installed = { "cpp", "markdown", "markdown_inline", "idl" },

				sync_install = false,

				auto_install = false,

				ignore_install = {},

				highlight = {
					enable = true,
					indent = { enable = true }
				},
				-- I think these require nvim-treesitter-textobjects installed:
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to the text object
						keymaps = {
							["if"] = "@function.inner",
							["af"] = "@function.outer",
						},
					},
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<cr>",
						node_incremental = "<cr>",
						scope_incremental = "<C-space>",
						node_decremental = "<bs>",
					}
				}
			}
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects", },
	{ "nvim-treesitter/nvim-treesitter-context", }
}
