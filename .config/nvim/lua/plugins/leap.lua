return {
	"ggandor/leap.nvim",

	config = function()
		vim.keymap.set({"n", "v"}, "ö", function() require("leap").leap {target_windows = {vim.fn.win_getid()}} end, {desc = "Leap"})
		vim.api.nvim_set_hl(0, "LeapBackdrop", {link = "Comment"})

		require("leap").setup({})
	end,
}
