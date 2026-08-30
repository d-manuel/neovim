return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ensure_installed = { "cpp", "markdown", "markdown_inline", "idl", "python", "java", "proto", "bash", "lua",
				"vim", "vimdoc" }

			require("nvim-treesitter").install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					local buf = args.buf
					local ft = vim.bo[buf].filetype

					local lang = vim.treesitter.language.get_lang(ft)
					if not lang then
						return
					end

					local ok_add = pcall(vim.treesitter.language.add, lang)
					if not ok_add then
						return
					end

					pcall(vim.treesitter.start, buf, lang)
				end,
			})
			-- incremental selection treesitter/lsp
			vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
				if vim.treesitter.get_parser(nil, nil, { error = false }) then
					require("vim.treesitter._select").select_parent(vim.v.count1)
				else
					vim.lsp.buf.selection_range(vim.v.count1)
				end
			end, { desc = "Select parent treesitter node or outer incremental lsp selections" })
			vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
				if vim.treesitter.get_parser(nil, nil, { error = false }) then
					require("vim.treesitter._select").select_child(vim.v.count1)
				else
					vim.lsp.buf.selection_range(-vim.v.count1)
				end
			end, { desc = "Select child treesitter node or inner incremental lsp selections" })
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true })
		end
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		init = function()
			-- Disable entire built-in ftplugin mappings to avoid conflicts.
			-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
			vim.g.no_plugin_maps = true

			-- Or, disable per filetype (add as you like)
			-- vim.g.no_python_maps = true
			-- vim.g.no_ruby_maps = true
			-- vim.g.no_rust_maps = true
			-- vim.g.no_go_maps = true
		end,
		config = function()
			-- configuration
			require("nvim-treesitter-textobjects").setup {
				select = {
					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,
					-- You can choose the select mode (default is charwise 'v')
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * method: eg 'v' or 'o'
					-- and should return the mode ('v', 'V', or '<c-v>') or a table
					-- mapping query_strings to modes.
					selection_modes = {
						['@parameter.outer'] = 'v', -- charwise
						['@function.outer'] = 'V', -- linewise
						-- ['@class.outer'] = '<c-v>', -- blockwise
					},
					-- If you set this to `true` (default is `false`) then any textobject is
					-- extended to include preceding or succeeding whitespace. Succeeding
					-- whitespace has priority in order to act similarly to eg the built-in
					-- `ap`.
					--
					-- Can also be a function which gets passed a table with the keys
					-- * query_string: eg '@function.inner'
					-- * selection_mode: eg 'v'
					-- and should return true of false
					include_surrounding_whitespace = false,
				},
			}

			-- List of BUILTIN_TEXTOBJECTTS: https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/main/BUILTIN_TEXTOBJECTS.md

			-- SELECT
			-- keymaps
			-- You can use the capture groups defined in `textobjects.scm`
			-- af/if -> function
			vim.keymap.set({ "x", "o" }, "af", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
			end)
			-- aa/ia -> argument
			vim.keymap.set({ "x", "o" }, "aa", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ia", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
			end)
			-- ic/ac -> class
			vim.keymap.set({ "x", "o" }, "ac", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
			end)
			-- You can also use captures from other query groups like `locals.scm`
			vim.keymap.set({ "x", "o" }, "as", function()
				require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
			end)
			-- TODO move and swap ideas here
		end,
	},
	-- VARIOUS TEXTOBJECTS
	-- Is not dependent on treesitter, but it still fits this context, hence it is in this file
	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VeryLazy",
		opts = {
			keymaps = {
				useDefaults = true,
				-- list of things to disable from the defualts:
				-- disableDefaults = {}
			}
		},
	}

}
