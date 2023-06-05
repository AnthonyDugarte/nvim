return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			require("user.config.gitsigns")
		end,
	},

	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
}
