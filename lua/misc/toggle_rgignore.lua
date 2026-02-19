local M = {}

function M.toggle_rgignore_entries()
	local root = vim.fs.root(0, { ".git", ".rgignore", "Makefile", "CMakeLists.txt" })
	if not root then
		vim.notify("Could not find project root", vim.log.levels.WARN)
		return
	end

	local rgignore_path = root .. "/.rgignore"

	-- Edit these to whatever you want toggled together
	local entries = { "test/", "tests/" }

	-- Read existing lines
	local existing = {}
	local file = io.open(rgignore_path, "r")
	if file then
		for line in file:lines() do
			existing[line] = true
		end
		file:close()
	end

	-- If any entry is present, remove all; otherwise add all
	local any_present = false
	for _, entry in ipairs(entries) do
		if existing[entry] then
			any_present = true
			break
		end
	end

	if any_present then
		for _, entry in ipairs(entries) do
			existing[entry] = nil
		end
		vim.notify("Removed test dirs from .rgignore", vim.log.levels.INFO)
	else
		for _, entry in ipairs(entries) do
			existing[entry] = true
		end
		vim.notify("Added test dirs to .rgignore", vim.log.levels.INFO)
	end

	local out = io.open(rgignore_path, "w")
	if out then
		for entry in pairs(existing) do
			out:write(entry .. "\n")
		end
		out:close()
	end
end

return M
