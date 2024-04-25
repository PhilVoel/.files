return {
	"ThePrimeagen/harpoon",

	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "Add current file to Harpoon"})
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "View Harpoon"})

		vim.keymap.set("n", "<C-j>", function() ui.nav_file(1) end, {desc = "Go to first file in Harpoon"})
		vim.keymap.set("n", "<C-k>", function() ui.nav_file(2) end, {desc = "Go to second file in Harpoon"})
		vim.keymap.set("n", "<C-l>", function() ui.nav_file(3) end, {desc = "Go to third file in Harpoon"})
	end,
}
