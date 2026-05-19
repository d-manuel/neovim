vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gR", vim.lsp.buf.references, { desc = "Go to References" })
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set("n", "gK", vim.lsp.buf.hover, { desc = "Show Hover Documentation" })
vim.keymap.set("n", "gS", vim.lsp.buf.signature_help, { desc = "Show Signature Help" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code Actions" })
-- vim.keymap.set("n", "gA", vim.lsp.buf.range_code_action, { desc = "Range Code Actions" })
vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "Format File" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Open Diagnostics Float" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename Symbol" })

vim.diagnostic.config { virtual_lines = true }

vim.lsp.enable({
	"clangd",
	"lua_ls",
	"bashls",
	"ruff",
	"pyright",
	"yamlls",
	"ts_ls",
	"elixirls"
})

vim.lsp.config('clangd', {
	cmd = {
		"clangd",
		"--clang-tidy",
		"--background-index",
		"--compile-commands-dir=build",
		"--cross-file-rename",
		"--completion-style=bundled",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
		"--pch-storage=memory",
		"--suggest-missing-includes",
		"--function-arg-placeholders",
		"--inlay-hints",
		"--fallback-style=llvm",
	}
})

local blink = require "blink.cmp"

-- Add blinks capabilities to neovims capabilities and set it for all lsp servers.
-- Hence I don't have to explicitely set it in each lsp config seperately
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = blink.get_lsp_capabilities(capabilities)

vim.lsp.config('*', {
	capabilities = capabilities
})
