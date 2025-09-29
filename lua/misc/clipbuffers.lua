local function getBufferContent()
	local bufs = vim.api.nvim_list_bufs()
	local content = {}

	for _, buf in ipairs(bufs) do
		local buflisted = vim.fn.buflisted(buf) == 1
		local bufloaded = vim.api.nvim_buf_is_loaded(buf)
		local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
		local name = vim.api.nvim_buf_get_name(buf)
		if buflisted and bufloaded and buftype == "" and name ~= "" then
			-- if vim.api.nvim_buf_is_loaded(buf) and vim.fn.buflisted(buf) then
			local bufname = vim.api.nvim_buf_get_name(buf)
			-- if bufname ~= "" then
			if vim.api.nvim_buf_is_loaded(buf) and vim.fn.filereadable(bufname) == 1 then
				local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
				if #lines > 0 then
					table.insert(content, bufname .. ":")
					local buf_content = table.concat(lines, "\n")
					table.insert(content, buf_content)
				end
			end
		end
	end
	local all_content = table.concat(content, "\n\n");
	return all_content
end

local function copy_to_cliboard(content)
	print(content)
	vim.fn.setreg('+', content)
end

local function copy_all_open_buffers_to_clipboard()
	copy_to_cliboard(getBufferContent())
end


vim.keymap.set("n", "<leader>mk", function() copy_all_open_buffers_to_clipboard() end, {})
