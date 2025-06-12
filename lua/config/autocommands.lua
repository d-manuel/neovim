-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- LSP Keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
		-- vim.keymap.set("n", "gA", vim.lsp.buf.range_code_action, opts)
		vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
		vim.keymap.set({ "n" }, "<leader>cd", vim.diagnostic.open_float)
		-- these are already set to the same bindings by neovim by default
		-- vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
	end,
})


-- Add a buffer-local pair mapping for '$'
-- Requires mini pairs.
-- TODO move inside mini.pairs setup function (maybe in seperate module)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		require("mini.pairs").map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
	end,
})


-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})


-- Format on save if lsp supports formatting
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client == nil then
			return
		end

		if client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end
			})
		end
	end
})
