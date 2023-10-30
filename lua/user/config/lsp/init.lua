vim.diagnostic.config({
	virtual_text = {
		prefix = "●", -- Could be '●', '▎', 'x'
	},
})

require("user.config.lsp.lspconfig")
-- require("user.config.lsp.null-ls")
