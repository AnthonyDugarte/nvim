local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- --------------------------------------------------------------------------------------
	-- Visual Things
	-- --------------------------------------------------------------------------------------

	-- Dashboard
	use({ "goolord/alpha-nvim", requires = { "nvim-tree/nvim-web-devicons" } })

	-- File Explorer
	use({
		"nvim-tree/nvim-tree.lua",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Buffer tabs
	use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
	use("tiagovla/scope.nvim")

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Terminal switching
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
	})

	-- Whichkey
	use("folke/which-key.nvim")

	-- --------------------------------------------------------------------------------------
	-- LSP
	-- --------------------------------------------------------------------------------------

	-- Core
	use({
		"williamboman/mason.nvim",
		run = ":MasonUpdate",
	})
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	use({ "stevearc/dressing.nvim" })

	-- --------------------------------------------------------------------------------------
	-- CMP
	-- --------------------------------------------------------------------------------------

	-- core
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- nice icons
	use("onsails/lspkind.nvim")

	-- Snippets
	use("saadparwaiz1/cmp_luasnip")
	use({
		"L3MON4D3/LuaSnip",
		run = "make install_jsregexp",
	})
	use("rafamadriz/friendly-snippets")
	use("zbirenbaum/copilot-cmp")

	-- --------------------------------------------------------------------------------------
	-- Editor
	-- --------------------------------------------------------------------------------------

	-- Indent lines
	use("lukas-reineke/indent-blankline.nvim")

	-- Surround ys/ds/cs
	use({ "kylechui/nvim-surround", tag = "*" })

	-- Holy gcc gbc
	use("numToStr/Comment.nvim")

	-- project specific config
	use("gpanders/editorconfig.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- yank history
	use({ "AckslD/nvim-neoclip.lua", requires = { { "nvim-telescope/telescope.nvim" } } })

	-- --------------------------------------------------------------------------------------
	-- Tools
	-- --------------------------------------------------------------------------------------

	-- Dap
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- AI
	-- Copilot
	use("zbirenbaum/copilot.lua")

	-- --------------------------------------------------------------------------------------
	-- Theming
	-- --------------------------------------------------------------------------------------

	-- Colorschemes
	use("folke/tokyonight.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("f-person/auto-dark-mode.nvim")

	-- --------------------------------------------------------------------------------------
	-- Misc
	-- --------------------------------------------------------------------------------------
	use("tweekmonster/startuptime.vim")
	use("nathom/filetype.nvim")
	use("rmagatti/auto-session")

	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- --------------------------------------------------------------------------------------
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
