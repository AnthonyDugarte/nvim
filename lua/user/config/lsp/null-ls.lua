local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.prettier,
		diagnostics.eslint,

		formatting.stylua,

		diagnostics.flake8.with({
			prefer_local = ".venv/bin",
		}),
		formatting.black.with({
			prefer_local = ".venv/bin",
		}),

		diagnostics.terraform_validate,
		formatting.terraform_fmt,

		code_actions.gitsigns,
	},
})
