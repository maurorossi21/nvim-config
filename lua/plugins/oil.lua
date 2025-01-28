
return {
	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				keymaps = {
					["<A-b>"] = "actions.parent",
					["<A-s>"] = ":w!<cr>",
				},
				prompt_save_on_select_new_entry = false,
				view_options = { show_hidden = true },
			})
		end,
	},
}
