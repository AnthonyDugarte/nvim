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
			integrations = {
				bufferline = true,
				cmp = true,
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
			icons_enabled = false,
			component_separators = "|",
			section_separators = "",
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
		},
		opts = {
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
		config = function()
			require("user.config.nvim-tree")
		end,
	},
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	},
	{
		"folke/which-key.nvim",
		opts = {},
	},
	{
		"AckslD/nvim-neoclip.lua",
		opts = {},
		dependencies = { { "nvim-telescope/telescope.nvim" } },
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			char = "┊",
			use_treesitter = true,
			show_current_context = true,
		},
	},
	{
		"nathom/filetype.nvim",
		opts = {
			overrides = {
				extensions = {
					mjml = "html",
				},
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
			fast_wrap = {},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("user.config.gitsigns")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("user.config.treesitter")
		end,
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			api_key_cmd = "gpg --decrypt ~/.secret/openai.txt.gpg 2>/dev/null",
		},
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions", "ChatGPTRun" },
	},

	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			{
				"L3MON4D3/LuaSnip",
				build = "make install_jsregexp",
			},
			"rafamadriz/friendly-snippets",
			{
				"zbirenbaum/copilot-cmp",
				dependencies = {
					{
						"zbirenbaum/copilot.lua",
						opts = {
							suggestion = { enabled = false },
							panel = { enabled = false },
						},
					},
				},
				opts = {},
			},
		},
		config = function()
			require("user.config.cmp")
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("user.config.toggleterm")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = function()
			require("user.config.telescope")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				opts = {},
			},
			{ "williamboman/mason-lspconfig.nvim", opts = {} },
			"jose-elias-alvarez/null-ls.nvim",
			"hrsh7th/cmp-nvim-lsp",
			{ "j-hui/fidget.nvim", opts = {} },
		},
		config = function()
			require("user.config.lsp")
		end,
	},
}
