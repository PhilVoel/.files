return {
	"mistricky/codesnap.nvim",
	build = "make",

	config = function()
		require("codesnap").setup({
			save_path = "~/Pictures/Codesnap",
			watermark = "",
		})
		vim.keymap.set("v", "<leader>cs", ":CodeSnap<CR>", {desc = "Screenshot to clipboard"})
		vim.keymap.set("v", "<leader>cS", ":CodeSnapSave<CR>", {desc = "Screenshot to file"})
	end,
}
