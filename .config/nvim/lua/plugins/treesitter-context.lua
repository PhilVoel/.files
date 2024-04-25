return {
	"nvim-treesitter/nvim-treesitter-context",

	config = function()
		vim.keymap.set("n", "<leader>gc", require("treesitter-context").go_to_context, {silent = true, desc = "Go to context"})
		require("treesitter-context").setup()
	end,
}
