local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	insert_mappings = true,
	terminal_mappings = false,
	direction = "float",
	shade_terminals = true,
	shading_factor = 2,

	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	hidden = true,
	direction = "tab",
	on_open = function(_)
		vim.cmd("startinsert!")
		vim.cmd("set laststatus=0")
	end,
	on_close = function(_)
		vim.cmd("set laststatus=3")
	end,
	count = 99,
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
