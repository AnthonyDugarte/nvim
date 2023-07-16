return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			default = true,
			color_icons = true,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				disabled_filetypes = { "NvimTree" },
			},
			sections = {
				lualine_z = { { "datetime", style = "%H:%M" } },
			},
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
			-- "catppuccin/nvim",
		},
		opts = function()
			return {
				-- highlights = require("catppuccin.groups.integrations.bufferline").get(),
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
		init = function()
			-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#workaround-when-using-rmagattiauto-session
			vim.api.nvim_create_autocmd({ "BufEnter" }, {
				pattern = "NvimTree*",
				callback = function()
					local api = require("nvim-tree.api")

					if not api.tree.is_visible() then
						api.tree.open()
					end
				end,
			})
		end,
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
		priority = 999,
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
			{
				"AckslD/nvim-neoclip.lua",
				opts = {},
			},
			"nvim-telescope/telescope-live-grep-args.nvim",
			"folke/trouble.nvim",
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
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = { "TroubleToggle", "Trouble" },
	},
}
