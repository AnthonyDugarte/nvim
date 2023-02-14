local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
	return
end

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

telescope.setup({})
