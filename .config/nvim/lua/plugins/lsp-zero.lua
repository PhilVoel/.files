return {
	"VonHeikemen/lsp-zero.nvim",
	dependencies = {
		-- LSP Support
		"neovim/nvim-lspconfig",

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
			local function add_description(options, desc)
				local merged_opts = {}
				for key, value in pairs(options) do
					merged_opts[key] = value
				end
				merged_opts["desc"] = desc
				return merged_opts
			end

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, add_description(opts, "Go to definition"))
			vim.keymap.set("n", "K", vim.lsp.buf.hover, add_description(opts, "Hover"))
			vim.keymap.set("n", "gr", vim.lsp.buf.references, add_description(opts, "Go to references"))
			vim.keymap.set("n", "gj", vim.diagnostic.goto_next, add_description(opts, "Go to next diagnostic"))
			vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, add_description(opts, "Go to previous diagnostic"))
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, add_description(opts, "Open code actions"))
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, add_description(opts, "Rename symbol"))

		end)

		local lspconfig = require("lspconfig")
		local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
		lspconfig.bashls.setup({
			capabilities = lsp_capabilities,
		})
		lspconfig.lua_ls.setup({
			capabilities = lsp_capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = {"vim"},
					},
				},
			},
		})
		lspconfig.rust_analyzer.setup({
			capabilities = lsp_capabilities,
		})
		lspconfig.tsserver.setup({
			capabilities = lsp_capabilities,
		})

		local cmp = require("cmp")
		local cmp_select = {behavior = cmp.SelectBehavior.Select}
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-l>"] = cmp.mapping.confirm({select = true}),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.close(),
				["<Tab>"] = vim.NIL,
				["<S-Tab>"] = vim.NIL,
				["<CR>"] = vim.NIL,
				["<C-p>"] = vim.NIL,
			}),
			sources = {
				{name = "nvim_lsp"},
				{name = "buffer"},
				{name = "path"},
				{name = "luasnip"},
			},
		})
	end,
}
