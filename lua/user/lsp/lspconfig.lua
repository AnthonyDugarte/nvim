local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
	return
end

-- No need to manually install lsp servers, they get installed when configured
mason_lspconfig.setup({})

-- cmp specific config
local cmp_status_ok, cpm_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	return
end

local capabilities = cpm_lsp.default_capabilities()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local keymap = vim.keymap.set

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", bufopts)
	keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)
	keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", bufopts)
	keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
	keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", bufopts)
	-- keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", bufopts)
	-- keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- keymap("n", "<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
	keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
	keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", bufopts)
	keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", bufopts)
	keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)

	keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", bufopts)
end

local servers = { "tsserver", "pyright", "lua_ls", "clangd" }

for _, server in pairs(servers) do
	local server_config_status_ok, server_config = pcall(require, "user.lsp.servers." .. server)

	local config = {
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server_config_status_ok then
		for k, v in pairs(server_config) do
			config[k] = v
		end
	end

	lspconfig[server].setup(config)
end
