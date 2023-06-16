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
			api_key_cmd = "gpg --decrypt ~/.secret/openai.txt.gpg 2>/dev/null",
		},
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions", "ChatGPTRun" },
	},
}
