local options = {
    clipboard = "unnamedplus",
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
    showtabline = 0,
    completeopt = { "menuone", "noselect" },
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for k, v in pairs(options) do
  vim.opt[k] = v
end
