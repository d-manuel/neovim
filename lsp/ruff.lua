-- vim.lsp.config('ruff', {
-- 	init_options = {
-- 		settings = {
-- 			-- Server settings should go here
-- 		}
-- 	}
-- })
return {
	cmd = { 'ruff', 'server' },
	filetypes = { 'python' },
	root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
	settings = {},
}
