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

local blink = require "blink.cmp"

-- Add blinks capabilities to neovims capabilities and set it for all lsp servers.
-- Hence I don't have to explicitely set it in each lsp config seperately
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = blink.get_lsp_capabilities(capabilities)

vim.lsp.config('*', {
	capabilities = capabilities
})
