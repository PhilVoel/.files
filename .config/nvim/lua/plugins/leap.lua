return {
	"ggandor/leap.nvim",

	config = function()
		vim.keymap.set("n", "ö", function() require("leap").leap {target_windows = {vim.fn.win_getid()}} end)
		vim.keymap.set("v", "ö", function() require("leap").leap {target_windows = {vim.fn.win_getid()}} end)
		vim.api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})

		require("leap").setup({})
	end,
}
