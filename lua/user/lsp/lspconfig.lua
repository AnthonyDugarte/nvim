local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
	return
end

-- No need to manually install lsp servers, they get installed when configured
mason_lspconfig.setup({})

-- cmp specific config
local cmp_status_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
	return
end

local capabilities = cmp_lsp.default_capabilities()

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local servers = { "tsserver", "pyright", "lua_ls", "clangd", "kotlin_language_server", "sqlls", "marksman" }

for _, server in pairs(servers) do
	local server_config_status_ok, server_config = pcall(require, "user.lsp.servers." .. server)

	local config = {
		-- on_attach = on_attach,
		capabilities = capabilities,
	}

	if server_config_status_ok then
		for k, v in pairs(server_config) do
			config[k] = v
		end
	end

	lspconfig[server].setup(config)
end
