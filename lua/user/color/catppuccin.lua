local status_ok, catppuccin = pcall(require, "catppuccin")

if not status_ok then
	return
end

catppuccin.setup({
	integrations = {
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},

		bufferline = true,
		cmp = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		which_key = true,
	},
})
