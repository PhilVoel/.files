return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local trouble = require("trouble")
		trouble.setup({
			position = "right",
		})
		vim.keymap.set("n", "gt", trouble.toggle)
	end,
}
