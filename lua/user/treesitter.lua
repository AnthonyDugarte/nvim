local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = "all",
	ignore_install = { "php", "phpdoc", "java", "fortran" },
	highligh = {
		enabled = true,
	},
	indent = {
		enabled = true,
	},
	autotag = {
		enabled = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
