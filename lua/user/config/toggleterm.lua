local toggleterm = require("toggleterm")

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	insert_mappings = true,
	terminal_mappings = true,
	direction = "float",
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
	count = 99,
})

function _lazygit_toggle()
	lazygit:toggle()
end

require("user.utils").keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { desc = "Lazy Git" })
