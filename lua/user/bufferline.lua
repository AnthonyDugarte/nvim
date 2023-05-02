local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
	return
end

local catppuccin_ok, catppuccin_integration = pcall(require, "catppuccin.groups.integrations.bufferline")

bufferline.setup({
	highlights = catppuccin_ok and catppuccin_integration.get() or nil,
	options = {
		diagnostics = "nvim_lsp",
		-- separator_style = "slant",
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
