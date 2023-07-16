local keymaps = require("user.config.nvim-tree.keymaps")

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

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		custom = { ".git$" },
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
})
