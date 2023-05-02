local options = {
	-- clipboard = "unnamedplus", -- Default clipboard to system one
	expandtab = true,
	tabstop = 2,
	shiftwidth = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	signcolumn = "yes",
	wrap = false,
	showmode = false,
	termguicolors = true,
	splitbelow = true,
	splitright = true,
	mouse = "a",
	completeopt = { "menu", "menuone", "noselect" },
	ignorecase = true,
	smartcase = true,
	laststatus = 3,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
	vim.opt[k] = v
end
