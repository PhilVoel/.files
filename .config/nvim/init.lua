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
]])

-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")
vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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
