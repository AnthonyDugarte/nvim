local keymap = require("user.utils").keymap

keymap("", "<Space>", "<Nop>")

-- Remap for dealing with word wrap
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- TreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")

-- Buffers
-- keymap("n", "<leader>bd", ":bd<CR>")
-- keymap("n", "<leader>x", ":bd<CR>")

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
keymap("n", "<leader>tt", ":Telescope resume<CR>")
keymap("n", "<leader>tm", ":Telescope marks<CR>")
keymap("n", "<leader>tr", ":Telescope registers<CR>")

-- LSP
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local lsp_keymap = require("user.utils").keymap_fun_gen({ noremap = true, silent = true, buffer = ev.buf })

		lsp_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
		lsp_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		lsp_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
		-- keymap("n", "gr", ":Telescope lsp_references<CR>")
		lsp_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		lsp_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")

		lsp_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		lsp_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

		lsp_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
		lsp_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		lsp_keymap("n", "<leader>fm", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name ~= "tsserver"
				end,
			})
		end, { desc = "Format" })
	end,
})
