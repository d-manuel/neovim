return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts = {
		indent = { enable = true },
		highlight = {
			enable = true,
		},
		folds = { enable = true },
		endwise = { enable = true }
	},
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
	end

}
