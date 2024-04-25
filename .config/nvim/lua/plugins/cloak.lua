return {
	"laytan/cloak.nvim",

	config = function()
		require("cloak").setup({
			patterns = {
				{
					file_pattern = {
						".env*",
						".npmrc",
						"credentials.toml",
					},
					cloak_pattern = "=.+",
				},
			},
		})
		vim.keymap.set("n", "<leader>ct", ":CloakToggle<CR>", {desc = "Toggle Cloak"})
	end,
}

