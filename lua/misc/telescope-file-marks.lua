local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.global_marks = function(opts)
	opts = opts or {}

	-- Get all global marks (A-Z)
	local marks = {}
	for i = 65, 90 do -- ASCII codes for A-Z
		local mark_char = string.char(i)
		local mark_info = vim.api.nvim_get_mark(mark_char, {})

		-- Check if mark is set (position is not 0,0)
		if mark_info[1] ~= 0 or mark_info[2] ~= 0 then
			table.insert(marks, {
				mark = mark_char,
				file = mark_info[4] or "",
				line = mark_info[1],
				col = mark_info[2] + 1, -- Convert to 1-indexed
			})
		end
	end

	pickers.new(opts, {
		prompt_title = "Global Marks",
		finder = finders.new_table({
			results = marks,
			entry_maker = function(entry)
				return {
					value = entry,
					display = string.format("'%s: %s:%d:%d",
						entry.mark,
						vim.fn.fnamemodify(entry.file, ":~:."),
						entry.line,
						entry.col
					),
					ordinal = entry.mark .. " " .. entry.file,
					filename = entry.file,
					lnum = entry.line,
					col = entry.col,
				}
			end,
		}),
		sorter = conf.generic_sorter(opts),
		previewer = conf.file_previewer(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()

				-- Jump to the mark
				vim.cmd("normal! '" .. selection.value.mark)
			end)
			return true
		end,
	}):find()
end

return M
