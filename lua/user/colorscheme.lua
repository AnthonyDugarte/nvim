local colorscheme = "catppuccin-latte"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

local auto_dark_ok, auto_dark = pcall(require, "auto-dark-mode")

if not auto_dark_ok then
	return
end

auto_dark.setup({
	update_interval = 5000,
	set_dark_mode = function()
		vim.api.nvim_set_option("background", "dark")
		vim.cmd("colorscheme catppuccin")
	end,
	set_light_mode = function()
		vim.api.nvim_set_option("background", "light")
		vim.cmd("colorscheme catppuccin-frappe")
	end,
})
auto_dark.init()
