local options = {
	expandtab = true,
	tabstop = 2,
  shiftwidth = 2,
	cursorline = true,
	number = true,
	relativenumber = false,
	signcolumn = "yes",
	wrap = false,
	showmode = false,
	termguicolors = true,
	splitbelow = true,
	splitright = true,
  mouse = "a",
  showtabline = 0,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
	vim.opt[k] = v
end
