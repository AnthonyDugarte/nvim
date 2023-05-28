local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_lsp.default_capabilities()

local lspconfig = require("lspconfig")

local servers = { "tsserver", "pyright", "lua_ls", "clangd", "kotlin_language_server", "sqlls", "marksman" }

for _, server in pairs(servers) do
	local server_config_status_ok, server_config = pcall(require, "user.config.lsp.servers." .. server)

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
