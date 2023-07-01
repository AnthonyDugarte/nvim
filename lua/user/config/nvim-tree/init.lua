local keymaps = require("user.config.nvim-tree.keymaps")

local api = require("nvim-tree.api")

-- Automatically open files on creation
-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#automatically-open-file-upon-creation
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5

require("nvim-tree").setup({
	filters = {
		custom = { ".git$" },
	},
	git = {
		enable = true,
		ignore = false,
	},
	sync_root_with_cwd = true,
	renderer = {
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
	},
	view = {
		relativenumber = true,
		width = {
			min = 30,
			max = 70,
		},
	},
	actions = {
		open_file = {
			quit_on_open = false,
		}
	},
	diagnostics = {
		enable = true,
	},
	on_attach = keymaps.on_attach,
})
