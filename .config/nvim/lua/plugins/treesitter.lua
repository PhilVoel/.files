return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {"c", "lua", "vim", "query", "rust", "javascript", "css", "html", "go", "php", "julia", "regex", "json", "toml"},
			auto_install = true,
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
