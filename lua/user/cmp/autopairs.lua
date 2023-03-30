local comp_autopairs_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not comp_autopairs_ok then
	return
end

local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
	return
end

-- Autopairs + completition = :)
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
