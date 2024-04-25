return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {desc = "Find files"})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {desc = "Find git files"})
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({search = vim.fn.input("Grep > ")})
		end, {desc = "Search based on grep text"})
		vim.keymap.set("n", "<leader>pl", builtin.live_grep, {desc = "Live grep"})
	end,
}
