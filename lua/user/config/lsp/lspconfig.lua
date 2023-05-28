local cmp_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local capabilities = cmp_lsp.default_capabilities()

local servers = {
	{
		"tsserver",
		{
			commands = {
				OrganizeImports = {
					function()
						local params = {
							command = "_typescript.organizeImports",
							arguments = { vim.api.nvim_buf_get_name(0) },
							title = "",
						}
						vim.lsp.buf.execute_command(params)
					end,
					description = "Organize Imports",
				},
			},
		},
	},
	"pyright",
	"lua_ls",
	"clangd",
	"kotlin_language_server",
	"sqlls",
	"marksman",
}

for _, server_spec in pairs(servers) do
	local is_table_spec = type(server_spec) == "table"

	local server = is_table_spec and server_spec[1] or server_spec

	local server_config = is_table_spec and server_spec[2] or {}

	local config = vim.tbl_extend("keep", {
		capabilities = capabilities,
	}, server_config)

	lspconfig[server].setup(config)
end
