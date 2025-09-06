local function getBufferContent()
	local bufs = vim.api.nvim_list_bufs()
	local content = {}

	for _, buf in ipairs(bufs) do
		if vim.api.nvim_buf_is_loaded(buf) then
			local bufname = vim.api.nvim_buf_get_name(buf)
			if bufname ~= "" then
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
