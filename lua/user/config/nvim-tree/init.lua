local keymaps = require("user.config.nvim-tree.keymaps")

local api = require("nvim-tree.api")

-- Automatically open files on creation
-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#automatically-open-file-upon-creation
api.events.subscribe(api.events.Event.FileCreated, function(file)
	vim.cmd("edit " .. file.fname)
end)

-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "NvimTree*",
	callback = function()
		if not api.tree.is_visible() then
			api.tree.open()
		end
	end,
})

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
		-- float = {
		-- 	enable = true,
		-- 	open_win_config = function()
		-- 		local screen_w = vim.opt.columns:get()
		-- 		local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
		-- 		local window_w = screen_w * WIDTH_RATIO
		-- 		local window_h = screen_h * HEIGHT_RATIO
		-- 		local window_w_int = math.floor(window_w)
		-- 		local window_h_int = math.floor(window_h)
		-- 		local center_x = (screen_w - window_w) / 2
		-- 		local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
		-- 		return {
		-- 			border = "rounded",
		-- 			relative = "editor",
		-- 			row = center_y,
		-- 			col = center_x,
		-- 			width = window_w_int,
		-- 			height = window_h_int,
		-- 		}
		-- 	end,
		-- },
		-- width = function()
		-- 	return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		-- end,
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
