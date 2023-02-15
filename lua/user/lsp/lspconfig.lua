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

local keymap = vim.api.nvim_set_keymap

local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
	keymap("n", "gd", vim.lsp.buf.definition, bufopts)
	keymap("n", "K", vim.lsp.buf.hover, bufopts)
	keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
	keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	keymap("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	keymap("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	keymap("n", "<space>ca", vim.lsp.buf.code_action, bufopts)

	keymap("n", "gr", vim.lsp.buf.references, bufopts)

	keymap("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)
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
