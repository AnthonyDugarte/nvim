local telescope = require("telescope")
local trouble = require("trouble.providers.telescope")

telescope.load_extension("fzf")
telescope.load_extension("neoclip")
telescope.load_extension("live_grep_args")

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},

		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
})
