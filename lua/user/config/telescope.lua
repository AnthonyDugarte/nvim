local telescope = require("telescope")

telescope.load_extension("fzf")
telescope.load_extension("neoclip")

telescope.setup({
	defaults = {
		layout_config = {
			prompt_position = "top",
		},
	},
})
