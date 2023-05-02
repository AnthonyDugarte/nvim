local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
	return
end

catppuccin.setup({
	-- transparent_background = true,
	integrations = {
		alpha = true,
		bufferline = true,
		cmp = true,
		gitsigns = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		-- lsp_saga = true,
		mason = true,
		-- notify = true,
		native_lsp = {
			enabled = true,
		},
		nvimtree = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
})
