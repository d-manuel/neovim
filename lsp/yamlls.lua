return {
	cmd = { 'yaml-language-server', '--stdio' },
	filetypes = { 'yaml', 'yaml.docker-compose' },
	root_markers = { '.git' },
	settings = {
		-- https://github.com/redhat-developer/vscode-redhat-telemetry#how-to-disable-telemetry-reporting
		redhat = { telemetry = { enabled = false } },
	},
}
