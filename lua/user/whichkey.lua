local status_ok, whickey = pcall(require, "which-key")

if not status_ok then
	return
end

vim.o.timeout = true
vim.o.timeoutlen = 300

whickey.setup({})
