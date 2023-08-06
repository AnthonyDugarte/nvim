return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = true,
		config = function()
			vim.cmd([[colorscheme catppuccin-frappe]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
