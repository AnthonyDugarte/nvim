local status_ok, identline = pcall(require, "indent_blankline")

if not status_ok then
	return
end

identline.setup({
	char = '┊',
	use_treesitter = true,
	show_current_context = true,
	-- show_current_context_start = true,
})
