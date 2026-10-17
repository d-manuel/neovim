vim.g.mapleader = " "
vim.g.maplocalleader = ";"

require("options")
require("keymaps")
require("autocommands")

-- Lsp setup order:
-- plugin/completion.lua to configure blink
-- plugin/lsp.lua for nvim-lspconfig
-- after/plugin/lsp.lua enables luals
-- lsp/lua_ls.lua can require blink
