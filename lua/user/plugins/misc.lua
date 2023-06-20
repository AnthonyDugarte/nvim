return {
	{
		"rmagatti/auto-session",
		opts = {
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			session_lens = {
				load_on_setup = false,
			},
		},
	},
	{
		"nathom/filetype.nvim",
		enabled = false,
		opts = {
			overrides = {
				extensions = {
					mjml = "html",
				},
			},
		},
	},
	{
		"jackMort/ChatGPT.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {
			api_key_cmd = "gpg --decrypt " .. vim.fn.expand("$HOME") .. "/.secret/openai.txt.gpg",
		},
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions", "ChatGPTRun" },
	},
}
