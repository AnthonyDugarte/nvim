-- Alias
local keymap = require("user.utils").keymap
local term_keymap = require("user.utils").keymap_fun_gen({ silent = true })

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>")
keymap("n", "<C-i>", "<C-i>")

keymap("n", "<C-s>", "<cmd> w <CR>", { desc = "save file" })

-- TreeToggle
keymap("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")

-- Tabs (works weird when closing buffers)
-- keymap("n", "<enter>", ":tabnew %<cr>")
-- keymap("n", "<s-enter>", ":tabclose<cr>")
-- keymap("n", "<m-\\>", ":tabonly<cr>")
-- keymap("n", "<s-j>", ":tabp<CR>")
-- keymap("n", "<s-k>", ":tabn<CR>")

-- Buffers
keymap("n", "<leader>bd", ":bd<CR>")
keymap("n", "<leader>x", ":bd<CR>")
-- keymap("n", "<s-h>", ":bp<CR>")
-- keymap("n", "<s-l>", ":bn<CR>")

-- Bufferline approach
keymap("n", "<s-h>", ":BufferLineCyclePrev<CR>")
keymap("n", "<s-l>", ":BufferLineCycleNext<CR>")
keymap("n", "[b", ":BufferLineMovePrev<CR>")
keymap("n", "]b", ":BufferLineMoveNext<CR>")

-- Windows movement
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
-- Terminal
term_keymap("t", "<C-h>", "<cmd>wincmd h<CR>")
term_keymap("t", "<C-j>", "<cmd>wincmd j<CR>")
term_keymap("t", "<C-k>", "<cmd>wincmd k<CR>")
term_keymap("t", "<C-l>", "<cmd>wincmd l<CR>")
-- Interations
term_keymap("n", "<C-|>", ":ToggleTermToggleAll")

-- Visual
-- Keep visual mode on identation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>")
keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
keymap("n", "<leader>fb", ":Telescope buffers<CR>")
keymap("n", "<leader>fh", ":Telescope help_tags<CR>")
keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
-- Telescope LSP handling
keymap("n", "<leader>fr", ":Telescope lsp_references<CR>")

-- LSP
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local lsp_keymap = require("user.utils").keymap_fun_gen({ noremap = true, silent = true, buffer = ev.buf })

		lsp_keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>")
		lsp_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
		-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
		lsp_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		lsp_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")

		-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
		lsp_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		lsp_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

		-- keymap("n", "gi", "<cmd>Lspsaga goto_definition<CR>", bufopts)
		lsp_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		lsp_keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

		lsp_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
		-- keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
		-- keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
		-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
		-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)

		lsp_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
		-- keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
		lsp_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

		lsp_keymap("n", "<leader>fm", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name ~= "tsserver"
				end,
			})
		end)
	end,
})
