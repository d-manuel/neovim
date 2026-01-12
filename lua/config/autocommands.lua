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

		local function map(mode, keybinding, command, desc)
			vim.keymap.set(mode, keybinding, command, vim.tbl_extend("force", opts, { desc = desc }))
		end
		map("n", "gd", vim.lsp.buf.definition, "Go to Definition")
		map("n", "gD", vim.lsp.buf.declaration, "Go to Declaration")
		map("n", "gr", vim.lsp.buf.references, "Go to References")
		map("n", "gy", vim.lsp.buf.type_definition, "Go to Type Definition")
		map("n", "gI", vim.lsp.buf.implementation, "Go to Implementation")
		map("n", "gK", vim.lsp.buf.hover, "Show Hover Documentation")
		map("n", "gS", vim.lsp.buf.signature_help, "Show Signature Help")
		map("n", "ga", vim.lsp.buf.code_action, "Code Actions")
		-- map("n","gA", vim.lsp.buf.range_code_action, "Range Code Actions")
		map("n", "<leader>cf", function() vim.lsp.buf.format() end, "Format File")
		map("n", "<leader>cd", vim.diagnostic.open_float, "Open Diagnostics Float")
		-- map("n","grn", vim.lsp.buf.rename, "Rename Symbol")
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



-- Run nvim jdtls lsp on java files
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'java',
	callback = function()
		require 'misc.jdtls_setup'.setup({})
	end
})
