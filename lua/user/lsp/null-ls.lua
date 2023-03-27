local status_ok, null_ls = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

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
		-- diagnostics.clang_check,
		-- formatting.clang_format,
	},

	on_attach = on_attach,
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
