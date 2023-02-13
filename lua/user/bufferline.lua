local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

bufferline.setup({
	options = {
    diagnostics = "nvim_lsp",
    separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highligh = "Directory",
				sparator = true,
				padding = 1,
			},
		},
	},
})
