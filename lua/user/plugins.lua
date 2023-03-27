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
		tag = "nightly", -- updated every week. (see issue #1193)
	})

	-- Status Line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	-- Buffer tabs
	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
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
	use({ "nvim-telescope/telescope-ui-select.nvim" })

	-- Terminal switching
	use({
		"akinsho/toggleterm.nvim",
		tag = "2.3.0",
	})

	-- Whichkey
	use("folke/which-key.nvim")

	-- cmdline / message / popupmenu UI
	use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } })

	-- --------------------------------------------------------------------------------------
	-- LSP
	-- --------------------------------------------------------------------------------------

	-- Core
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")

	-- null-ls
	use("jose-elias-alvarez/null-ls.nvim")
	use("jay-babu/mason-null-ls.nvim")

	-- UI
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

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
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

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
	use("nvim-treesitter/nvim-treesitter")
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

	-- --------------------------------------------------------------------------------------
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
