local status_ok, gitsigns = pcall(require, "gitsigns")

if not status_ok then
	return
end

local on_attach = function(bufnr)
	local keymap = require("user.utils").keymap_fun_gen({ buffer = bufnr })

	keymap("n", "[c", function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gitsigns.prev_hunk()
		end)
		return "<Ignore>"
	end, { desc = "Jump to prev hunk", expr = true })

	keymap("n", "]c", function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gitsigns.next_hunk()
		end)
		return "<Ignore>"
	end, { desc = "Jump to next hunk", expr = true })

	keymap("n", "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>")
	keymap("n", "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>")
	keymap("v", "<leader>hs", function()
		gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end)
	keymap("v", "<leader>hr", function()
		gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
	end)
	keymap("n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>")
	keymap("n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>")
	keymap("n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>")
	keymap("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>")
	keymap("n", "<leader>hb", function()
		gitsigns.blame_line({ full = true })
	end, { desc = "Blame Line" })
	keymap("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
	keymap("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
	keymap("n", "<leader>hD", function()
		gitsigns.diffthis("~")
	end, { desc = "Diff this" })
	keymap("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
end

gitsigns.setup({
	on_attach = on_attach,
})
