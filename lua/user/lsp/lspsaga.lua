local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.setup({
	-- Hide winbar
	symbol_in_winbar = {
		enable = false,
	},
})
