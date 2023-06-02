return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			default = true,
			color_icons = true,
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			integrations = {
				bufferline = true,
				cmp = true,
				fidget = true,
				gitsigns = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				mason = true,
				native_lsp = {
					enabled = true,
				},
				nvimtree = true,
				telescope = true,
				treesitter = true,
				which_key = true,
			},
		},
		config = function()
			vim.cmd([[colorscheme catppuccin-frappe]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "catppuccin",
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"akinsho/bufferline.nvim",
		enabled = false,
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			{
				"tiagovla/scope.nvim",
				opts = {},
			},
			"catppuccin/nvim",
		},
		opts = function()
			return {
				highlights = require("catppuccin.groups.integrations.bufferline").get(),
				options = {
					diagnostics = "nvim_lsp",
					separator_style = "slant",
					show_buffer_close_icons = false,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							highligh = "Directory",
							sparator = true,
							padding = 1,
						},
					},
				},
			}
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle", "NvimTreeOpen", "NvimTreeFocus" },
		config = function()
			require("user.config.nvim-tree")
		end,
	},
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		opts = {
			char = "┊",
			use_treesitter = true,
			show_current_context = true,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"AckslD/nvim-neoclip.lua",
				opts = {},
			},
		},
		config = function()
			require("user.config.telescope")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("user.config.toggleterm")
		end,
	},
}
