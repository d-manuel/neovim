-- Resize
vim.keymap.set("n", "<leader>w+", "<C-w>+", { noremap = true, silent = true, desc = "Increase height" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { noremap = true, silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { noremap = true, silent = true, desc = "Decrease width" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { noremap = true, silent = true, desc = "Increase width" })
vim.keymap.set("n", "<leader>w=", "<C-w>=", { noremap = true, silent = true, desc = "Make windows same dimensions" })
vim.keymap.set("n", "<leader>w_", "<C-w>_", { noremap = true, silent = true, desc = "Set height (def: very high)" })
vim.keymap.set("n", "<leader>w|", "<C-w>|", { noremap = true, silent = true, desc = "Set width (def: very wide)" })

-- Tag / definition / file jumps
vim.keymap.set("n", "<leader>w]", "<C-w>]", { noremap = true, silent = true, desc = "Split + jump to tag" })
vim.keymap.set("n", "<leader>w^", "<C-w>^", { noremap = true, silent = true, desc = "Split + edit alternate file" })
vim.keymap.set("n", "<leader>wd", "<C-w>d", { noremap = true, silent = true, desc = "Split + jump to definition" })
vim.keymap.set("n", "<leader>wi", "<C-w>i", { noremap = true, silent = true, desc = "Split + jump to declaration" })
vim.keymap.set("n", "<leader>wf", "<C-w>f", { noremap = true, silent = true, desc = "Split + edit file name" })
vim.keymap.set("n", "<leader>wF", "<C-w>F", { noremap = true, silent = true, desc = "Split + edit file name + jump" })

-- Preview window
vim.keymap.set("n", "<leader>w}", "<C-w>}", { noremap = true, silent = true, desc = "Show tag in preview" })
vim.keymap.set("n", "<leader>wz", "<C-w>z", { noremap = true, silent = true, desc = "Close preview" })
vim.keymap.set("n", "<leader>wP", "<C-w>P", { noremap = true, silent = true, desc = "Focus preview" })

-- Navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Focus left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Focus down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Focus up" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Focus right" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { noremap = true, silent = true, desc = "Focus next" })
vim.keymap.set("n", "<leader>wW", "<C-w>W", { noremap = true, silent = true, desc = "Focus previous" })
vim.keymap.set("n", "<leader>wp", "<C-w>p", { noremap = true, silent = true, desc = "Focus last accessed" })
vim.keymap.set("n", "<leader>wb", "<C-w>b", { noremap = true, silent = true, desc = "Focus bottom" })
vim.keymap.set("n", "<leader>wt", "<C-w>t", { noremap = true, silent = true, desc = "Focus top" })

-- Open / close
vim.keymap.set("n", "<leader>wn", "<C-w>n", { noremap = true, silent = true, desc = "Open new" })
vim.keymap.set("n", "<leader>wc", "<C-w>c", { noremap = true, silent = true, desc = "Close" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { noremap = true, silent = true, desc = "Close all but current" })
vim.keymap.set("n", "<leader>wq", "<C-w>q", { noremap = true, silent = true, desc = "Quit current" })

-- Split
vim.keymap.set("n", "<leader>ws", "<C-w>s", { noremap = true, silent = true, desc = "Split horizontally" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { noremap = true, silent = true, desc = "Split vertically" })

-- Move / rearrange
vim.keymap.set("n", "<leader>wH", "<C-w>H", { noremap = true, silent = true, desc = "Move to very left" })
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { noremap = true, silent = true, desc = "Move to very bottom" })
vim.keymap.set("n", "<leader>wK", "<C-w>K", { noremap = true, silent = true, desc = "Move to very top" })
vim.keymap.set("n", "<leader>wL", "<C-w>L", { noremap = true, silent = true, desc = "Move to very right" })
vim.keymap.set("n", "<leader>wx", "<C-w>x", { noremap = true, silent = true, desc = "Exchange windows" })
vim.keymap.set("n", "<leader>wr", "<C-w>r", { noremap = true, silent = true, desc = "Rotate down/right" })
vim.keymap.set("n", "<leader>wR", "<C-w>R", { noremap = true, silent = true, desc = "Rotate up/left" })

-- Tabpage
vim.keymap.set("n", "<leader>wT", "<C-w>T", { noremap = true, silent = true, desc = "Create new tabpage + move" })
vim.keymap.set("n", "<leader>wgt", "<C-w>gt", { noremap = true, silent = true, desc = "Focus next tabpage" })
vim.keymap.set("n", "<leader>wgT", "<C-w>gT", { noremap = true, silent = true, desc = "Focus previous tabpage" })
vim.keymap.set("n", "<leader>wg<Tab>", "<C-w>g<Tab>", { noremap = true, silent = true, desc = "Focus last accessed tab" })
vim.keymap.set("n", "<leader>w<Tab>", "<C-w>g<Tab>", { noremap = true, silent = true, desc = "Focus last accessed tab" })
