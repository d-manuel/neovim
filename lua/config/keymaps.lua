-- vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current lua file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Run current lua line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run current lua line" })

--  jk to leave insert mode
vim.keymap.set("i", "jk", "<ESC>", { desc = "Leave insert mode", remap = true })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Leave insert mode", remap = true })

-- clipboard
vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>P", '"+P', { desc = "Paste from system clipboard" })

-- yank a line but you can paste it inline then
vim.keymap.set({ "n", "v" }, "Y", "^y$", { desc = "yank line but be able to paste it inline afterwards" })

-- Safe all files with C-S and <Leader>s
-- vim.keymap.set("n", "<leader>s", "<cmd>wa<CR>", { desc = "Save all open buffers" })
-- vim.keymap.set("n", "<C-s>", "<cmd>wa<CR>", { desc = "Save all open buffers" })

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>confirm qa<CR>", { desc = "Quit neovim" })
-- buffer movement
-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Prev buffer" })

--QuickFix List
-- Note: Ctrl+q in telescope to put it in the quickfix list
vim.keymap.set({ "n", "i" }, "<M-j>", "<cmd>cnext<CR>", { desc = "Next quicklist entry" })
vim.keymap.set({ "n", "i" }, "<M-k>", "<cmd>cprev<CR>", { desc = "Prev quicklist entry" })


-- pasting into selection does not put into clipboard
vim.keymap.set('x', 'p', '"_dP', { noremap = true, silent = true })

-- navigate Splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true, desc = "Focus split left" })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true, desc = "Focus split down" })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true, desc = "Focus split up" })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true, desc = "Focus split right" })

-- Window resize (respecting `v:count`)
vim.keymap.set('n', '<C-Left>', '"<Cmd>vertical resize -" . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Down>', '"<Cmd>resize -"          . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Up>', '"<Cmd>resize +"          . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Increase window height' })
vim.keymap.set('n', '<C-Right>', '"<Cmd>vertical resize +" . v:count1 . "<CR>"',
	{ expr = true, replace_keycodes = false, desc = 'Increase window width' })

-- Shift+J: Move cursor DOWN 6 lines
vim.keymap.set('n', 'J', '6j', { noremap = true, silent = true, desc = "down 6 lines" })
-- Shift+K: Move cursor UP 6 lines
vim.keymap.set('n', 'K', '6k', { noremap = true, silent = true, desc = "up 5 lines" })
-- Shift+S: Join lines (acts like the built-in 'J')
vim.keymap.set('n', 'S', 'J', { noremap = true, silent = true })


-- Zoom
vim.keymap.set("n", "<leader>uz", "<C-w>_<C-w>|", { desc = "Zoom" })
vim.keymap.set("n", "<leader>=", "<C-w>=", { desc = "Reset Zoom" })

-- Search inside visually highlighted text
vim.keymap.set('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search inside visual selection' })

-- Alternative way to save and exit in Normal mode.
vim.keymap.set('n', '<C-S>', '<Cmd>silent! update | redraw<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>s', '<Cmd>silent! update | redraw<CR>', { desc = 'Save' })

-- Reselect latest changed, put, or yanked text
vim.keymap.set('n', 'gV', '"`[" . strpart(getregtype(), 0, 1) . "`]"',
	{ expr = true, replace_keycodes = false, desc = 'Visually select changed text' })


-- Hide the status bar for even more vertical space
local statusbarHidden = false
vim.keymap.set({ "n" }, "<leader>us", function()
	if statusbarHidden then
		vim.opt.laststatus = 2
		statusbarHidden = false
	else
		vim.opt.laststatus = 0
		statusbarHidden = true
	end
end, { desc = "Hide Statusbar" })


-- Create new tab
vim.keymap.set('n', '<C-t>', function() vim.cmd("tabnew") end, { desc = "Close Tab" })

-- Close tab. Using scope.nvim this also closes all the contained buffers.
vim.keymap.set('n', '<leader>qc', '<cmd>tabclose<CR>', { desc = "Close Tab" })

-- close buffer without window
vim.keymap.set('n', 'Q', ':bp|bd #<CR>')

-- lazygit in snacks
vim.keymap.set('n', '<leader>gl',
	function()
		require 'snacks'.lazygit.open()
	end, { desc = "Lazygit" })
