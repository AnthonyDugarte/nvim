local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Alias
local keymap = vim.keymap.set

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
keymap("n", "<leader>bd", ":bd<CR>", opts)
-- keymap("n", "<s-h>", ":bp<CR>", opts)
-- keymap("n", "<s-l>", ":bn<CR>", opts)

-- Bufferline approach
keymap("n", "<s-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<s-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "[b", ":BufferLineMovePrev<CR>", opts)
keymap("n", "]b", ":BufferLineMoveNext<CR>", opts)

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
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)
-- Telescope LSP handling
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufopts = { noremap = true, silent = true, buffer = ev.buf }

		keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
		keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
		keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
		keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)

		-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
		keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", bufopts)
		keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)

		keymap("n", "gi", "<cmd>Lspsaga goto_definition<CR>", bufopts)
		keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", bufopts)

		keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
		keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
		keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
		keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)

		keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
		keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)

		keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
	end,
})
