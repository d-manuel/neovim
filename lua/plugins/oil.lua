return {
	enabled = true,
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
        ["<C-s>"] = false,
        ["<M-s>"] = "actions.select_vsplit",
      },
      view_options = {
        show_hidden = true,
      },
      -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
      delete_to_trash = true,
    })
    -- Open parent directory in current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil: Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "<space>-", require("oil").toggle_float)
	end,
}
