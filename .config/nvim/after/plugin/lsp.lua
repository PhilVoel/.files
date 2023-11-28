local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

end)

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		lsp.default_setup,
	}
})

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
cmp.setup({
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-z>"] = cmp.mapping.confirm({select = true}),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-c>"] = cmp.mapping.close(),
		["<Tab>"] = vim.NIL,
		["<S-Tab>"] = vim.NIL,
		["<CR>"] = vim.NIL
	}
})

-- lsp.set_preferences({
-- 	sign_icons = { }
-- })

-- vim.opt.signcolumn = "yes"
