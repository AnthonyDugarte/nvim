local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local keymaps = require("user.nvim-tree.keymaps")

local api = require("nvim-tree.api")

-- Automatically open files on creation
-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#automatically-open-file-upon-creation
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

nvim_tree.setup({
	filters = {
		custom = { ".git$" },
	},
	git = {
		enable = true,
		ignore = false,
	},
	sync_root_with_cwd = true,
	view = {
		width = {
			min = 30,
			max = 300,
		},
		-- side = "right",
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
	diagnostics = {
		enable = true,
	},
	on_attach = keymaps.on_attach,
})
