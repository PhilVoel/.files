return {
	"stevearc/oil.nvim",
	dependencies = {"nvim-tree/nvim-web-devicons"},

	opts = {
		columns = {
			"icon",
			"permissions",
		},
		keymaps = {
			["<CR>"] = {
				desc = "Go to selected directory or open file externally",
				callback = function()
					local actions = require("oil.actions")
					local type = require("oil").get_cursor_entry().type
					if type == "link" then
						type = require("oil").get_cursor_entry().meta.stat.type
					end
					if type == "directory" then
						actions.select.callback()
					elseif type == "file" then
						actions.open_external.callback()
					end
				end
			},
			["<S-CR>"] = {
				desc = "Open file and quit",
				callback = function()
					local type = require("oil").get_cursor_entry().type
					if type == "link" then
						type = require("oil").get_cursor_entry().meta.stat.type
					end
					if type == "file" then
						require("oil.actions").open_external.callback()
						vim.cmd(":qa")
					end
				end
			},
			["<C-c>"] = {
				desc = "Quit",
				callback = ":qa<CR>"
			},
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["gs"] = "actions.change_sort",

			["g?"] = "actions.show_help",
			["<C-l>"] = "actions.select_vsplit",
			["<C-j>"] = "actions.select_split",
			["g."] = "actions.toggle_hidden",
			["gp"] = "actions.preview",
		},
		use_default_keymaps = false,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
	}
}
