vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"
vim.o.showmode = false
vim.o.breakindent = true

vim.o.termguicolors = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.mouse = "a"

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars:append("tab:▸ ")
-- vim.opt.listchars:append("eol:↴")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.did_load_filetypes = 1

-- vim.o.clipboard = "unnamedplus" -- Default clipboard to system on
