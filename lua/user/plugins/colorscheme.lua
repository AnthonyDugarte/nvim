return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		enabled = false,
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
				lsp_trouble = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				mason = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
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
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
}
