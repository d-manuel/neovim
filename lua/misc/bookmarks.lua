local function openWebsite(url)
	vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
end

vim.keymap.set("n", "<leader>l1", function() openWebsite("http://duckduckgo.com") end, { desc = "Duckduckgo" })
vim.keymap.set("n", "<leader>l2", function() openWebsite("https://github.com/d-manuel") end, { desc = "github" })
