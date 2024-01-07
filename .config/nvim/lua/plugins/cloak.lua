return {
	"laytan/cloak.nvim",

	config = function()
		require("cloak").setup()
		vim.keymap.set("n", "<leader>ct", ":CloakToggle<CR>")
	end,
}
