local status_ok, noice = pcall(require, "noice")

if not status_ok then
	return
end

noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},

	cmdline = {
		enabled = true,
		view = "cmdline",
	},

	views = {
		cmdline_popup = {
			border = {
				style = "none",
				padding = { 2, 3 },
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
})
