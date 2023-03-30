local copilot_status_ok, copilot = pcall(require, "copilot")
if not copilot_status_ok then
	return
end

local status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not status_ok then
	return
end

copilot_cmp.setup({})
