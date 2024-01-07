return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocomplete
		"hrsh7th/nvim-cmp",
		"hrsh7th/nvim-compe",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},

	config = function ()
		local lsp = require("lsp-zero")

		lsp.on_attach(function(_, bufnr)
			local opts = {buffer = bufnr, remap = false}

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				lsp.default_setup,
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									globals = {"vim"},
								},
							},
						},
					})
				end,
			}
		})

		local cmp = require("cmp")
		local cmp_select = {behavior = cmp.SelectBehavior.Select}
		cmp.setup({
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-n>"] = cmp.mapping.confirm({select = true}),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.close(),
				["<Tab>"] = vim.NIL,
				["<S-Tab>"] = vim.NIL,
				["<CR>"] = vim.NIL,
				["<C-p>"] = vim.NIL,
			},
			sources = {
				{name = "nvim_lsp"},
				{name = "buffer"},
				{name = "path"},
				{name = "luasnip"},
			},
		})
	end,
}
