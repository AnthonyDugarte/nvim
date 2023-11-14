return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			fast_wrap = {},
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		opts = {},
		event = "BufRead",
	},
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		event = "BufRead",
		opts = function()
			return {
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufRead",
		build = ":TSUpdate",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			{
				"windwp/nvim-ts-autotag",
				config = false
			},
		},
		opts = {
			ensure_installed = { "lua", "javascript", "typescript", "tsx" },
			ignore_install = { "php", "phpdoc", "java", "fortran" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
			},
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = false,

			},
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
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
				opts = {
					fix_pairs = false,
				},
			},
		},
		config = function()
			require("user.config.cmp")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufRead",
		dependencies = {
			{
				"williamboman/mason.nvim",
				build = ":MasonUpdate",
				opts = {
					ui = {
						icons = {
							package_pending = " ",
							package_installed = "󰄳 ",
							package_uninstalled = " 󰚌",
						},
					},
				},
			},
			{
				"williamboman/mason-lspconfig.nvim",
				opts = {
					-- lspconfig servers should be automatically installed
					automatic_installation = true,
				},
				dependencies = {
					"williamboman/mason.nvim",
				},
			},
			{
				"jose-elias-alvarez/null-ls.nvim",
				enabled = false,
			},
			"hrsh7th/cmp-nvim-lsp",
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			"b0o/schemastore.nvim",
		},
		config = function()
			require("user.config.lsp")
		end,
	},
}
