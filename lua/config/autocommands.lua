-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
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
--TODO interact with conform.nvim. which to autorun where etc. Probably just evelove to more specific setups over time
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- exclude java:
		if vim.bo.filetype == "java" then
			return
		end

		-- Use conform.nvim for cpp in a different autocommand
		if vim.bo.filetype == "cpp" or vim.bo.filetype == "c" then
			return
		end

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

-- cpp format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { '*.c', '*.h', '*cpp' },
	callback = function(args)
		vim.notify("run clang-conform")
		require("conform").format { bufnr = args.buf }
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		if vim.bo.filetype ~= "cpp"
				and vim.bo.filetype ~= "c" then
			return
		end
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client == nil then
			return
		end

		vim.keymap.set("n", "<leader>0", "<cmd>LspClangdSwitchSourceHeader<CR>",
			{ desc = "C++ : Switch Source and Header File" })
	end
})


-- lsp based folding if available. TS based folding should be set in the options as fallback
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method('textDocument/foldingRange') then
			local win = vim.api.nvim_get_current_win()
			vim.wo[win].foldexpr = 'v:lua.vim.lsp.foldexpr()'
			vim.wo[win].foldmethod = 'expr'
			vim.wo[win].foldlevel = 99 -- unfold by default
		end
	end
})
