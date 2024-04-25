-- Vim options
vim.g.mapleader = " "
vim.opt.guicursor = "n-v-c-i:block"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 1000
vim.cmd([[
	set number relativenumber
	tnoremap <Esc> <C-\><C-n>
	autocmd FileType kotlin setlocal commentstring=//\ %s
	autocmd FileType nix setlocal commentstring=#\ %s
	filetype plugin indent on
]])

-- Keymaps
vim.keymap.set({"n", "v"}, "<Space>", "<Nop>", {noremap = true, silent = true})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = "Move selected text up and auto indent"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = "Move selected text down and auto indent"})
vim.keymap.set("n", "n", "nzzzv", {desc = "Go to next search item, center on cursor"})
vim.keymap.set("n", "N", "Nzzzv", {desc = "Go to previous search item, center on cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Half page up, center on cursor"})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Half page down, center on cursor"})
vim.keymap.set("x", "<leader>p", "\"_dP", {desc = "Paste and delete old text to null register"})
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d", {desc = "Delete to null register"})
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y", {desc = "Copy to system clipboard"})
vim.keymap.set("n", "<leader>Rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = "Rename every occurance of \"word\" in this file"})
vim.keymap.set("n", "<leader>F", "gg=G``", {desc = "Auto indent whole file"})
vim.keymap.set("n", "<C-h>", "`", {desc = "Jump to mark"})

-- Install Lazy if it isn't already
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system{
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup("plugins")
