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
			extentions = { "toggleterm", "nvim-tree" },
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
		opts = {
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
		},
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
		opts = function(_, opts)
			local keymaps = require("user.config.nvim-tree")

			return vim.tbl_deep_extend("keep", {
				filters = {
					dotfiles = false,
					custom = { ".git$" },
					exclude = { ".env", ".npmrc" },
				},
				git = {
					enable = true,
					ignore = true,
				},
				hijack_cursor = true,
				sync_root_with_cwd = true,
				renderer = {
					root_folder_modifier = ":t",
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
				diagnostics = {
					enable = true,
				},
				on_attach = keymaps.on_attach,
			}, opts)
		end,
		config = function(_, opts)
			local api = require("nvim-tree.api")

			-- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#go-to-last-used-hidden-buffer-when-deleting-a-buffer
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					-- Only 1 window with nvim-tree left: we probably closed a file buffer
					if #vim.api.nvim_list_wins() == 1 and api.tree.is_tree_buf() then
						-- Required to let the close event complete. An error is thrown without this.
						vim.defer_fn(function()
							-- close nvim-tree: will go to the last hidden buffer used before closing
							api.tree.toggle({ find_file = true, focus = true })
							-- re-open nivm-tree
							api.tree.toggle({ find_file = true, focus = true })
							-- nvim-tree is still the active window. Go to the previous window.
							vim.cmd("wincmd p")
						end, 0)
					end
				end,
			})

			require("nvim-tree").setup(opts)
		end,
	},
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		priority = 999,
		main = "ibl",
		opts = {
			indent = { char = "┊" },
			scope = { enabled = true },
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
