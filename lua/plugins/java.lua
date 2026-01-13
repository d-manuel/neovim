function setup()
	-- Download https://github.com/eclipse-jdtls/eclipse.jdt.ls#installation
	-- and put into ~/.local/share/jdtls (or change paths here in the file)
	-- Also change username if necessary.
	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	local workspace_dir = vim.env.HOME .. "/Workspace/" .. project_name
	local config = {
		cmd = {
			"java", -- expected to be in $PATH, otherwise provide path to java binary here

			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
			"-Dosgi.bundles.defaultStartLevel=4",
			"-Declipse.product=org.eclipse.jdt.ls.core.product",
			"-Dlog.protocol=true",
			"-Dlog.level=ALL",
			"-Xmx1g",
			"--add-modules=ALL-SYSTEM",
			"--add-opens",
			"java.base/java.util=ALL-UNNAMED",
			"--add-opens",
			"java.base/java.lang=ALL-UNNAMED",

			"-jar",
			vim.env.HOME .. "/.local/share/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar",
			"-configuration",
			vim.env.HOME .. "/.local/share/jdtls/config_linux/",
			"-data",
			workspace_dir,
		},
		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
		settings = {
			java = {},
		},
		init_options = {
			bundles = {},
		},
	}
	require("jdtls").start_or_attach(config)
end

return {
	"mfussenegger/nvim-jdtls",
	config = function()
		-- Run nvim jdtls lsp on java files
		vim.api.nvim_create_autocmd('FileType', {
			pattern = 'java',
			callback = function()
				require 'misc.jdtls_setup'.setup()
			end
		})
	end
}
