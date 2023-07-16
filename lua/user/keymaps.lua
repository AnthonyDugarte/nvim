local keymap = require("user.utils").keymap

keymap("", "<Space>", "<Nop>")

-- Remap for dealing with word wrap
-- keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
-- keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

keymap("n", "<leader>cc", ":bp<CR>:bd #<CR>", { desc = "[CC]lose Buffer" })

-- TreeToggle
keymap("n", "<leader>e", ":NvimTreeToggle<cr>")
keymap("n", "<leader>o", ":NvimTreeFindFileToggle<cr>")

keymap("n", "<leader>tn", "<cmd> set nu! <CR>", { desc = "[T]oggle line [N]umber" })
keymap("n", "<leader>trn", "<cmd> set rnu! <CR>", { desc = "[T]oggle relative [N]umber" })

-- Buffers
-- keymap("n", "<leader>bd", ":bd<CR>")
-- keymap("n", "<leader>x", ":bd<CR>")

-- Visual
-- Keep visual mode on identation
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Telescope
keymap("n", "<leader>?", ":Telescope oldfiles<CR>", { desc = "[?] Find recently opened files" })
keymap("n", "<leader><space>", ":Telescope buffers<CR>", { desc = "[ ] Find existing buffers" })
keymap("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
-- keymap("n", "<leader>gf", ":Telescope git_files<CR>", { desc = "Search [G]it [F]iles" })
keymap("n", "<leader>sf", ":Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
keymap("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
keymap("n", "<leader>sw", ":Telescope grep_string<CR>", { desc = "[S]earch current [W]ord" })
keymap("n", "<leader>sg", ":Telescope live_grep_args<CR>", { desc = "[S]earch by [G]rep" })
keymap("n", "<leader>sd", ":Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
keymap("n", "<leader>tt", ":Telescope resume<CR>", { desc = "[T]elescope [T]oggle" })
keymap("n", "<leader>sm", ":Telescope marks<CR>", { desc = "[S]earch [M]arks" })
keymap("n", "<leader>sr", ":Telescope registers<CR>", { desc = "[S]earch [R]egisters" })

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true })
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true })
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true })

-- LSP
keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev { float = { border = "rounded" } }<CR>')
keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next { float = { border = "rounded" } }<CR>')
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local lsp_keymap = require("user.utils").keymap_fun_gen({ noremap = true, silent = true, buffer = ev.buf })

		lsp_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
		lsp_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")

		lsp_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
		-- lsp_keymap("n", "gr", ":Telescope lsp_references<CR>")
		lsp_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<CR>")

		lsp_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { desc = "[G]o to [I]mplementation" })
		lsp_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")

		lsp_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		lsp_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

		lsp_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
		lsp_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		lsp_keymap("n", "<leader>fm", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name ~= "tsserver" and client.name ~= "lua_ls"
				end,
			})
		end, { desc = "[F]or[m]at" })
	end,
})
