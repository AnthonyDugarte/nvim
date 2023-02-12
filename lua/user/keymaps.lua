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
keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>", opts)

-- Tabs (works weird when closing buffers)
-- keymap("n", "<enter>", ":tabnew %<cr>", opts)
-- keymap("n", "<s-enter>", ":tabclose<cr>", opts)
-- keymap("n", "<m-\\>", ":tabonly<cr>", opts)
-- keymap("n", "<s-j>", ":tabp<CR>", opts)
-- keymap("n", "<s-k>", ":tabn<CR>", opts)

-- Buffers
keymap("n", "<s-h>", ":bp<CR>", opts)
keymap("n", "<s-l>", ":bn<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

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
-- Interations
keymap("n", "<C-|>", ":ToggleTermToggleAll<CR>", opts)

-- Visual
-- Keep visual mode on identation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
-- Telescope LSP handling
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)
