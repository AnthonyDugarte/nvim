local status_ok, whickey = pcall(require, "which-key")

if not status_ok then
	return
end

whickey.setup({})
