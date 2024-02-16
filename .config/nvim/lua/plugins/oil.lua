return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		vim.keymap.set("n", "-", require("oil").open_float)
		vim.keymap.set("n", "<leader>-", require("oil").open)

		require("oil").setup{
			keymaps = {
				["q"] = "actions.close",
			},
			use_default_keymaps = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
			},
		}
	end,
}
