local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	sources = {
		formatting.prettier,
		diagnostics.eslint,
		formatting.stylua,
		diagnostics.flake8,
	},
})

local mason_status_ok, mason_null_ls = pcall(require, "mason-null-ls")

if not mason_status_ok then
	return
end

mason_null_ls.setup({
	ensure_installed = nil,
	automatic_setup = false,
	automatic_installation = true,
})
