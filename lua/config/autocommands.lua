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
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- exclude java:
		if vim.bo.filetype == "java" then
			return
		end
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client == nil then
			return
		end

		vim.keymap.set("n", "<leader>0", "<cmd>LspClangdSwitchSourceHeader<CR>",
			{ desc = "C++ : Switch Source and Header File" })

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

local function set_statusline()
	local active_window_id = vim.api.nvim_get_current_win()
	local tabwindows = vim.api.nvim_tabpage_list_wins(0);
	for _, window_id in ipairs(tabwindows) do
		local buf = vim.api.nvim_win_get_buf(window_id)
		local buftype = vim.bo[buf].buftype
		if buftype == "nofile" or buftype == "prompt" then
			return
		end
		if window_id == active_window_id then
			vim.wo[window_id].statusline = '%#Directory#%{%expand("%:.")%}%*'
		else
			vim.wo[window_id].statusline = '%#StatusLineNC#%{%expand("%:.")%}%*'
		end
	end
end

vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	callback = set_statusline
})

-- lsp based folding if available. TS based folding should be set in the options.
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
