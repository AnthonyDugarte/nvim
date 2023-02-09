local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Alias
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
keymap("n", "<C-i>", "<C-i>", opts)

-- TreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Tabs
keymap("n", "<enter>", ":tabnew %<cr>", opts)
keymap("n", "<s-enter>", ":tabclose<cr>", opts)
keymap("n", "<m-\\>", ":tabonly<cr>", opts)

-- Navigate tabs
keymap("n", "<s-j>", ":tabprevious<CR>", opts)
keymap("n", "<s-k>", ":tabnext<CR>", opts)
-- Naviagate buffers
keymap("n", "<s-h>", ":bprevious<CR>", opts)
keymap("n", "<s-l>", ":bnext<CR>", opts)

-- Windows movement
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Terminal
keymap("t", "<C-h>", "<cmd>wincmd h<CR>", term_opts)
keymap("t", "<C-j>", "<cmd>wincmd j<CR>", term_opts)
keymap("t", "<C-k>", "<cmd>wincmd k<CR>", term_opts)
keymap("t", "<C-l>", "<cmd>wincmd l<CR>", term_opts)
