local cmp_lsp = require("cmp_nvim_lsp")
local lspconfig = require("lspconfig")

local capabilities = cmp_lsp.default_capabilities()

local servers = {
	{
		"tsserver",
		{
			on_attach = function(client, bufnr)
				local function organize_imports()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
					}
					vim.lsp.buf.execute_command(params)
				end

				local lsp_keymap = require("user.utils").keymap_fun_gen({
					noremap = true,
					silent = true,
					buffer = bufnr,
				})

				vim.api.nvim_buf_create_user_command(
					bufnr,
					"OrganizeImports",
					organize_imports,
					{ desc = "Organize Imports" }
				)

				lsp_keymap("n", "<leader>fi", "<Cmd>:OrganizeImports<CR>", { desc = "Organize [I]mports [F]ormat" })
			end,
		},
	},
	"pyright",
	"lua_ls",
	"clangd",
	"kotlin_language_server",
	"sqlls",
	"marksman",
	{
		"jsonls",
		{
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		},
	},
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
