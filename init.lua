require("config.options")
require("config.lazy") -- Loads lazy.nvim but also all plugins!
-- Load config.lsp after lazy.nvim because it requires blink.cmp whichi sloaded in config.lazy
require("config.lsp")
require("config.keymaps")
require("config.autocommands")

vim.cmd("colorscheme nord")
