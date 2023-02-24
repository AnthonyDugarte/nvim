local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "slant",
		show_buffer_close_icons = false,
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
