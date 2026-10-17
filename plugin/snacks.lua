vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

require("snacks").setup({
	bigfile = {},
	indent = {},
	input = {},
	notifier = {},
	quickfile = {},
	words = {},
	explorer = {},
	picker = {
		ui_select = true,
	},
})

-- Words
vim.keymap.set({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader>fR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
-- vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>b", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>fo", function() Snacks.picker.recent() end, { desc = "Recent" })
vim.keymap.set("n", "<leader>fe", function() Snacks.explorer() end, { desc = "File Explorer" })

-- lsp
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "<leader>fs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>fS", function() Snacks.picker.lsp_workspace_symbols() end,
	{ desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>fi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "<leader>fT", function() Snacks.picker.lsp_type_definitions() end,
	{ desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>fc", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
vim.keymap.set("n", "<leader>fC", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })

-- git
vim.keymap.set("n", "<leader>gl", function() Snacks.lazygit() end, { desc = "Open Lazygit" })

vim.keymap.set("n", "<leader>gi", function() Snacks.lazygit.log_file() end, { desc = "Lazygit Log File" })
vim.keymap.set("n", "<leader>ga", function() Snacks.lazygit.log() end, { desc = "Lazygit Log" })

vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gF", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
vim.keymap.set("n", "<leader>gC", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })

vim.keymap.set("n", "<leader>fG", function() Snacks.picker.git_files() end, { desc = "Git Files" })

-- tracked/unracked staged/unstaged hunks etc.
-- git grep through old files and stuff...

--diagnostics and code
vim.keymap.set("n", "<leader>fd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })

-- neovim
vim.keymap.set("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", '<leader>f"', function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", "<leader>fq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
-- vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>uc", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })

vim.keymap.set("n", "<leader>fb", function() Snacks.picker.pickers() end, { desc = "all builtin pickers" })

--new snacks specific
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", '<leader>f/', function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
-- -- Grep
-- vim.keymap.set("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
-- vim.keymap.set("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
-- vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
-- -- search
-- vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>fl", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })

--custom
vim.keymap.set("n", "<leader>en", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
	{ desc = "Edit neovim config" })
vim.keymap.set("n", "<leader>ej", function() Snacks.picker.files({ cwd = vim.fn.expand "~/journal" }) end,
	{ desc = "Edit journal" })
vim.keymap.set("n", "<leader>ei", function()
	Snacks.picker.files({
		cmd = "rg",
		cwd = vim.fn.expand "~",
		args = { "--hidden", "--files", "--glob", "*.pdf" },
		-- with fd
		-- args = { "--extension", "lua" },
	})
end, { desc = "pdfs in home" })
