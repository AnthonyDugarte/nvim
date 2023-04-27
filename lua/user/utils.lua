local M = {}

M.keymap_fun_gen = function(default_opts)
	return function(mode, lhs, rhs, provided_opts)
		local opts = vim.tbl_extend("keep", provided_opts or {}, default_opts)
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

M.keymap = M.keymap_fun_gen({ noremap = true, silent = true })

return M
